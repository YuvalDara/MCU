LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.const_package.all;
use work.aux_package.all;
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

-- FIR Filter peipheral wrapper to handle communication with the CPU
ENTITY FIR_Filter_Peripheral IS
	GENERIC(
		DATA_BUS_WIDTH 	: integer := 32;
		REGISTER_WIDTH 	: integer := 32;
		ADDR_BUS_WIDTH 	: integer := 12;
		CTRL_BUS_WIDTH 	: INTEGER := 8
	);
	PORT(	clk_i 				: IN STD_LOGIC;
			rst_i					: IN STD_LOGIC;
			FIRCLK_i 			: IN STD_LOGIC;
			addr_bus_i 			: IN STD_LOGIC_VECTOR(ADDR_BUS_WIDTH-1 DOWNTO 0);
			mem_read_ctrl_i 		: IN STD_LOGIC;
			mem_write_ctrl_i 		: IN STD_LOGIC;
			control_bus_i 		: IN STD_LOGIC_VECTOR(CTRL_BUS_WIDTH-1 DOWNTO 0);
			data_bus_io 			: INOUT STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			FIFOEMPTY_o 		: OUT STD_LOGIC;
			FIRIFG_o 			: OUT STD_LOGIC
	);
END FIR_Filter_Peripheral;

ARCHITECTURE behavior OF FIR_Filter_Peripheral IS

	SIGNAL FIRCTL_w 	: STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
	SIGNAL FIRIN_w 		: STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
	SIGNAL FIROUT_w 	: STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
	SIGNAL COEF3_0_w 	: STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
	SIGNAL COEF7_4_w 	: STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
	
BEGIN

	FIR_Filter : FIR_Filter_Comp
	GENERIC MAP(
		REGISTER_WIDTH => REGISTER_WIDTH,
		M => 8,
		W => 24,
		q => 8,
		k => 4,
		log2_of_k => 2
	)
	PORT MAP
	(
-- FIFO Queue
		FIRIN 	 	=> FIRIN_w,
		FIFORST 	=> FIRCTL_w(4),
		FIFOCLK 	=> clk_i,
		FIFOWEN 	=> FIRCTL_w(5),
		FIFOFULL 	=> FIRCTL_w(3),
		FIFOEMPTY 	=> FIRCTL_w(2),
-- FIR Filter
		COEF0 	 	=> COEF3_0_w(7 downto 0),
		COEF1 		=> COEF3_0_w(15 downto 8),
		COEF2 		=> COEF3_0_w(23 downto 16),
		COEF3 		=> COEF3_0_w(31 downto 24),
		COEF4 		=> COEF7_4_w(7 downto 0),
		COEF5 		=> COEF7_4_w(15 downto 8),
		COEF6 		=> COEF7_4_w(23 downto 16),
		COEF7 		=> COEF7_4_w(31 downto 24),
		FIRCLK 	 	=> FIRCLK_i,
		FIRRST 		=> FIRCTL_w(1),
		FIRENA 		=> FIRCTL_w(0),
		FIRIFG 		=> FIRIFG_o,
		FIROUT 		=> FIROUT_w
	);

	FIFOEMPTY_o <= FIRCTL_w(2);

	-- Write to FIR registers from BUS
	PROCESS(clk_i)
	BEGIN
		IF (falling_edge(clk_i)) THEN
			
			if (addr_bus_i = FIRCTL_ADDR) and (mem_write_ctrl_i = '1') then
			-- store all input bits, skip 2 FIFOFULL and FIFOEMPTY bits which are used only as outputs
				FIRCTL_w(REGISTER_WIDTH-1 downto 4) <= data_bus_io(REGISTER_WIDTH-1 downto 4);
				FIRCTL_w(1 downto 0) <= data_bus_io(1 downto 0);
			else
				FIRCTL_w(5) <= '0';  -- FIFOWEN will be '1' only for 1 cycle, when '1' is written to it
			end if;
			
			if (addr_bus_i = FIRIN_ADDR and mem_write_ctrl_i = '1') THEN
				FIRIN_w <= data_bus_io(REGISTER_WIDTH-1 DOWNTO 0);
			end if;
			
			if (addr_bus_i = COEF3_0_ADDR and mem_write_ctrl_i = '1') THEN
				COEF3_0_w <= data_bus_io(REGISTER_WIDTH-1 DOWNTO 0);
			end if;
			
			if (addr_bus_i = COEF7_4_ADDR and mem_write_ctrl_i = '1') THEN
				COEF7_4_w <= data_bus_io(REGISTER_WIDTH-1 DOWNTO 0);
			end if;
			
		END IF;
	END PROCESS;
	
	-- Read from FIR registers to BUS
	data_bus_io <= 	FIROUT_w WHEN (addr_bus_i = FIROUT_ADDR and mem_read_ctrl_i = '1') ELSE
					FIRCTL_w WHEN (addr_bus_i = FIRCTL_ADDR and mem_read_ctrl_i = '1') ELSE
					FIRIN_w WHEN (addr_bus_i = FIRIN_ADDR and mem_read_ctrl_i = '1') ELSE
					(others => 'Z');

END behavior;



