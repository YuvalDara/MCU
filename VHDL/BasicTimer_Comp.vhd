LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;

ENTITY BasicTimer_Comp IS
	GENERIC (REGISTER_WIDTH : INTEGER := 32);
	PORT
	( -- BT - Basic Timer
		mclk 				: IN STD_LOGIC; -- master clock
		BTCLR 				: IN STD_LOGIC; -- BT clear/reset
		BTHOLD 			: IN STD_LOGIC; -- BT hold
		BTOUTMD 			: IN STD_LOGIC; -- BT PWM signal output mode
		BTOUTEN 			: IN STD_LOGIC; -- BT PWM signal output enable
		BTSSEL 				: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- BT clock dividor selector
		BTCCR1 				: IN STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0); -- BT lower value input for PWM signal: Mode0 => set, Mode1 -> reset
		BTCCR0 				: IN STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0); -- BT upper value input for PWM signal: Mode0 => reset, Mode1 -> set
		BTIP 				: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- BT interrupt output signal source selector
		BTCNT_write_flag_i 	: IN STD_LOGIC;
		BTCNT_write_value_i	: IN STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
		BTCNT_read_o 		: OUT STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
		BTIFG 				: OUT STD_LOGIC; -- BT interrupt output signal/flag
		PWMout 			: OUT STD_LOGIC -- PWM signal output
	);
END BasicTimer_Comp;

ARCHITECTURE behavior OF BasicTimer_Comp IS

	CONSTANT 	ZERO_REGISTER 	: STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0) := (others => '0');
	SIGNAL 		counter_enable	: STD_LOGIC;
	SIGNAL 		BTCL0, BTCL1 	: STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
	SIGNAL		HEU0 			: STD_LOGIC;
	SIGNAL 		divided_clk 		: STD_LOGIC;
	SIGNAL 		counter_clk 		: STD_LOGIC;
	SIGNAL 		freq_div 		: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL 		div_counter 		: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL 		counterOut		: STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
	SIGNAL 		out_buffer		: STD_LOGIC := '0';

BEGIN
	-- Inputs:
	BTCL0 <= BTCCR0 WHEN counterOut = ZERO_REGISTER ELSE BTCL0;
	BTCL1 <= BTCCR1 WHEN counterOut = ZERO_REGISTER ELSE BTCL1;
	HEU0 <= '1' when counterOut >= BTCL0 else '0';
	counter_enable <= not BTHOLD;
	
	------------------------------------------------------------------
	-- frequncy divider for input clock of the counter
	WITH BTSSEL SELECT freq_div	<=
		"0000" WHEN "01", -- 2
		"0001" WHEN "10", -- 4
		"0011" WHEN "11", -- 8
		"0000" WHEN OTHERS;
	
	counter_clock_modifier :
	process(BTCLR, mclk)
	begin
		if (BTCLR = '1') then
			div_counter <= (others => '0');
			divided_clk <= '0';
		elsif (rising_edge(mclk)) then
			if div_counter = freq_div then
				divided_clk <= not divided_clk;
				div_counter <= (others => '0');
			else
				div_counter <= div_counter + 1;
			end if;
		end if;
	end process;
	
	counter_clk <= mclk WHEN BTSSEL = "00" ELSE divided_clk;
	------------------------------------------------------------------
	
	counter_map : counter
	generic map(n => REGISTER_WIDTH)
	port map(
		rst => BTCLR,
		clk => counter_clk,
		enable => counter_enable,
		hit_upper_limit => HEU0,
		set_starting_cnt => BTCNT_write_flag_i,
		starting_cnt => BTCNT_write_value_i,
		q => counterOut
	);
	
	------------------------------------------------------------------
	-- PWM generator
	PWM_controller :
	process(counter_clk)
	begin
		if (rising_edge(counter_clk)) then
			if (BTOUTEN = '1') then
				case BTOUTMD is
					when '0' => -- Mode 0
						if counterOut = BTCL1 then
							out_buffer <= '1';
						elsif counterOut = BTCL0 then
							out_buffer <= '0';
						-- else 
							-- out_buffer <= out_buffer;
						end if;
					when '1' => -- Mode 1
						if counterOut = BTCL1 then
							out_buffer <= '0';
						elsif counterOut = BTCL0 then
							out_buffer <= '1';
						-- else 
							-- out_buffer <= out_buffer;
						end if;
					when others =>
						out_buffer <= 'U';
				end case;
			end if;
		end if;
	end process;
	------------------------------------------------------------------
	
	-- Output:
	-- counter value output
	BTCNT_read_o <= counterOut;
	-- PWM signal output
	PWMout <= out_buffer;
	
	-- Select output interrupt flag depending on BTIP value
	BTIFG <= HEU0 WHEN BTIP = "00" ELSE
			counterOut(23) WHEN BTIP = "01" ELSE
			counterOut(27) WHEN BTIP = "10" ELSE
			counterOut(31) WHEN BTIP = "11" ELSE
			HEU0;

END behavior;

