LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE work.cond_compilation_package.all;
USE work.aux_package.ALL;

ENTITY MCU IS
	GENERIC(
			WORD_GRANULARITY 	: BOOLEAN := G_WORD_GRANULARITY;
	        MODELSIM 				: INTEGER := G_MODELSIM;
			DATA_BUS_WIDTH 		: INTEGER := 32;
			ITCM_ADDR_WIDTH 		: INTEGER := G_ADDRWIDTH;
			DTCM_ADDR_WIDTH 		: INTEGER := G_ADDRWIDTH;
			PC_WIDTH 				: INTEGER := 10;
			FUNCT_WIDTH 			: INTEGER := 6;
			DATA_WORDS_NUM 		: INTEGER := G_DATA_WORDS_NUM;
			CLK_CNT_WIDTH 		: INTEGER := 16;
			INST_CNT_WIDTH 		: INTEGER := 16;
			ADDR_BUS_WIDTH 		: INTEGER := 12;
			CTRL_BUS_WIDTH 		: INTEGER := 8;
			INT_REG_WIDTH 			: INTEGER := 8;
			TYPE_REG_WIDTH 		: INTEGER := 8
			);
	PORT(
			clk_i, rst_i 			: IN STD_LOGIC; -- rst_i is connected to KEY0
			switches_pher_input 	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			KEY1_input 			: IN STD_LOGIC;
			KEY2_input 			: IN STD_LOGIC;
			KEY3_input 			: IN STD_LOGIC;
			HEX0_pher_output 	: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX1_pher_output 	: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX2_pher_output 	: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX3_pher_output 	: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX4_pher_output 	: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX5_pher_output 	: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			LEDR_pher_output 	: OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			PWM_o 				: OUT STD_LOGIC;
			-- Output important signals to pins for easy display in SignalTap
			pc_o				: OUT STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			ControlBus_o 		: OUT STD_LOGIC_VECTOR(CTRL_BUS_WIDTH-1 DOWNTO 0);
			AddrBus_o 			: OUT STD_LOGIC_VECTOR(ADDR_BUS_WIDTH-1 DOWNTO 0);
			DataBus_o			: OUT STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			instruction_o			: OUT STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			memWriteTop_o 		: OUT STD_LOGIC;
			memReadTop_o 		: OUT STD_LOGIC;
			Master_CLK_o		: OUT STD_LOGIC;
			signal_CLK_o			: OUT STD_LOGIC;
			test_pin_0_o			: OUT STD_LOGIC;
			test_pin_1_o			: OUT STD_LOGIC;
			test_pin_2_o			: OUT STD_LOGIC;
			test_pin_3_o			: OUT STD_LOGIC
		);
END MCU;

