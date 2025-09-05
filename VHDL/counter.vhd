library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; 
 
 -- basic counter for BasicTimer Peripheral
entity counter is
	generic (n : INTEGER := 32);
	port(
		rst, clk, enable, hit_upper_limit, set_starting_cnt : in std_logic;
		starting_cnt : in std_logic_vector(n-1 downto 0);
		q          : out std_logic_vector (n-1 downto 0)
	);
end counter;

architecture rtl of counter is
    signal q_int : std_logic_vector (n-1 downto 0) := (others => '0');
begin
	
    process (clk)
    begin
        if (rst = '1') then
			q_int <= (others => '0');
		elsif (rising_edge(clk)) then
           if enable = '1' then	   
				if (hit_upper_limit = '1') then
					q_int <= (others => '0');
				elsif (set_starting_cnt = '1') then
					q_int <= starting_cnt;
				else
					q_int <= q_int + 1;
				end if;
           end if;
	    end if;
    end process;
	
    q <= q_int;
end rtl;
