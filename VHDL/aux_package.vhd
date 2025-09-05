library IEEE;
use ieee.std_logic_1164.all;
USE work.cond_compilation_package.all;

package aux_package is
	COMPONENT MIPS IS
		generic( 
				WORD_GRANULARITY 	: boolean := G_WORD_GRANULARITY;
				MODELSIM 				: integer := G_MODELSIM;
				DATA_BUS_WIDTH 		: integer := 32;
				ITCM_ADDR_WIDTH 		: integer := G_ADDRWIDTH;
				DTCM_ADDR_WIDTH 		: integer := G_ADDRWIDTH;
				PC_WIDTH 				: integer := 10;
				FUNCT_WIDTH 			: integer := 6;
				DATA_WORDS_NUM 		: integer := G_DATA_WORDS_NUM;
				CLK_CNT_WIDTH 		: integer := 16;
				INST_CNT_WIDTH 		: integer := 16;
				ADDR_BUS_WIDTH 		: integer := 12;
				CTRL_BUS_WIDTH 		: integer := 8
		);
		PORT(	rst_i		 		: IN STD_LOGIC;
				clk_i				: IN STD_LOGIC;
				INTR_i 			: IN STD_LOGIC;
				pc_o			: OUT	STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
				instruction_o		: OUT	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
				INTA_o 			: OUT STD_LOGIC;
				GIE_o 			: OUT STD_LOGIC;
				MemWrite_ctrl_o	: OUT 	STD_LOGIC;
				MemRead_ctrl_o 	: OUT 	STD_LOGIC;
				ControlBus_o 	: OUT 	STD_LOGIC_VECTOR(CTRL_BUS_WIDTH-1 DOWNTO 0);
				AddrBus_o 		: OUT 	STD_LOGIC_VECTOR(ADDR_BUS_WIDTH-1 DOWNTO 0);
				DataBus_io		: INOUT STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0)
		);		
	END COMPONENT;
---------------------------------------------------------  
	COMPONENT control IS
		generic(
			FUNCT_WIDTH 		: integer := 6
		);
	   PORT(
			opcode_i 			: IN 	STD_LOGIC_VECTOR(5 DOWNTO 0);
			funct_i				: IN 	STD_LOGIC_VECTOR(FUNCT_WIDTH-1 DOWNTO 0);
			RegDst_ctrl_o 		: OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0);
			Jump_ctrl_o			: OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0);
			ALUSrc_ctrl_o 		: OUT 	STD_LOGIC;
			MemtoReg_ctrl_o 	: OUT 	STD_LOGIC;
			RegWrite_ctrl_o 		: OUT 	STD_LOGIC;
			MemRead_ctrl_o 		: OUT 	STD_LOGIC;
			MemWrite_ctrl_o	 	: OUT 	STD_LOGIC;
			Branch_ctrl_o 		: OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0);
			ALUOp_ctrl_o	 		: OUT 	STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;
---------------------------------------------------------	
	COMPONENT dmemory IS
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
	END COMPONENT;
---------------------------------------------------------		
	COMPONENT Execute IS
		generic(
			DATA_BUS_WIDTH 	: integer := 32;
			FUNCT_WIDTH 		: integer := 6;
			PC_WIDTH 			: integer := 10
		);
		PORT(	read_data1_i 		: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
				read_data2_i 		: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
				sign_extend_i 	: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
				funct_i 			: IN 	STD_LOGIC_VECTOR(FUNCT_WIDTH-1 DOWNTO 0);
				shamt_i			: IN 	STD_LOGIC_VECTOR(10 DOWNTO 6);
				ALUOp_ctrl_i 	: IN 	STD_LOGIC_VECTOR(3 DOWNTO 0);
				ALUSrc_ctrl_i 	: IN 	STD_LOGIC;
				pc_plus4_i 		: IN 	STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
				zero_o 			: OUT	STD_LOGIC;
				alu_res_o 		: OUT	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
				addr_res_o 		: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 )
		);
	END COMPONENT;
