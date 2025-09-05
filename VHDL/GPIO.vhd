LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.aux_package.all;

ENTITY GPIO IS
	generic(
		DATA_BUS_WIDTH 		: integer := 32;
		ADDR_BUS_WIDTH 		: integer := 12
	);
	PORT(	clk_i, rst_i			: IN 	STD_LOGIC;
			addr_bus_i 			: IN 	STD_LOGIC_VECTOR(ADDR_BUS_WIDTH-1 DOWNTO 0);
			mem_read_ctrl_i 		: IN 	STD_LOGIC;
			mem_write_ctrl_i 		: IN 	STD_LOGIC;
			switches_pher_input 	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			data_bus_io 			: INOUT STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			HEX0_pher_output, HEX1_pher_output, HEX2_pher_output, HEX3_pher_output, HEX4_pher_output, HEX5_pher_output : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			LEDR_pher_output 	: OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END GPIO;


ARCHITECTURE behavior OF GPIO IS
	SIGNAL CS_HEX0_w, CS_HEX1_w, CS_HEX2_w, CS_HEX3_w, CS_HEX4_w, CS_HEX5_w : STD_LOGIC;
	SIGNAL CS_LEDR_w 		: STD_LOGIC;
	SIGNAL CS_switches_w 	: STD_LOGIC;
	
BEGIN
	
	-- GPIO Pheripherals Address Decoder
	Decoder : GPIO_AddrDecoder
	generic map(DATA_BUS_WIDTH, ADDR_BUS_WIDTH)
	port map(
		rst_i 			=> rst_i,
		addr_bus_i 		=> addr_bus_i,
		CS_HEX0_o 		=> CS_HEX0_w,
		CS_HEX1_o 		=> CS_HEX1_w,
		CS_HEX2_o 		=> CS_HEX2_w,
		CS_HEX3_o 		=> CS_HEX3_w,
		CS_HEX4_o 		=> CS_HEX4_w,
		CS_HEX5_o 		=> CS_HEX5_w,
		CS_LEDR_o 		=> CS_LEDR_w,
		CS_Switches_o 	=> CS_switches_w
	);
	
	-- GPIO Peripherals
	HEX0 : GPO_Peripheral_HEX
	generic map(DATA_BUS_WIDTH => DATA_BUS_WIDTH, PHERIPHERAL_SIZE => 7)
	port map( 
		clk_i 				=> clk_i,
		rst_i 				=> rst_i,
		mem_read_i			=> mem_read_ctrl_i,
		mem_write_i 		=> mem_write_ctrl_i,
		chip_select_i 			=> CS_HEX0_w,
		data_bus_io 			=> data_bus_io,
		peripheral_output_o 	=> HEX0_pher_output
	);
	
	HEX1 : GPO_Peripheral_HEX
	generic map(DATA_BUS_WIDTH => DATA_BUS_WIDTH, PHERIPHERAL_SIZE => 7)
	port map( 
		clk_i 				=> clk_i,
		rst_i 				=> rst_i,
		mem_read_i			=> mem_read_ctrl_i,
		mem_write_i 		=> mem_write_ctrl_i,
		chip_select_i 			=> CS_HEX1_w,
		data_bus_io 			=> data_bus_io,
		peripheral_output_o 	=> HEX1_pher_output
	);
	
	HEX2 : GPO_Peripheral_HEX
	generic map(DATA_BUS_WIDTH => DATA_BUS_WIDTH, PHERIPHERAL_SIZE => 7)
	port map( 
		clk_i 				=> clk_i,
		rst_i 				=> rst_i,
		mem_read_i			=> mem_read_ctrl_i,
		mem_write_i 		=> mem_write_ctrl_i,
		chip_select_i 			=> CS_HEX2_w,
		data_bus_io 			=> data_bus_io,
		peripheral_output_o 	=> HEX2_pher_output
	);
	
	HEX3 : GPO_Peripheral_HEX
	generic map(DATA_BUS_WIDTH => DATA_BUS_WIDTH, PHERIPHERAL_SIZE => 7)
	port map( 
		clk_i 				=> clk_i,
		rst_i 				=> rst_i,
		mem_read_i			=> mem_read_ctrl_i,
		mem_write_i 		=> mem_write_ctrl_i,
		chip_select_i 			=> CS_HEX3_w,
		data_bus_io 			=> data_bus_io,
		peripheral_output_o 	=> HEX3_pher_output
	);
	
	HEX4 : GPO_Peripheral_HEX
	generic map(DATA_BUS_WIDTH => DATA_BUS_WIDTH, PHERIPHERAL_SIZE => 7)
	port map( 
		clk_i 				=> clk_i,
		rst_i 				=> rst_i,
		mem_read_i			=> mem_read_ctrl_i,
		mem_write_i 		=> mem_write_ctrl_i,
		chip_select_i 			=> CS_HEX4_w,
		data_bus_io 			=> data_bus_io,
		peripheral_output_o 	=> HEX4_pher_output
	);
	
	HEX5 : GPO_Peripheral_HEX
	generic map(DATA_BUS_WIDTH => DATA_BUS_WIDTH, PHERIPHERAL_SIZE => 7)
	port map( 
		clk_i 				=> clk_i,
		rst_i 				=> rst_i,
		mem_read_i			=> mem_read_ctrl_i,
		mem_write_i 		=> mem_write_ctrl_i,
		chip_select_i 			=> CS_HEX5_w,
		data_bus_io 			=> data_bus_io,
		peripheral_output_o 	=> HEX5_pher_output
	);
	
	LEDR : GPO_Peripheral_LEDR
	generic map(DATA_BUS_WIDTH => DATA_BUS_WIDTH, PHERIPHERAL_SIZE => 8)
	port map( 
		clk_i 				=> clk_i,
		rst_i 				=> rst_i,
		mem_read_i			=> mem_read_ctrl_i,
		mem_write_i 		=> mem_write_ctrl_i,
		chip_select_i 			=> CS_LEDR_w,
		data_bus_io 			=> data_bus_io,
		peripheral_output_o 	=> LEDR_pher_output
	);
	
	Switches : GPI_Peripheral_Switches
	generic map(DATA_BUS_WIDTH => DATA_BUS_WIDTH, PHERIPHERAL_SIZE => 8)
	port map( 
		mem_read_i			=> mem_read_ctrl_i,
		chip_select_i 			=> CS_switches_w,
		peripheral_input_i 	=> switches_pher_input,
		data_bus_io 			=> data_bus_io
	);
	
END behavior;


