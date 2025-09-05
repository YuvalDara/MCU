--  Dmemory module (implements the data memory for the MIPS computer)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
USE work.cond_compilation_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY dmemory IS
	generic(
		DATA_BUS_WIDTH 	: integer := 32;
		DTCM_ADDR_WIDTH 	: integer := G_ADDRWIDTH;
		WORDS_NUM 		: integer := G_DATA_WORDS_NUM
	);
	PORT(
		clk_i,rst_i		: IN 	STD_LOGIC;
		dtcm_addr_i 		: IN 	STD_LOGIC_VECTOR(DTCM_ADDR_WIDTH-1 DOWNTO 0);
		dtcm_w_en_i 	: IN 	STD_LOGIC;
		dtcm_data_wr_i 	: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
		MemRead_ctrl_i  	: IN 	STD_LOGIC;
		MemWrite_ctrl_i 	: IN 	STD_LOGIC;
		dtcm_data_rd_o 	: OUT 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0)
	);
END dmemory;


ARCHITECTURE behavior OF dmemory IS
SIGNAL wrclk_w 		: STD_LOGIC;
SIGNAL write_en_w 	: STD_LOGIC;
BEGIN
	data_memory : altsyncram
	GENERIC MAP (
		operation_mode 	=> "SINGLE_PORT",
		width_a 			=> DATA_BUS_WIDTH,
		widthad_a 		=> DTCM_ADDR_WIDTH,
		numwords_a 	=> WORDS_NUM,
		lpm_hint 		=> "ENABLE_RUNTIME_MOD = YES,INSTANCE_NAME = DTCM",
		lpm_type 		=> "altsyncram",
		outdata_reg_a 	=> "UNREGISTERED",
		init_file 			=> "C:\intelFPGA\myWorkspace\MIPS Based MCU\Software Test Samples\Interrupt based IO\test1\bin\M9K\DTCM.hex",
		intended_device_family => "Cyclone"
	)
	PORT MAP(
		wren_a 		=> write_en_w,
		clock0 		=> wrclk_w,
		address_a 	=> dtcm_addr_i,
		data_a 		=> dtcm_data_wr_i,
		q_a 		=> dtcm_data_rd_o	
	);
	
	-- only enable write when aceessing actual DTCM memory and not memory mapped IO and peripherals
	write_en_w <= '1' WHEN MemWrite_ctrl_i = '1' and dtcm_w_en_i = '1' ELSE '0';
	wrclk_w <= NOT clk_i;	 -- write clock
END behavior;

