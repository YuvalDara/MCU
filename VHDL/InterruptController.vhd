LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.aux_package.all;
USE work.const_package.all;


ENTITY InterruptController IS
	generic(
		DATA_BUS_WIDTH 	: integer := 32;
		ADDR_BUS_WIDTH 	: integer := 12;
		INT_REG_WIDTH 		: integer := 8;
		TYPE_REG_WIDTH 	: integer := 8
	);
	PORT(
		clk_i, rst_i				: IN STD_LOGIC;
		mem_read_ctrl_i 			: IN STD_LOGIC;
		mem_write_ctrl_i 			: IN STD_LOGIC;
		int_src_vec_i				: IN STD_LOGIC_VECTOR(INT_REG_WIDTH-1 DOWNTO 0);
		INTA_i 					: IN STD_LOGIC;
		addr_bus_i 				: IN STD_LOGIC_VECTOR(ADDR_BUS_WIDTH-1 DOWNTO 0);
		GIE_i 					: IN STD_LOGIC;
		UART_status_error_i 		: IN STD_LOGIC;
		FIFOEMPTY_i 			: IN STD_LOGIC;
		FIRIFG_flag_for_FIROUT_i 	: IN STD_LOGIC;
		data_bus_io 				: INOUT STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
		INTR_o 					: OUT STD_LOGIC
	);
END InterruptController;


ARCHITECTURE behavior OF InterruptController IS
	
	SIGNAL IE_w 					: STD_LOGIC_VECTOR(INT_REG_WIDTH-1 DOWNTO 0);
	SIGNAL IFG_w 					: STD_LOGIC_VECTOR(INT_REG_WIDTH-1 DOWNTO 0);
	SIGNAL INTA_inverse_w 			: STD_LOGIC;
	SIGNAL INTA_inverse_delayed_w 	: STD_LOGIC;
	SIGNAL type_reg_data_w 			: STD_LOGIC_VECTOR(TYPE_REG_WIDTH-1 DOWNTO 0);
	SIGNAL type_reg_data_delayed_w 	: STD_LOGIC_VECTOR(TYPE_REG_WIDTH-1 DOWNTO 0);
	SIGNAL IRQ_w 					: STD_LOGIC_VECTOR(INT_REG_WIDTH-1 DOWNTO 0);
	SIGNAL CLR_INT_w 				: STD_LOGIC_VECTOR(INT_REG_WIDTH-1 DOWNTO 0);
	SIGNAL temp_signal 				: STD_LOGIC := '1';
	
BEGIN

	INTA_inverse_w <= not INTA_i;
-- Communication with the MCU databus
	data_bus_io <= 	x"000000" & type_reg_data_w WHEN INTA_inverse_w = '1' ELSE
					x"000000" & IE_w WHEN (addr_bus_i = IE_ADDR and mem_read_ctrl_i = '1') ELSE
					x"000000" & IFG_w WHEN (addr_bus_i = IFG_ADDR and mem_read_ctrl_i = '1') ELSE
					(others => 'Z');
	
	PROCESS(clk_i)
	BEGIN
		IF (falling_edge(clk_i)) THEN
			IF (addr_bus_i = IE_ADDR and mem_write_ctrl_i = '1') THEN
				IE_w <= data_bus_io(INT_REG_WIDTH-1 DOWNTO 0);
			END IF;
		END IF;
	END PROCESS;
	
	IFG_w <= data_bus_io(INT_REG_WIDTH-1 DOWNTO 0) WHEN addr_bus_i = IFG_ADDR and mem_write_ctrl_i = '1'
			ELSE ('0' and IE_w(7)) &
			((IRQ_w(7) or IRQ_w(6)) and IE_w(6)) & -- both FIFOEMPTY (IRQ_w(6)) and FIRIFG (IRQ_w(7)) set this bit
			(IRQ_w(5 downto 0) and IE_w(5 downto 0));
	
	
	
	INTR_o <= GIE_i and (IFG_w(7) or IFG_w(6) or IFG_w(5) or IFG_w(4) or IFG_w(3) or IFG_w(2) or IFG_w(1) or IFG_w(0));
	
