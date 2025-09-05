-- custom frequncy divider\PWM generator component to generate FIR input clock based on system clock (FIR clock should be 1000x slower than system clock)
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
 
entity FIR_CLK_Producer is
	generic (
		n 				: INTEGER := 32
	);
	port(
		rst, clk, enable 	: in std_logic;
		PWM_out 		: out std_logic;
		half_cycle_length : in integer := 500 -- f_out = f_clk / (2*half_cycle_length) = f_clk / 1000
	);
end FIR_CLK_Producer;

architecture behav of FIR_CLK_Producer is
	signal counter : std_logic_vector(n-1 downto 0) := (others => '0');
	signal PWM_w : std_logic := '0';
begin
	
    process (rst, clk)
    begin
        if (rst = '1') then
			counter <= (others => '0');
		elsif (falling_edge(clk)) then
           if enable = '1' then	   
				if (counter = CONV_STD_LOGIC_VECTOR(half_cycle_length-1, n)) then
					counter <= (others => '0');
					PWM_w <= not PWM_w;
				else
					counter <= counter + 1;
				end if;
           end if;
	    end if;
    end process;
	
	PWM_out <= PWM_w;
	
end behav;



