--  Execute module (implements the data ALU and Branch Address Adder for the MIPS CPU)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
USE work.aux_package.all;
USE work.aux_package.ALL;

ENTITY Execute IS
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
END Execute;

ARCHITECTURE behavior OF Execute IS

	SIGNAL a_input_w, b_input_w 		: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL alu_out_mux_w, shift_res_w 	: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL branch_addr_r 				: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL alu_ctl_w						: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL shift_dir_w, shift_flag_w		: STD_LOGIC;

BEGIN

	shift_flag_w <= '1' WHEN (ALUOp_ctrl_i = "0000" AND funct_i = "000000") OR (ALUOp_ctrl_i = "0000" AND funct_i = "000010") ELSE '0';
	a_input_w <= 	read_data1_i WHEN shift_flag_w = '0' ELSE read_data2_i;
	-- ALU input mux
	b_input_w <= 	x"000000" & b"000" & shamt_i WHEN shift_flag_w = '1' ELSE
					read_data2_i WHEN (ALUSrc_ctrl_i = '0') ELSE
					sign_extend_i(DATA_BUS_WIDTH-1 DOWNTO 0);
--------------------------------------------------------------------------------------------------------
--  Generate ALU control bits
--------------------------------------------------------------------------------------------------------
	alu_ctl_w <= 	"0000" WHEN ALUOp_ctrl_i = "0000" AND funct_i = "100100" ELSE -- And
				"0001" WHEN ALUOp_ctrl_i = "0000" AND funct_i = "100101" ELSE -- Or
				"0010" WHEN ALUOp_ctrl_i = "0000" AND funct_i = "100110" ELSE -- Xor
				"0011" WHEN ALUOp_ctrl_i = "0000" AND funct_i = "100000" ELSE -- Add
				"0011" WHEN ALUOp_ctrl_i = "0000" AND funct_i = "100001" ELSE -- Addu
				"0100" WHEN ALUOp_ctrl_i = "0000" AND funct_i = "100010" ELSE -- Sub
				-- "0101" WHEN ALUOp_ctrl_i = "000" AND funct_i = "011000" ELSE -- Mul
				"0110" WHEN ALUOp_ctrl_i = "0000" AND funct_i = "101010" ELSE -- SLT
				"0111" WHEN ALUOp_ctrl_i = "0000" AND funct_i = "000000" ELSE -- sll
				"1000" WHEN ALUOp_ctrl_i = "0000" AND funct_i = "000010" ELSE -- srl
				"0011" WHEN ALUOp_ctrl_i = "0000" AND funct_i = "001000" ELSE -- Jr - Add with 0
				"0011" WHEN ALUOp_ctrl_i = "0001" ELSE -- Add
				"0100" WHEN ALUOp_ctrl_i = "0010" ELSE -- Sub
				"0000" WHEN ALUOp_ctrl_i = "0011" ELSE -- And
				"0001" WHEN ALUOp_ctrl_i = "0100" ELSE -- Or
				"0010" WHEN ALUOp_ctrl_i = "0101" ELSE -- Xor
				"0110" WHEN ALUOp_ctrl_i = "0110" ELSE -- SLTI
				"1001" WHEN ALUOp_ctrl_i = "0111" ELSE -- LUI
				"0101" WHEN ALUOp_ctrl_i = "1000" ELSE -- Mul
				"1111";
--------------------------------------------------------------------------------------------------------
	
	-- Generate Zero Flag
	zero_o <= '1' WHEN (alu_out_mux_w(DATA_BUS_WIDTH-1 DOWNTO 0) = x"00000000") ELSE
				'0';
	
	-- Select ALU output
	alu_res_o <= 	x"0000000" & b"000"  & alu_out_mux_w(31) WHEN  alu_ctl_w = "0110" ELSE -- SLT
					alu_out_mux_w(DATA_BUS_WIDTH-1 DOWNTO 0); -- All the rest

	-- Adder to compute Branch Address
	branch_addr_r	<= pc_plus4_i(PC_WIDTH-1 DOWNTO 2) + sign_extend_i(7 DOWNTO 0);
	addr_res_o 		<= branch_addr_r(7 DOWNTO 0);

	-- Shifter component mapping
	shift_dir_w <= '1' WHEN alu_ctl_w = "0111" ELSE '0';
	Shifter_L : entity work.Shifter
	generic map(n => DATA_BUS_WIDTH, k => 5)
	PORT MAP (	
		y 			=> a_input_w,  
		x 			=> b_input_w, 
		shift_dir 	=> shift_dir_w,
		outp 		=> shift_res_w
		);

	PROCESS (alu_ctl_w, a_input_w, b_input_w, shift_res_w)
		BEGIN
		
		CASE alu_ctl_w IS 	-- Select ALU operation
		
			WHEN "0000" 	=>	alu_out_mux_w 	<= a_input_w AND b_input_w; 

			WHEN "0001" 	=>	alu_out_mux_w 	<= a_input_w OR b_input_w;

			WHEN "0010" 	=>	alu_out_mux_w 	<= a_input_w XOR b_input_w;

			WHEN "0011" 	=>	alu_out_mux_w 	<= a_input_w + b_input_w;

			WHEN "0100" 	=>	alu_out_mux_w 	<= a_input_w - b_input_w;

			WHEN "0101" 	=>	alu_out_mux_w 	<= a_input_w(DATA_BUS_WIDTH/2-1 DOWNTO 0) * b_input_w(DATA_BUS_WIDTH/2-1 DOWNTO 0);
							-- ALUresult = A_input -B_input (for SLT)
			WHEN "0110" 	=>	alu_out_mux_w 	<=  a_input_w - b_input_w;
							-- ALUresult = SLL
			WHEN "0111" 	=>	alu_out_mux_w 	<= shift_res_w;
							-- ALUresult = SRL
			WHEN "1000" 	=>	alu_out_mux_w 	<= shift_res_w;
			
			WHEN "1001" 	=>	alu_out_mux_w 	<= b_input_w(DATA_BUS_WIDTH/2-1 DOWNTO 0) & x"0000";
			
			WHEN OTHERS	=>	alu_out_mux_w 	<= x"00000000";
			
		END CASE;
	END PROCESS;
  
END behavior;

