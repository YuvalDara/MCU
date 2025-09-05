LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE work.const_package.all;

ENTITY GPIO_AddrDecoder IS
	generic(
		DATA_BUS_WIDTH 	: integer := 32;
		ADDR_BUS_WIDTH 	: integer := 12
	);
	PORT(
		rst_i			: IN STD_LOGIC;
		addr_bus_i 	: IN STD_LOGIC_VECTOR(ADDR_BUS_WIDTH-1 DOWNTO 0);
		
		CS_HEX0_o, CS_HEX1_o, CS_HEX2_o, CS_HEX3_o, CS_HEX4_o, CS_HEX5_o	: OUT STD_LOGIC;
		CS_LEDR_o															: OUT STD_LOGIC;
		CS_Switches_o 														: OUT STD_LOGIC
	);
END GPIO_AddrDecoder;

ARCHITECTURE behavior OF GPIO_AddrDecoder IS

BEGIN

	CS_HEX0_o 		<= '1' WHEN addr_bus_i = HEX0_ADDR and rst_i = '0' ELSE '0';
	CS_HEX1_o 		<= '1' WHEN addr_bus_i = HEX1_ADDR and rst_i = '0' ELSE '0';
	CS_HEX2_o 		<= '1' WHEN addr_bus_i = HEX2_ADDR and rst_i = '0' ELSE '0';
	CS_HEX3_o 		<= '1' WHEN addr_bus_i = HEX3_ADDR and rst_i = '0' ELSE '0';
	CS_HEX4_o 		<= '1' WHEN addr_bus_i = HEX4_ADDR and rst_i = '0' ELSE '0';
	CS_HEX5_o 		<= '1' WHEN addr_bus_i = HEX5_ADDR and rst_i = '0' ELSE '0';
	CS_LEDR_o 		<= '1' WHEN addr_bus_i = LEDR_ADDR and rst_i = '0' ELSE '0';
	CS_Switches_o 	<= '1' WHEN addr_bus_i = Switches_ADDR and rst_i = '0' ELSE '0';

END behavior;