-- Interrupt Request/Source Registers, set on rising edge of the interrupt source, cleared on CLR_INT_w(i) request
	GEN_IRQ_HANDLERS : FOR i IN 0 TO 7 GENERATE
		signal src_d1, src_d2 : std_logic := '0';
		begin
			process(rst_i, clk_i)
			begin
				if (rst_i = '1') then
					IRQ_w(i) <= '0';
					src_d1 <= '0';
					src_d2 <= '0';
				elsif(rising_edge(clk_i)) then
				src_d1 <= int_src_vec_i(i);
				src_d2 <= src_d1;
					if (src_d1 = '1' and src_d2 = '0') then -- rising edge detection for int_src_vec_i(i)
						IRQ_w(i) <= '1';
					elsif (CLR_INT_w(i) = '1') then
						IRQ_w(i) <= '0';
					end if;
				end if;
			end process;
	END GENERATE;


	type_reg_data_w <= 	x"04" WHEN INTA_inverse_w = '1' and IFG_w(0) = '1' and UART_status_error_i = '1' ELSE -- UART STATUS ERROR
						x"08" WHEN INTA_inverse_w = '1' and IFG_w(0) = '1' ELSE -- RX UART
						x"0C" WHEN INTA_inverse_w = '1' and IFG_w(1) = '1' ELSE -- TX UART
						x"10" WHEN INTA_inverse_w = '1' and IFG_w(2) = '1' ELSE -- BTIFG/BTintSrc
						x"14" WHEN INTA_inverse_w = '1' and IFG_w(3) = '1' ELSE -- KEY1
						x"18" WHEN INTA_inverse_w = '1' and IFG_w(4) = '1' ELSE -- KEY2
						x"1C" WHEN INTA_inverse_w = '1' and IFG_w(5) = '1' ELSE -- KEY3
						x"20" WHEN INTA_inverse_w = '1' and (IRQ_w(6) = '1' and IE_w(6) = '1') ELSE -- FIR FIFOEMPTY
						x"24" WHEN INTA_inverse_w = '1' and (IRQ_w(7) = '1' and IE_w(6) = '1') ELSE -- FIRIFG flag for FIROUT ready
						(others => '0');


-- clear IRQ 1 cycle after servicing - raise CLR_INT(i) to clear IRQ(i) and subsequently IFG(i)
	process(rst_i, clk_i)
	begin
		if (rst_i = '1') then
			INTA_inverse_delayed_w <= '0';
			type_reg_data_delayed_w <= (others => '0');
		elsif (rising_edge(clk_i)) then
			INTA_inverse_delayed_w <= INTA_inverse_w;
			type_reg_data_delayed_w <= type_reg_data_w;
		end if;
	end process;
	
	CLR_INT_w(2) <= '1' WHEN INTA_inverse_delayed_w = '1' and type_reg_data_delayed_w = x"10" ELSE '0'; -- BTIFG serviced
	CLR_INT_w(6) <= '1' WHEN INTA_inverse_delayed_w = '1' and type_reg_data_delayed_w = x"20" ELSE '0'; --FIRIFG serviced
	CLR_INT_w(7) <= '1' WHEN INTA_inverse_delayed_w = '1' and type_reg_data_delayed_w = x"24" ELSE '0'; --FIFOEMPTY serviced
	CLR_INT_w(0) <= '1' WHEN INTA_inverse_delayed_w = '1' and (type_reg_data_delayed_w = x"08" or temp_signal = '0') ELSE '0'; -- RX UART, temp_signal is placeholder, NEEDS TO BE REPLACED AFTER UART IMPLEMENTATION
	CLR_INT_w(1) <= '1' WHEN INTA_inverse_delayed_w = '1' and (type_reg_data_delayed_w = x"0C" or temp_signal = '0') ELSE '0'; -- TX UART, temp_signal is placeholder, NEEDS TO BE REPLACED AFTER UART IMPLEMENTATION
	
	CLR_INT_w(3) <= '1' WHEN INTA_inverse_delayed_w = '1' and (type_reg_data_delayed_w = x"14") ELSE '0'; -- KEY1
	CLR_INT_w(4) <= '1' WHEN INTA_inverse_delayed_w = '1' and (type_reg_data_delayed_w = x"18") ELSE '0'; -- KEY2
	CLR_INT_w(5) <= '1' WHEN INTA_inverse_delayed_w = '1' and (type_reg_data_delayed_w = x"1C") ELSE '0'; -- KEY3
	
END behavior;