---------------------------------------------------------		
	COMPONENT Idecode IS
		generic(
			DATA_BUS_WIDTH 	: integer := 32;
			PC_WIDTH 			: integer := 10
		);
		PORT(	clk_i, rst_i				: IN STD_LOGIC;
				instruction_i 				: IN STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
				dtcm_data_rd_i 			: IN STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
				alu_result_i				: IN STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
				RegWrite_ctrl_i 			: IN STD_LOGIC;
				MemtoReg_ctrl_i 			: IN STD_LOGIC;
				RegDst_ctrl_i 			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
				pc_plus_4_i 				: IN STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
				next_pc_no_INT_i 		: IN STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
				emulate_LOAD_and_JAL_i 	: IN STD_LOGIC;
				turn_GIE_off_i 			: IN STD_LOGIC;
				read_data1_o				: OUT STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
				read_data2_o				: OUT STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
				sign_extend_o 			: OUT STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
				rs_register_o 			: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
				GIE_o 					: OUT STD_LOGIC
		);
	END COMPONENT;
---------------------------------------------------------		
	COMPONENT Ifetch IS
		generic(
			WORD_GRANULARITY 	: boolean := False;
			DATA_BUS_WIDTH 		: integer := 32;
			PC_WIDTH 				: integer := 10;
			NEXT_PC_WIDTH 		: integer := 8; -- NEXT_PC_WIDTH = PC_WIDTH-2
			ITCM_ADDR_WIDTH 		: integer := 8;
			WORDS_NUM 			: integer := 256;
			INST_CNT_WIDTH 		: integer := 16
		);
		PORT(	
			clk_i, rst_i 		: IN STD_LOGIC;
			add_result_i 		: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			Branch_ctrl_i 	: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			Jump_ctrl_i 		: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			alu_res_i			: IN STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			zero_i 			: IN STD_LOGIC;
			jump_PC_to_ISR_i : IN STD_LOGIC;
			ISR_addr_i 		: IN STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			pc_o 			: OUT STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			pc_plus4_o 		: OUT STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			instruction_o 	: OUT STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			inst_cnt_o 		: OUT STD_LOGIC_VECTOR(INST_CNT_WIDTH-1 DOWNTO 0);
			next_pc_no_INT_o	: OUT STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0)
		);
	END COMPONENT;
---------------------------------------------------------
	COMPONENT Shifter IS
		GENERIC(
			n : INTEGER := 32;
			k : INTEGER := 5 --log2(n)
		);
		PORT(
			y: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
			x: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
			shift_dir: IN STD_LOGIC; -- '1' for left, '0' for right
			outp: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0));
	END COMPONENT;
---------------------------------------------------------	
-- ADDITIONAL MCU COMPONENTS
--------------------------------------------------------- 
	COMPONENT PLL IS
		generic( 
			clk0_multiply_by : integer := 1;
			clk0_divide_by : integer := 1
		);
		PORT
		(
			areset		: IN STD_LOGIC  := '0';
			inclk0		: IN STD_LOGIC  := '0';
			c0			: OUT STD_LOGIC ;
			locked		: OUT STD_LOGIC 
		);
	END COMPONENT;
---------------------------------------------------------	
	COMPONENT MCU IS
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
	END COMPONENT;
---------------------------------------------------------	
	COMPONENT GPIO IS
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
	END COMPONENT;
---------------------------------------------------------	
	COMPONENT GPIO_AddrDecoder IS
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
	END COMPONENT;
---------------------------------------------------------	
	COMPONENT GPO_Peripheral_HEX IS
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
	END COMPONENT;
---------------------------------------------------------	
	COMPONENT GPO_Peripheral_LEDR IS
		generic(
			DATA_BUS_WIDTH 	: integer := 32;
			PHERIPHERAL_SIZE 	: integer := 8
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
	END COMPONENT;
---------------------------------------------------------	
	COMPONENT GPI_Peripheral_Switches IS
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
	END COMPONENT;
---------------------------------------------------------	
	COMPONENT SevenSegDecoder IS
		GENERIC(
			n : INTEGER := 4;
			SegmentSize : INTEGER := 7
		);
		PORT(
			data 	: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			seg  	: OUT STD_LOGIC_VECTOR(SegmentSize-1 DOWNTO 0)
		);
	END COMPONENT;
---------------------------------------------------------	
	-- BasicTimer peipheral wrapper to handle communication with the CPU
	COMPONENT BasicTimer_Peripheral IS
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
	END COMPONENT;
---------------------------------------------------------	
	COMPONENT BasicTimer_Comp IS
		GENERIC (REGISTER_WIDTH : INTEGER := 32);
		PORT
		( -- BT - Basic Timer
			mclk 				: IN STD_LOGIC; -- master clock
			BTCLR 				: IN STD_LOGIC; -- BT clear/reset
			BTHOLD 			: IN STD_LOGIC; -- BT hold
			BTOUTMD 			: IN STD_LOGIC; -- BT PWM signal output mode
			BTOUTEN 			: IN STD_LOGIC; -- BT PWM signal output enable
			BTSSEL 				: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- BT clock dividor selector
			BTCCR1 				: IN STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0); -- BT lower value input for PWM signal: Mode0 => set, Mode1 -> reset
			BTCCR0 				: IN STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0); -- BT upper value input for PWM signal: Mode0 => reset, Mode1 -> set
			BTIP 				: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- BT interrupt output signal source selector
			BTCNT_write_flag_i 	: IN STD_LOGIC;
			BTCNT_write_value_i	: IN STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
			BTCNT_read_o 		: OUT STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
			BTIFG 				: OUT STD_LOGIC; -- BT interrupt output signal/flag
			PWMout 			: OUT STD_LOGIC -- PWM signal output
		);
	END COMPONENT;
