LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY FIR_Filter_Comp IS
	generic(
		REGISTER_WIDTH : integer := 32;
		M : integer := 8;
		W : integer := 24;
		q : integer := 8;
		k : integer := 8; -- Queue size
		log2_of_k : integer := 3
	);
	PORT(
	-- FIFO Queue
		FIRIN		: IN 	STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
		FIFORST		: IN 	STD_LOGIC;
		FIFOCLK		: IN 	STD_LOGIC;
		FIFOWEN 	: IN 	STD_LOGIC;
		FIFOFULL	: OUT 	STD_LOGIC;
		FIFOEMPTY	: OUT 	STD_LOGIC;
	-- FIR Filter
		COEF0		: IN 	std_logic_vector(q-1 downto 0);
		COEF1		: IN 	std_logic_vector(q-1 downto 0);
		COEF2		: IN 	std_logic_vector(q-1 downto 0);
		COEF3		: IN 	std_logic_vector(q-1 downto 0);
		COEF4		: IN 	std_logic_vector(q-1 downto 0);
		COEF5		: IN 	std_logic_vector(q-1 downto 0);
		COEF6		: IN 	std_logic_vector(q-1 downto 0);
		COEF7		: IN 	std_logic_vector(q-1 downto 0);
		FIRCLK		: IN 	STD_LOGIC;
		FIRRST		: IN 	STD_LOGIC;
		FIRENA		: IN 	STD_LOGIC;
		FIRIFG		: OUT 	STD_LOGIC;
		FIROUT		: OUT	STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END FIR_Filter_Comp;

ARCHITECTURE behavior OF FIR_Filter_Comp IS
-- FIFO Queue and Pulse Synchronizer Signals
	TYPE QUEUE IS ARRAY (0 TO k-1) OF STD_LOGIC_VECTOR(W-1 DOWNTO 0);
	
	SIGNAL FIFO_queue 		: QUEUE;
	SIGNAL r_ptr 			: STD_LOGIC_VECTOR(log2_of_k-1 DOWNTO 0);
	SIGNAL w_ptr 			: STD_LOGIC_VECTOR(log2_of_k-1 DOWNTO 0);
	SIGNAL QUEUE_full 		: STD_LOGIC;
	SIGNAL QUEUE_empty 	: STD_LOGIC;
	SIGNAL FIFOREN 		: STD_LOGIC;
	
	SIGNAL firclk_s1 			: std_logic := '0';  -- 2-FF synchronizer in FIFOCLK domain
	SIGNAL firclk_s2 			: std_logic := '0';  -- 2-FF synchronizer in FIFOCLK domain
	SIGNAL firclk_s2_d 		: std_logic := '0';  -- delayed version for edge detect
	SIGNAL single_FIFOCLK_pulse_per_FIRCLK_cycle : std_logic := '0';  -- 1-cycle pulse in FIFOCLK domain
	
-- FIR Filter Signals
	TYPE X_arr_type IS ARRAY (M-2 DOWNTO 0) OF STD_LOGIC_VECTOR (W-1 DOWNTO 0);
	TYPE P_arr_type IS ARRAY (M-1 DOWNTO 0) OF STD_LOGIC_VECTOR (REGISTER_WIDTH-1 DOWNTO 0);
	TYPE C_arr_type IS ARRAY (M-1 DOWNTO 0) OF STD_LOGIC_VECTOR (q-1 DOWNTO 0);
	TYPE Sum_vec_type IS ARRAY (M-2 DOWNTO 0) OF STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);

	SIGNAL X_array		: X_arr_type;
	SIGNAL P			: P_arr_type;
	SIGNAL sum			: Sum_vec_type;
	SIGNAL C			: C_arr_type;
	SIGNAL FIROUT_w 	: STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
	-- SIGNAL seperator_w 	: STD_LOGIC_VECTOR (W-1 DOWNTO 0);
	
BEGIN
	
