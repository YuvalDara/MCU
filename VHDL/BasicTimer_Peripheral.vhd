LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.const_package.all;
use work.aux_package.all;
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

-- BasicTimer peipheral wrapper to handle communication with the CPU
ENTITY BasicTimer_Peripheral IS
	GENERIC(
		DATA_BUS_WIDTH 	: integer := 32;
		REGISTER_WIDTH 	: integer := 32;
		ADDR_BUS_WIDTH 	: integer := 12;
		CTRL_BUS_WIDTH 	: INTEGER := 8
	);
	PORT(	clk_i, rst_i		: IN STD_LOGIC;
			addr_bus_i 		: IN STD_LOGIC_VECTOR(ADDR_BUS_WIDTH-1 DOWNTO 0);
			mem_read_ctrl_i 	: IN STD_LOGIC;
			mem_write_ctrl_i 	: IN STD_LOGIC;
			control_bus_i 	: IN STD_LOGIC_VECTOR(CTRL_BUS_WIDTH-1 DOWNTO 0);
			data_bus_io 		: INOUT STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			BTIFG_o 		: OUT STD_LOGIC;
			PWM_o 			: OUT STD_LOGIC
	);
END BasicTimer_Peripheral;

ARCHITECTURE behavior OF BasicTimer_Peripheral IS

	SIGNAL BTCTL_w 			: STD_LOGIC_VECTOR(CTRL_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL BTCCR0_w 			: STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
	SIGNAL BTCCR1_w 			: STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
	
	SIGNAL BTCNT_write_flag_w 	: STD_LOGIC;
	SIGNAL BTCNT_write_value_w 	: STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
	SIGNAL BTCNT_read_w 		: STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
	
BEGIN

	BasicTimer : BasicTimer_Comp
	GENERIC MAP (REGISTER_WIDTH => REGISTER_WIDTH)
	PORT MAP
	(
		mclk 	 			=> clk_i,
		BTCLR 				=> BTCTL_w(2),
		BTHOLD 			=> BTCTL_w(5),
		BTOUTMD 			=> BTCTL_w(7),
		BTOUTEN 			=> BTCTL_w(6),
		BTSSEL 				=> BTCTL_w(4 DOWNTO 3),
		BTCCR1 				=> BTCCR1_w,
		BTCCR0 				=> BTCCR0_w,
		BTIP 				=> BTCTL_w(1 DOWNTO 0),
		BTCNT_write_flag_i 	=> BTCNT_write_flag_w,
		BTCNT_write_value_i 	=> BTCNT_write_value_w,
		BTCNT_read_o 		=> BTCNT_read_w,
		BTIFG 				=> BTIFG_o,
		PWMout 			=> PWM_o
	);

	-- set counter value
	BTCNT_write_value_w 	<= data_bus_io(REGISTER_WIDTH-1 DOWNTO 0) WHEN (addr_bus_i = BTCNT_ADDR and mem_write_ctrl_i = '1') ELSE (others => '0');
	BTCNT_write_flag_w	<= '1' WHEN (addr_bus_i = BTCNT_ADDR and mem_write_ctrl_i = '1') ELSE '0';
	-- read counter value
	data_bus_io 			<= BTCNT_read_w WHEN (addr_bus_i = BTCNT_ADDR and mem_read_ctrl_i = '1') ELSE (others => 'Z');

	PROCESS(clk_i)
	BEGIN
		IF (falling_edge(clk_i)) THEN
			IF (addr_bus_i = BTCTL_ADDR and rst_i = '0' and mem_write_ctrl_i = '1') THEN
				BTCTL_w <= control_bus_i;
			END IF;
			IF (addr_bus_i = BTCCR0_ADDR and rst_i = '0' and mem_write_ctrl_i = '1') THEN
				BTCCR0_w <= data_bus_io(REGISTER_WIDTH-1 DOWNTO 0);
			END IF;
			IF (addr_bus_i = BTCCR1_ADDR and rst_i = '0' and mem_write_ctrl_i = '1') THEN
				BTCCR1_w <= data_bus_io(REGISTER_WIDTH-1 DOWNTO 0);
			END IF;
		END IF;
	END PROCESS;
	
END behavior;