---------------------------------------------------------	
	 -- basic counter for BasicTimer Peripheral
	COMPONENT counter is
		generic (n : INTEGER := 32);
		port(
			rst, clk, enable, hit_upper_limit, set_starting_cnt : in std_logic;
			starting_cnt : in std_logic_vector(n-1 downto 0);
			q          : out std_logic_vector (n-1 downto 0)
		);
	end COMPONENT;
---------------------------------------------------------	
	COMPONENT InterruptController IS
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
	END COMPONENT;
---------------------------------------------------------	
	COMPONENT Core_Interrupt_Service_FSM IS
		PORT(
			clk_i, rst_i				: IN STD_LOGIC;
			INTR_i 					: IN STD_LOGIC;
			Jump_ctrl_i 				: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			rs_register_i 				: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			INTA_o 					: OUT STD_LOGIC;
			emulate_LOAD_and_JAL_o 	: OUT STD_LOGIC;
			turn_GIE_off_o 			: OUT STD_LOGIC
		);
	END COMPONENT;
---------------------------------------------------------	
	-- FIR Filter peipheral wrapper to handle communication with the CPU
	COMPONENT FIR_Filter_Peripheral IS
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
	END COMPONENT;
---------------------------------------------------------	
	COMPONENT FIR_Filter_Comp IS
		generic(
			REGISTER_WIDTH : integer := 32;
			M : integer := 8;
			W : integer := 24;
			q : integer := 8;
			k : integer := 8; -- Queue size
			log2_of_k : integer := 3
		);
		PORT(
		-- FIFO Queue
			FIRIN		: IN 	STD_LOGIC_VECTOR(REGISTER_WIDTH-1 DOWNTO 0);
			FIFORST		: IN 	STD_LOGIC;
			FIFOCLK		: IN 	STD_LOGIC;
			FIFOWEN 	: IN 	STD_LOGIC;
			FIFOFULL	: OUT 	STD_LOGIC;
			FIFOEMPTY	: OUT 	STD_LOGIC;
		-- FIR Filter
			COEF0		: IN 	STD_LOGIC_VECTOR(q-1 downto 0);
			COEF1		: IN 	STD_LOGIC_VECTOR(q-1 downto 0);
			COEF2		: IN 	STD_LOGIC_VECTOR(q-1 downto 0);
			COEF3		: IN 	STD_LOGIC_VECTOR(q-1 downto 0);
			COEF4		: IN 	STD_LOGIC_VECTOR(q-1 downto 0);
			COEF5		: IN 	STD_LOGIC_VECTOR(q-1 downto 0);
			COEF6		: IN 	STD_LOGIC_VECTOR(q-1 downto 0);
			COEF7		: IN 	STD_LOGIC_VECTOR(q-1 downto 0);
			FIRCLK		: IN 	STD_LOGIC;
			FIRRST		: IN 	STD_LOGIC;
			FIRENA		: IN 	STD_LOGIC;
			FIRIFG		: OUT 	STD_LOGIC;
			FIROUT		: OUT	STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
---------------------------------------------------------	
	COMPONENT FIR_CLK_Producer is
		generic (
			n 				: INTEGER := 32
		);
		port(
			rst, clk, enable 	: in std_logic;
			PWM_out 		: out std_logic;
			half_cycle_length : in integer := 500 -- f_out = f_clk / (2*half_cycle_length) = f_clk / 1000
		);
	end COMPONENT;

---------------------------------------------------------	
end aux_package;

