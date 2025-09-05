LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
USE work.cond_compilation_package.all;
USE work.aux_package.all;


ENTITY MCU_tb IS
	generic( 
		WORD_GRANULARITY 	: boolean := G_WORD_GRANULARITY;
		MODELSIM 				: integer := G_MODELSIM;
		DATA_BUS_WIDTH 		: integer := 32;
		ITCM_ADDR_WIDTH 		: integer := G_ADDRWIDTH;
		DTCM_ADDR_WIDTH 		: integer := G_ADDRWIDTH;
		PC_WIDTH 				: integer := 10;
		FUNCT_WIDTH 			: integer := 6;
		DATA_WORDS_NUM 		: integer := G_DATA_WORDS_NUM;
		CLK_CNT_WIDTH 		: integer := 16;
		INST_CNT_WIDTH 		: integer := 16;
		ADDR_BUS_WIDTH 		: integer := 12;
		CTRL_BUS_WIDTH 		: INTEGER := 8
	);
END MCU_tb;

ARCHITECTURE struct OF MCU_tb IS
   SIGNAL rst_tb_w 			: STD_LOGIC;
   SIGNAL clk_tb_w 			: STD_LOGIC;
   SIGNAL switches_tb_w 	: STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL KEY1_w 			: STD_LOGIC;
   SIGNAL KEY2_w 			: STD_LOGIC;
   SIGNAL KEY3_w 			: STD_LOGIC;
   SIGNAL HEX0_w 			: STD_LOGIC_VECTOR(6 DOWNTO 0);
   SIGNAL HEX1_w 			: STD_LOGIC_VECTOR(6 DOWNTO 0);
   SIGNAL HEX2_w    		: STD_LOGIC_VECTOR(6 DOWNTO 0);
   SIGNAL HEX3_w 			: STD_LOGIC_VECTOR(6 DOWNTO 0);
   SIGNAL HEX4_w 			: STD_LOGIC_VECTOR(6 DOWNTO 0);
   SIGNAL HEX5_w 			: STD_LOGIC_VECTOR(6 DOWNTO 0);
   SIGNAL LEDR_w 			: STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL PWM_out_w 		: STD_LOGIC;
   SIGNAL control_bus_w 	: STD_LOGIC_VECTOR(CTRL_BUS_WIDTH-1 DOWNTO 0);
   SIGNAL addr_bus_w 		: STD_LOGIC_VECTOR(ADDR_BUS_WIDTH-1 DOWNTO 0);
   SIGNAL data_bus_w 		: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
   SIGNAL pc_w				: STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
   SIGNAL instruction_w		: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
   SIGNAL memWriteTop_w 	: STD_LOGIC;
   SIGNAL memReadTop_w 	: STD_LOGIC;
   
BEGIN

	MCU_Unit : MCU
	generic map(
		WORD_GRANULARITY, MODELSIM, DATA_BUS_WIDTH, ITCM_ADDR_WIDTH, DTCM_ADDR_WIDTH, PC_WIDTH,
		FUNCT_WIDTH, DATA_WORDS_NUM, CLK_CNT_WIDTH, INST_CNT_WIDTH, ADDR_BUS_WIDTH, CTRL_BUS_WIDTH
	)
	PORT MAP (
		clk_i 				=> clk_tb_w,
		rst_i 				=> rst_tb_w,
		switches_pher_input 	=> switches_tb_w,
		KEY1_input 			=> KEY1_w,
		KEY2_input 			=> KEY2_w,
		KEY3_input 			=> KEY3_w,
		HEX0_pher_output 	=> HEX0_w,
		HEX1_pher_output 	=> HEX1_w,
		HEX2_pher_output 	=> HEX2_w,
		HEX3_pher_output 	=> HEX3_w,
		HEX4_pher_output 	=> HEX4_w,
		HEX5_pher_output 	=> HEX5_w,
		LEDR_pher_output 	=> LEDR_w,
		PWM_o 				=> PWM_out_w,
		pc_o				=> pc_w,
		ControlBus_o 		=> control_bus_w,
		AddrBus_o 			=> addr_bus_w,
		DataBus_o 			=> data_bus_w,
		instruction_o			=> instruction_w, 
		memWriteTop_o 		=> memWriteTop_w,
		memReadTop_o 		=> memReadTop_w,
		Master_CLK_o 		=> open,
		signal_CLK_o 		=> open,
		test_pin_0_o 			=> open,
		test_pin_1_o 			=> open,
		test_pin_2_o 			=> open,
		test_pin_3_o 			=> open
	);