-- FIFO Queue Logic - FIR filter input queue
	-- important note: upper logic (FIR_Filter_Peripheral) makes sure FIFOWEN is set for only 1 cycle every time a write is requested
	process(FIFOCLK, FIFORST)
	begin
		if (FIFORST = '1') then
			FOR i IN 0 TO k-1 LOOP
				FIFO_queue(i) <= CONV_STD_LOGIC_VECTOR(0, W);
			END LOOP;
			w_ptr <= (others => '0');
			r_ptr <= (others => '0');
			QUEUE_full <= '0';
			QUEUE_empty <= '1';
		
		elsif (rising_edge(FIFOCLK)) then
			if (FIFOWEN = '1' and QUEUE_full = '0') then -- writing to queue
				FIFO_queue(CONV_INTEGER(w_ptr)) <= FIRIN(W-1 DOWNTO 0);
				w_ptr <= w_ptr + 1;
				
				-- hanlde full\empty queue flags
				if ((w_ptr+1 = r_ptr) and FIFOREN = '0') then -- writing to last free spot and not reading at the same times
					QUEUE_full <= '1';
				else
					QUEUE_full <= '0';
				end if;
				if (FIFOREN = '0') then  -- queue becomes not empty when writing and not reading at the same time
					QUEUE_empty <= '0';
				end if;
				
			end if;
			
			if (FIFOREN = '1' and QUEUE_empty = '0' and FIRENA = '1') then -- reading from queue - queue not empty and FIR ready to receive
				r_ptr <= r_ptr + 1;
				
				-- handle full\empty queue flags
				if ((r_ptr+1 = w_ptr) and FIFOWEN = '0') then -- reading last item and not writing a new item at the same time
					QUEUE_empty <= '1';
				else
					QUEUE_empty <= '0';
				end if;
				if (FIFOWEN = '0') then  -- queue becomes not full when reading and not writing at the same time
					QUEUE_full <= '0';
				end if;
				
			end if;
			
		end if;
	end process;
	
	FIFOFULL <= QUEUE_full;
	FIFOEMPTY <= QUEUE_empty;
	

-- Pulse Synchroniser Logic
	-- FIFO clk is > 100x(FIR clk), this code produces a FIFOCLK length pulse on the rising edge of FIRCLK, only when FIRENA is set
	-- used to advance read pointer of FIFO queue every time FIR filter is finished processing stage (clocked by FIRCLK)
	-- also used for FIRIFG (interrupt to signal FIROUT has new data ready)
	--   FIFOCLK : fast clock
	--   FIRCLK  : slow clock (asynchronous to FIFOCLK)
	process(FIFOCLK, FIFORST)
	begin
		if (FIFORST = '1') then
			firclk_s1   <= '0';
			firclk_s2   <= '0';
			firclk_s2_d <= '0';
		elsif rising_edge(FIFOCLK) then -- 2 flip flop synchronizer to fix meta stability
			firclk_s1   <= FIRCLK; -- first stage
			firclk_s2   <= firclk_s1; -- second stage (metastability filter)
			firclk_s2_d <= firclk_s2; -- 1-cycle delay for edge detection
		end if;
	end process;
	single_FIFOCLK_pulse_per_FIRCLK_cycle <= (firclk_s2 and not firclk_s2_d) and FIRENA;
	FIFOREN <= single_FIFOCLK_pulse_per_FIRCLK_cycle; -- gated by FIRENA
	
	
-- FIR Filter Hardware Logic
	C(0) <= COEF0;
	C(1) <= COEF1;
	C(2) <= COEF2;
	C(3) <= COEF3;
	C(4) <= COEF4;
	C(5) <= COEF5;
	C(6) <= COEF6;
	C(7) <= COEF7;

	-- advance registers data
	process(FIRCLK, FIRRST)
	begin
		if (FIRRST = '1') then
			-- seperator_w <= (others => '0');
			FOR i IN 0 TO M-2 LOOP
				X_array(i) <= (others => '0');
			END LOOP;
		elsif (rising_edge(FIRCLK)) then
			if (FIRENA = '1') then
				-- seperator_w <= FIFO_queue(CONV_INTEGER(r_ptr));
				X_array(0) <= FIFO_queue(CONV_INTEGER(r_ptr));
				FOR i IN M-2 DOWNTO 1 LOOP
					X_array(i) <= X_array(i-1);
				END LOOP;
			end if;
		end if;
	end process;
	
	-- calculate multipliers and sum for final output data
	P(0) <= FIFO_queue(CONV_INTEGER(r_ptr)) * C(0);
	GEN1: FOR i IN 1 TO M-1 GENERATE
		P(i) <= X_array(i-1) * C(i); -- 24bit x 8bit -> 32-bit
	END GENERATE;
	
	sum(0) <= P(0) + P(1);
	GEN2: FOR i IN 1 TO M-2 GENERATE
		sum(i) <= sum(i-1) + p(i+1);
	END GENERATE;
	
	-- Output (gated by FIRENA):
	-- process(FIRCLK, FIRRST)
	-- begin
		-- if (FIRRST) then
			-- FIROUT_w <= (others => '0');
		-- elsif (rising_edge(FIRCLK)) then
			-- if (FIRENA = '1') then
				-- FIROUT_w <= sum(M-2);
			-- end if;
		-- end if;
	-- end process;
	
	FIROUT <= x"00" & sum(M-2)(REGISTER_WIDTH-1 downto 8) WHEN FIRENA = '1' ELSE x"00000000";
	FIRIFG <= single_FIFOCLK_pulse_per_FIRCLK_cycle; -- pulse from pulse synchronizer -- gated by FIRENA
	
END behavior;