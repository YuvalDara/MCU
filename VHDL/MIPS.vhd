-- Top Level Structural Model for MIPS Processor Core
-- Hello there Yuval <3

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
USE work.cond_compilation_package.all;
USE work.aux_package.all;
USE work.const_package.all;

ENTITY MIPS IS
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
END MIPS;
-------------------------------------------------------------------------------------
ARCHITECTURE structure OF MIPS IS
	SIGNAL pc_plus4_w 					: STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
	SIGNAL read_data1_w 				: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL read_data2_w 				: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL sign_extend_w 				: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL addr_res_w 					: STD_LOGIC_VECTOR(7 DOWNTO 0 );
	SIGNAL alu_result_w 					: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL dtcm_data_rd_w 				: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL alu_src_w 					: STD_LOGIC;
	SIGNAL branch_w 					: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL jump_w 						: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL reg_dst_w 					: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL reg_write_w 					: STD_LOGIC;
	SIGNAL zero_w 						: STD_LOGIC;
	SIGNAL mem_write_w 				: STD_LOGIC;
	SIGNAL MemtoReg_w 				: STD_LOGIC;
	SIGNAL mem_read_w 				: STD_LOGIC;
	SIGNAL alu_op_w 					: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL instruction_w					: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL MCLK_w 					: STD_LOGIC;
	SIGNAL mclk_cnt_q					: STD_LOGIC_VECTOR(CLK_CNT_WIDTH-1 DOWNTO 0);
	SIGNAL inst_cnt_w					: STD_LOGIC_VECTOR(INST_CNT_WIDTH-1 DOWNTO 0);
	SIGNAL next_pc_no_INT_w 			: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	
	SIGNAL pc_w 						: STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
	SIGNAL readData_w 					: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	
	SIGNAL rs_register_w 				: STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL emulate_LOAD_and_JAL_w 		: STD_LOGIC;
	SIGNAL MEM_read_addr_w 			: STD_LOGIC_VECTOR(DTCM_ADDR_WIDTH-1 DOWNTO 0);
	SIGNAL ISR_addr_w 					: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL turn_GIE_off_w 				: STD_LOGIC;
	SIGNAL data_not_for_DMEM_flag_w 	: STD_LOGIC;
	