--------------------------------------------------------------------	
	gen_clk :
	process
        begin
		  clk_tb_w <= '1';
		  wait for 50 ns;
		  clk_tb_w <= not clk_tb_w;
		  wait for 50 ns;
    end process;
	
	gen_rst :
	process
        begin
			rst_tb_w <= '1';
			wait for 80 ns;
			rst_tb_w <= '0';
			wait;
    end process;
	
	--------------------------------- test reset mid-run ---------------------------------
	-- gen_rst :
	-- process
        -- begin
			-- rst_tb_w <= '1';
			-- wait for 80 ns;
			-- rst_tb_w <= '0';
			-- wait for 10 us;
			-- rst_tb_w <= '1';
			-- wait for 500 ns;
			-- rst_tb_w <= '0';
    -- end process;
	--------------------------------- GPIO tests ---------------------------------
	-- ########################### RUN GPIO TESTS FROM "M9K faster cooldown" FOLDERS #####################################
	-- (the delay in the original files is for quartus, it is too big to see any changes in ModelSim in reasonable runtime)
	--------------------------------- GPIO test0 ---------------------------------
	-- no need for extra processes
	--------------------------------- GPIO test1 + test2 ---------------------------------
	-- gen_SW_input :
	-- process
        -- begin
			-- switches_tb_w <= "00000000";
			-- wait for 1 us;
			-- switches_tb_w <= "00000001";
			-- wait for 6 us;
			-- switches_tb_w <= "00000010";
			-- wait for 4 us;
			-- switches_tb_w <= "00000100";
			-- wait;
			-- switches_tb_w <= "00000011";
			-- wait for 4 us;
    -- end process;
	--------------------------------- Interrupt based IO test1 ---------------------------------
	-- input :
	-- process
        -- begin
		-- -- run simulation for 5 us
			-- switches_tb_w <= "11111111";
			-- KEY1_w <= '1';
			-- KEY2_w <= '1';
			-- KEY3_w <= '1';
			-- wait for 1000 ns;
			-- KEY1_w <= '0'; -- press key 1
			-- wait for 200 ns;
			-- KEY1_w <= '1';
			-- wait for 400 ns;
			
			-- switches_tb_w <= "00000100";
			-- wait for 0.7 us;
			-- KEY2_w <= '0'; -- press key 2
			-- wait for 200 ns;
			-- KEY2_w <= '1';
			-- wait for 400 ns;
			
			-- switches_tb_w <= "00000011";
			-- wait for 0.7 us;
			-- KEY3_w <= '0'; -- press key 3
			-- wait for 200 ns;
			-- KEY3_w <= '1';
			-- wait;
			
    -- end process;
	--------------------------------- Interrupt based IO test2 + test3 + test4 + test5 ---------------------------------
	-- test2 tests BT peripheral output and PWM wave
		-- test 2 needs to be ran for 1000 us * 6 at least, and then you will see LED output and PWM change
	-- test3 tests BT interrupts
		-- running test 3 for 50 us is enough to see changes in LED output, ITCM is test3\bin\M9K\ITCM faster timer.hex
	-- test 4 tests FIR filter peripheral
		-- run in jumps of 50 us at least, expecting 20 words in DTCM after the word with value x"00000014", these are the filter results
	process
        begin
			switches_tb_w <= "11111111";
			KEY1_w <= '1';
			KEY2_w <= '1';
			KEY3_w <= '1';
			wait;
    end process;
	
END struct;