ARCHITECTURE structure OF MCU IS
	CONSTANT FMAX_IN_MHZ 	: INTEGER := 14;
	SIGNAL MCLK_w 			: STD_LOGIC;
	SIGNAL SLOWCLK_w 			: STD_LOGIC;
	SIGNAL MRST_w 			: STD_LOGIC;

	SIGNAL mem_write_ctrl_w 	: STD_LOGIC;
	SIGNAL mem_read_ctrl_w 		: STD_LOGIC;
	SIGNAL control_bus_w 		: STD_LOGIC_VECTOR(CTRL_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL addr_bus_w 			: STD_LOGIC_VECTOR(ADDR_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL data_bus_w 			: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	
	SIGNAL BTIFG_w 			: STD_LOGIC;
	SIGNAL IntSrcVec_w 			: STD_LOGIC_VECTOR(INT_REG_WIDTH-1 DOWNTO 0);
	SIGNAL INTR_w 				: STD_LOGIC;
	SIGNAL INTA_w 				: STD_LOGIC;
	SIGNAL GIE_w 				: STD_LOGIC;
	SIGNAL RXIFG_w 			: STD_LOGIC := '0';
	SIGNAL TXIFG_w 			: STD_LOGIC := '0';
	SIGNAL FIRIFG_w 			: STD_LOGIC;
	SIGNAL UART_status_error_w 	: STD_LOGIC := '0';
	SIGNAL FIFOEMPTY_w 		: STD_LOGIC;
	SIGNAL half_cycle_size 		: INTEGER;
	
BEGIN

	ControlBus_o 	<= control_bus_w;
	AddrBus_o 		<= addr_bus_w;
	DataBus_o 		<= data_bus_w;
	memWriteTop_o 	<= mem_write_ctrl_w;
	memReadTop_o 	<= mem_read_ctrl_w;
	
	Master_CLK_o 	<= MCLK_w;
	
	test_pin_0_o <= SLOWCLK_w; -- SHOWS THE SIGNAL CLOCK IN GP(0)
	test_pin_1_o <= signal_CLK_o;
	test_pin_2_o <= MCLK_w;
	test_pin_3_o <= clk_i;
	
	--#####################################
	-- MODELSIM SIMULATION VS FPGA SYNTHESIS - different clocks and inverse reset button
	MRST_w <= not (rst_i) WHEN MODELSIM = 0 else rst_i;
	
	-- Clock for SIGNAL TAP
	signal_tap_PLL : if MODELSIM = 0 generate
	  MCLK : entity work.PLL
		generic map (
		  clk0_multiply_by => 2*FMAX_IN_MHZ, -- faster clock for SignalTap so that we can see both rising edge and falling edge updates
		  clk0_divide_by   => 50
		)
		port map (
		  areset => '0',
		  inclk0 => clk_i,
		  c0     => signal_CLK_o,
		  locked => open
		);
	end generate;

	-- main system clock
	gen_pll : if MODELSIM = 0 generate
	  MCLK : entity work.PLL
		generic map (
		  clk0_multiply_by => FMAX_IN_MHZ,
		  clk0_divide_by   => 50
		)
		port map (
		  areset => '0',
		  inclk0 => clk_i,
		  c0     => MCLK_w,
		  locked => open
		);
	else generate
	  MCLK_w <= clk_i;
	end generate;
	
	half_cycle_size <= 500 WHEN MODELSIM = 0 ELSE 64; -- 64 for easier testability in ModelSim
	--#####################################
	
	-- FIR CLOCK / slow clock
	-- note: the intention of the lab was to produce the FIR clk using another PLL and have 2 seperate clock domains. slowest clock produceable by PLLs is in the hundreds of khz, we need a slower clock than that.
	-- so we produce our own FIR clock with the system clock + logic, which technically means we only have 1 clock domain, but we will treat them as 2 for the sake of practice and future compatibility
	FIR_CLK : FIR_CLK_Producer
	generic map(
		n 				=> 32
	)
	port map(
		rst 					=> MRST_w,
		clk 					=> MCLK_w,
		enable 				=> '1',
		PWM_out 			=> SLOWCLK_w,
		half_cycle_length 	=> half_cycle_size -- f_out = f_clk / (2*half_cycle_length)
	);
	
	MIPS_CORE : MIPS 
	GENERIC MAP( 
			WORD_GRANULARITY 	=> WORD_GRANULARITY,
			MODELSIM 				=> MODELSIM,
			DATA_BUS_WIDTH 		=> DATA_BUS_WIDTH,
			ITCM_ADDR_WIDTH 		=> ITCM_ADDR_WIDTH,
			DTCM_ADDR_WIDTH 		=> DTCM_ADDR_WIDTH,
			PC_WIDTH 				=> PC_WIDTH,
			FUNCT_WIDTH 			=> FUNCT_WIDTH,
			DATA_WORDS_NUM 		=> DATA_WORDS_NUM,
			CLK_CNT_WIDTH 		=> CLK_CNT_WIDTH,
			INST_CNT_WIDTH 		=> INST_CNT_WIDTH,
			ADDR_BUS_WIDTH 		=> ADDR_BUS_WIDTH,
			CTRL_BUS_WIDTH 		=> CTRL_BUS_WIDTH
	)
	PORT MAP(
			rst_i 				=> MRST_w,
			clk_i	 				=> MCLK_w,
			INTR_i 				=> INTR_w,
			pc_o				=> pc_o,
			instruction_o 		=> instruction_o,
			INTA_o 				=> INTA_w,
			GIE_o 				=> GIE_w,
			MemWrite_ctrl_o 	=> mem_write_ctrl_w,
			MemRead_ctrl_o 		=> mem_read_ctrl_w,
			ControlBus_o 		=> control_bus_w,
			AddrBus_o 			=> addr_bus_w,
			DataBus_io 			=> data_bus_w
	);		
	
	
	GPIO_Peripherals : GPIO
	GENERIC MAP(DATA_BUS_WIDTH, ADDR_BUS_WIDTH)
	PORT MAP(
			clk_i 				=> MCLK_w,
			rst_i 				=> MRST_w,
			addr_bus_i 			=> addr_bus_w,
			mem_read_ctrl_i 		=> mem_read_ctrl_w,
			mem_write_ctrl_i 		=> mem_write_ctrl_w,
			switches_pher_input 	=> switches_pher_input,
			data_bus_io 			=> data_bus_w,
			HEX0_pher_output 	=> HEX0_pher_output,
			HEX1_pher_output 	=> HEX1_pher_output,
			HEX2_pher_output 	=> HEX2_pher_output,
			HEX3_pher_output 	=> HEX3_pher_output,
			HEX4_pher_output 	=> HEX4_pher_output,
			HEX5_pher_output 	=> HEX5_pher_output,
			LEDR_pher_output 	=> LEDR_pher_output
	);
	
	
	BT_Peripheral : BasicTimer_Peripheral
	GENERIC MAP(
		DATA_BUS_WIDTH 	=> DATA_BUS_WIDTH,
		REGISTER_WIDTH 	=> DATA_BUS_WIDTH,
		ADDR_BUS_WIDTH 	=> ADDR_BUS_WIDTH,
		CTRL_BUS_WIDTH 	=> CTRL_BUS_WIDTH
	)
	PORT MAP(
			clk_i 			=> MCLK_w,
			rst_i 			=> MRST_w,
			addr_bus_i 		=> addr_bus_w,
			mem_read_ctrl_i 	=> mem_read_ctrl_w,
			mem_write_ctrl_i 	=> mem_write_ctrl_w,
			control_bus_i 	=> control_bus_w,
			data_bus_io 		=> data_bus_w,
			BTIFG_o 		=> BTIFG_w,
			PWM_o 			=> PWM_o
	);
	
	
	FIR_peripheral: FIR_Filter_Peripheral
	GENERIC MAP(
			DATA_BUS_WIDTH	=> DATA_BUS_WIDTH,
			REGISTER_WIDTH		=> DATA_BUS_WIDTH,
			ADDR_BUS_WIDTH	=> ADDR_BUS_WIDTH,
			CTRL_BUS_WIDTH 	=> CTRL_BUS_WIDTH
	)
	PORT MAP(
			clk_i 				=> MCLK_w,
			rst_i 				=> MRST_w,
			FIRCLK_i 			=> SLOWCLK_w,
			addr_bus_i 			=> addr_bus_w,
			mem_read_ctrl_i 		=> mem_read_ctrl_w,
			mem_write_ctrl_i 		=> mem_write_ctrl_w,
			control_bus_i 		=> control_bus_w,
			data_bus_io 			=> data_bus_w,
			FIFOEMPTY_o 		=> FIFOEMPTY_w,
			FIRIFG_o 			=> FIRIFG_w
	);

	
	IntSrcVec_w	<= FIRIFG_w & FIFOEMPTY_w & (NOT KEY3_input) & (NOT KEY2_input) & (NOT KEY1_input) & BTIFG_w & TXIFG_w & RXIFG_w;
	
	Interrupt_Controller: InterruptController
	GENERIC MAP(
			DATA_BUS_WIDTH		=> DATA_BUS_WIDTH,
			ADDR_BUS_WIDTH		=> ADDR_BUS_WIDTH,
			INT_REG_WIDTH			=> INT_REG_WIDTH,
			TYPE_REG_WIDTH 		=> TYPE_REG_WIDTH
	)
	PORT MAP(
			clk_i 					=> MCLK_w,
			rst_i 					=> MRST_w,
			mem_read_ctrl_i 			=> mem_read_ctrl_w,
			mem_write_ctrl_i 			=> mem_write_ctrl_w,
			int_src_vec_i 				=> IntSrcVec_w,
			INTA_i 					=> INTA_w,
			addr_bus_i 				=> addr_bus_w,
			GIE_i 					=> GIE_w,
			UART_status_error_i 		=> UART_status_error_w,
			FIFOEMPTY_i 			=> FIFOEMPTY_w,
			FIRIFG_flag_for_FIROUT_i 	=> FIRIFG_w,
			data_bus_io 				=> data_bus_w,
			INTR_o 					=> INTR_w
	);

END structure;