BEGIN

	MemWrite_ctrl_o 	<= mem_write_w;
	MemRead_ctrl_o 		<= mem_read_w;
	pc_o 				<= pc_w;
	instruction_o 		<= instruction_w;
	ControlBus_o 		<= read_data2_w(CTRL_BUS_WIDTH-1 DOWNTO 0) WHEN alu_result_w(ADDR_BUS_WIDTH-1 DOWNTO 0) = BTCTL_ADDR and mem_write_w = '1' ELSE (others => '0');
	AddrBus_o 			<= alu_result_w(ADDR_BUS_WIDTH-1 DOWNTO 0) WHEN alu_result_w(ADDR_BUS_WIDTH-1) = '1' and (mem_write_w = '1' or mem_read_w = '1') ELSE (others => '0');
	DataBus_io 			<= read_data2_w WHEN alu_result_w(ADDR_BUS_WIDTH-1) = '1' and mem_write_w = '1' ELSE (others => 'Z'); -- only push when in write mode and address is for MMIO
	
	readData_w	 		<= DataBus_io WHEN (alu_result_w(ADDR_BUS_WIDTH-1) = '1' and mem_read_w = '1') ELSE dtcm_data_rd_w; -- only read when in read mode and address is for MMIO
	ISR_addr_w 			<= dtcm_data_rd_w WHEN emulate_LOAD_and_JAL_w = '1' ELSE (others => '0');
	MCLK_w 			<= clk_i;

	G0 : if (WORD_GRANULARITY = True) generate -- i.e. each WORD has a unique address
		MEM_read_addr_w <= DataBus_io(DTCM_ADDR_WIDTH+2-1 DOWNTO 2) WHEN emulate_LOAD_and_JAL_w = '1' ELSE alu_result_w((DTCM_ADDR_WIDTH+2)-1 DOWNTO 2);
		data_not_for_DMEM_flag_w <= DataBus_io(ADDR_BUS_WIDTH-1) WHEN emulate_LOAD_and_JAL_w = '1' ELSE alu_result_w(ADDR_BUS_WIDTH-1);
	elsif (WORD_GRANULARITY = False) generate -- i.e. each BYTE has a unique address
		MEM_read_addr_w <= DataBus_io(DTCM_ADDR_WIDTH-1 DOWNTO 0) WHEN emulate_LOAD_and_JAL_w = '1' ELSE alu_result_w(DTCM_ADDR_WIDTH-1 DOWNTO 2) & "00";
		data_not_for_DMEM_flag_w <= DataBus_io(ADDR_BUS_WIDTH-1) WHEN emulate_LOAD_and_JAL_w = '1' ELSE alu_result_w(ADDR_BUS_WIDTH-1);
	end generate;
	
	-- Small FSM to handle interrupts on CPU side
	Interrupt_Service_FSM : Core_Interrupt_Service_FSM
	PORT MAP(
		clk_i 					=> MCLK_w,
		rst_i 					=> rst_i,
		INTR_i 					=> INTR_i,
		Jump_ctrl_i 				=> jump_w,
		rs_register_i 				=> rs_register_w,
		INTA_o 					=> INTA_o,
		emulate_LOAD_and_JAL_o 	=> emulate_LOAD_and_JAL_w,
		turn_GIE_off_o 			=> turn_GIE_off_w
	);
	
	-- 5 MIPS CPU Components
	IFE : Ifetch
	generic map(
		WORD_GRANULARITY 	=> 	WORD_GRANULARITY,
		DATA_BUS_WIDTH		=> 	DATA_BUS_WIDTH, 
		PC_WIDTH				=>	PC_WIDTH,
		ITCM_ADDR_WIDTH		=>	ITCM_ADDR_WIDTH,
		WORDS_NUM			=>	DATA_WORDS_NUM,
		INST_CNT_WIDTH			=>	INST_CNT_WIDTH
	)
	PORT MAP(	
		clk_i 				=> MCLK_w,  
		rst_i 				=> rst_i, 
		add_result_i 			=> addr_res_w,
		Branch_ctrl_i 		=> branch_w,
		Jump_ctrl_i 			=> jump_w,
		alu_res_i 			=> alu_result_w,
		zero_i 				=> zero_w,
		jump_PC_to_ISR_i 	=> emulate_LOAD_and_JAL_w,
		ISR_addr_i 			=> ISR_addr_w,
		pc_o 				=> pc_w,
		instruction_o 		=> instruction_w,
    	pc_plus4_o	 		=> pc_plus4_w,
		inst_cnt_o			=> inst_cnt_w,
		next_pc_no_INT_o 	=> next_pc_no_INT_w
	);

	ID : Idecode
   	generic map(
		DATA_BUS_WIDTH			=> DATA_BUS_WIDTH
	)
	PORT MAP(	
			clk_i 					=> MCLK_w,  
			rst_i 					=> rst_i,
        	instruction_i 				=> instruction_w,
        	dtcm_data_rd_i 			=> readData_w,
			alu_result_i 				=> alu_result_w,
			RegWrite_ctrl_i 			=> reg_write_w,
			MemtoReg_ctrl_i 			=> MemtoReg_w,
			RegDst_ctrl_i 			=> reg_dst_w,
			pc_plus_4_i 				=> pc_plus4_w,
			next_pc_no_INT_i 		=> next_pc_no_INT_w,
			emulate_LOAD_and_JAL_i 	=> emulate_LOAD_and_JAL_w,
			turn_GIE_off_i 			=> turn_GIE_off_w,
			read_data1_o 			=> read_data1_w,
        	read_data2_o 			=> read_data2_w,
			sign_extend_o 			=> sign_extend_w,
			rs_register_o 			=> rs_register_w,
			GIE_o 					=> GIE_o
		);

	CTL : control
	generic map(
		FUNCT_WIDTH 			=>	FUNCT_WIDTH
	)
	PORT MAP(
			opcode_i 			=> instruction_w(DATA_BUS_WIDTH-1 DOWNTO 26),
			funct_i 				=> instruction_w(5 DOWNTO 0),
			RegDst_ctrl_o 		=> reg_dst_w,
			Jump_ctrl_o			=> jump_w,
			ALUSrc_ctrl_o 		=> alu_src_w,
			MemtoReg_ctrl_o 	=> MemtoReg_w,
			RegWrite_ctrl_o 		=> reg_write_w,
			MemRead_ctrl_o 		=> mem_read_w,
			MemWrite_ctrl_o 	=> mem_write_w,
			Branch_ctrl_o 		=> branch_w,
			ALUOp_ctrl_o 		=> alu_op_w
		);

	EXE : Execute
   	generic map(
		DATA_BUS_WIDTH 	=> 	DATA_BUS_WIDTH,
		FUNCT_WIDTH 		=>	FUNCT_WIDTH,
		PC_WIDTH 			=>	PC_WIDTH
	)
	PORT MAP(	
		pc_plus4_i		=> pc_plus4_w,
		read_data1_i 		=> read_data1_w,
        read_data2_i 		=> read_data2_w,
		sign_extend_i 	=> sign_extend_w,
        funct_i			=> instruction_w(5 DOWNTO 0),
		shamt_i 			=> instruction_w(10 DOWNTO 6),
		ALUOp_ctrl_i 	=> alu_op_w,
		ALUSrc_ctrl_i 	=> alu_src_w,
		zero_o 			=> zero_w,
        alu_res_o		=> alu_result_w,
		addr_res_o 		=> addr_res_w			
	);
	
	MEM:  dmemory
		generic map(
			DATA_BUS_WIDTH	=> 	DATA_BUS_WIDTH, 
			DTCM_ADDR_WIDTH	=> 	DTCM_ADDR_WIDTH,
			WORDS_NUM		=>	DATA_WORDS_NUM
		)
		PORT MAP(	
			clk_i 			=> MCLK_w,  
			rst_i 			=> rst_i,
			dtcm_addr_i 		=> MEM_read_addr_w,
			dtcm_w_en_i 	=> not data_not_for_DMEM_flag_w,
			dtcm_data_wr_i 	=> read_data2_w,
			MemRead_ctrl_i 	=> mem_read_w, 
			MemWrite_ctrl_i 	=> mem_write_w,
			dtcm_data_rd_o 	=> dtcm_data_rd_w 
		);


	process (MCLK_w , rst_i)
	begin
		if rst_i = '1' then
			mclk_cnt_q	<=	(others	=> '0');
		elsif rising_edge(MCLK_w) then
			mclk_cnt_q	<=	mclk_cnt_q + '1';
		end if;
	end process;

-- mclk_cnt_o	<=	mclk_cnt_q;
-- inst_cnt_o	<=	inst_cnt_w;
END structure;

