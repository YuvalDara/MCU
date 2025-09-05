-- control module (implements MIPS control unit)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
USE work.const_package.all;


ENTITY control IS
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
END control;

ARCHITECTURE behavior OF control IS

	SIGNAL  rtype_w, lw_w, sw_w, beq_w, itype_imm_w, jal_w, jr_w, mul_w: STD_LOGIC;

BEGIN
	-- Code to generate control signals using opcode bits
	rtype_w 				<= '1'	WHEN	opcode_i = R_TYPE_OPC  		ELSE '0';
	lw_w          		<= '1'	WHEN  	opcode_i = LW_OPC  		ELSE '0';
 	sw_w          		<= '1'	WHEN  	opcode_i = SW_OPC  		ELSE '0';
	jal_w          		<= '1'	WHEN  	opcode_i = JAL_OPC 			ELSE '0';
	jr_w 				<= '1' 	WHEN 	funct_i = "001000"				ELSE '0';
	mul_w 				<= '1' 	WHEN 	opcode_i = MUL_OPC 		ELSE '0';
	itype_imm_w			<=	'1'	WHEN	((opcode_i = ADDI_OPC) or
										(opcode_i = ADDIU_OPC) or
										( opcode_i = ORI_OPC) or
										( opcode_i = XORI_OPC) or
										( opcode_i = SLTI_OPC) or
										( opcode_i = LUI_OPC) or
										( opcode_i = ANDI_OPC))	ELSE '0';
							
  	RegDst_ctrl_o    	<=  	"11" WHEN rtype_w OR mul_w ELSE
							"10" WHEN opcode_i = JAL_OPC ELSE
							"00";
 	ALUSrc_ctrl_o  		<=  lw_w OR sw_w OR itype_imm_w;
	MemtoReg_ctrl_o 	<=  lw_w;
  	RegWrite_ctrl_o 		<=  rtype_w OR lw_w OR itype_imm_w OR jal_w OR mul_w;
  	MemRead_ctrl_o 		<=  lw_w;
   	MemWrite_ctrl_o 	<=  sw_w;
 	Branch_ctrl_o      	<=  "10" WHEN 	opcode_i = BEQ_OPC ELSE
							"01" WHEN opcode_i = BNE_OPC ELSE
							"00";
	Jump_ctrl_o			<= 	"11" WHEN opcode_i = JUMP_OPC ELSE
							"10" WHEN opcode_i = JAL_OPC ELSE -- jal
							"01" WHEN rtype_w AND jr_w ELSE -- jr
							"00";
	
	ALUOp_ctrl_o 		<=  	"0000" WHEN rtype_w = '1' ELSE -- R type
							"0001" WHEN opcode_i = ADDI_OPC OR opcode_i = SW_OPC OR opcode_i = LW_OPC OR opcode_i = ADDIU_OPC ELSE -- Addition
							"0010" WHEN opcode_i = BEQ_OPC OR opcode_i = BNE_OPC ELSE -- Sub
							"0011" WHEN opcode_i = ANDI_OPC ELSE -- And
							"0100" WHEN opcode_i = ORI_OPC ELSE -- Or
							"0101" WHEN opcode_i = XORI_OPC ELSE -- Xor
							"0110" WHEN opcode_i = SLTI_OPC ELSE -- Set on less than
							"0111" WHEN opcode_i = LUI_OPC ELSE -- LUI
							"1000" WHEN opcode_i = MUL_OPC; -- Mul
END behavior;