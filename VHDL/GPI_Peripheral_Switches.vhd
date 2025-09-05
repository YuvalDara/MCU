LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE work.aux_package.ALL;

ENTITY GPI_Peripheral_Switches IS
	GENERIC(
		DATA_BUS_WIDTH : integer := 32;
		PHERIPHERAL_SIZE : integer := 8
	);
	PORT( 
		mem_read_i			: IN STD_LOGIC;
		chip_select_i 			: IN STD_LOGIC;
		peripheral_input_i		: IN STD_LOGIC_VECTOR(PHERIPHERAL_SIZE-1 DOWNTO 0);
		data_bus_io 			: INOUT STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0)
		);
END GPI_Peripheral_Switches;

ARCHITECTURE behavior OF GPI_Peripheral_Switches IS
BEGIN
	
	data_bus_io <= (x"000000" & peripheral_input_i) WHEN mem_read_i = '1' and chip_select_i = '1' ELSE (others => 'Z'); 

END behavior;