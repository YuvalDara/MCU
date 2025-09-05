LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE work.aux_package.ALL;

ENTITY GPO_Peripheral_HEX IS
	GENERIC(
		DATA_BUS_WIDTH 	: integer := 32;
		PHERIPHERAL_SIZE 	: integer := 7
	);
	PORT( 
		clk_i 				: IN STD_LOGIC;
		rst_i 				: IN STD_LOGIC;
		mem_read_i			: IN STD_LOGIC;
		mem_write_i 		: IN STD_LOGIC;
		chip_select_i 			: IN STD_LOGIC;
		data_bus_io 			: INOUT STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
		peripheral_output_o	: OUT STD_LOGIC_VECTOR(PHERIPHERAL_SIZE-1 DOWNTO 0)
	);
END GPO_Peripheral_HEX;


ARCHITECTURE behavior OF GPO_Peripheral_HEX IS
	SIGNAL q : STD_LOGIC_VECTOR(PHERIPHERAL_SIZE-1 DOWNTO 0);
BEGIN
	
	PROCESS(clk_i)
	BEGIN
		IF (rst_i = '1') THEN
			q <= x"0" & b"000";
		ELSIF (falling_edge(clk_i)) THEN
			IF (chip_select_i = '1' and mem_write_i = '1') THEN
				q <= data_bus_io(PHERIPHERAL_SIZE-1 DOWNTO 0);
			END IF;
		END IF;
	END PROCESS;
	
	data_bus_io <= (x"000000" & b"0" & q) WHEN mem_read_i = '1' and chip_select_i = '1' ELSE (others => 'Z');

	SevenSegDec : SevenSegDecoder
		PORT MAP(data => q(3 DOWNTO 0), seg => peripheral_output_o);

END behavior;