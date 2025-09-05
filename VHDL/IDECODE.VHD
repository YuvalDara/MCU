--  Idecode module (implements the register file for the MIPS computer
LIBRARY IEEE; 		
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY Idecode IS
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
END Idecode;


ARCHITECTURE behavior OF Idecode IS
TYPE register_file IS ARRAY (0 TO 31) OF STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);

	SIGNAL RF_q					: register_file;
	SIGNAL write_reg_addr_w 	: STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL write_reg_data_mid_w	: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL write_reg_data_final_w	: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL rs_register_w			: STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL rt_register_w			: STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL rd_register_w			: STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL imm_value_w			: STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
	rs_register_o 			<= rs_register_w;
	GIE_o 					<= RF_q(26)(0); -- $k0[0]
	 
	rs_register_w 			<= instruction_i(25 DOWNTO 21);
   	rt_register_w 			<= instruction_i(20 DOWNTO 16);
   	rd_register_w				<= instruction_i(15 DOWNTO 11);
   	imm_value_w 			<= instruction_i(15 DOWNTO 0);
	
	-- Read Register 1 Operation
	read_data1_o <= RF_q(CONV_INTEGER(rs_register_w));
	
	-- Read Register 2 Operation		 
	read_data2_o <= RF_q(CONV_INTEGER(rt_register_w));
	
	-- Mux for Register Write Address
	write_reg_addr_w <= 	"11011" WHEN emulate_LOAD_and_JAL_i = '1' ELSE -- jal to ISR (so need to set $k1 = PC+4)
						rd_register_w WHEN RegDst_ctrl_i = "11" ELSE -- R type
						"11111" WHEN RegDst_ctrl_i = "10" ELSE -- JAL
						rt_register_w; -- Normal

	-- Mux to bypass data memory for Rformat instructions
	write_reg_data_mid_w <= alu_result_i(DATA_BUS_WIDTH-1 DOWNTO 0) WHEN (MemtoReg_ctrl_i = '0') ELSE
							dtcm_data_rd_i;
						
	-- Mux for Register Write Data - JAL instruction or R Type
	write_reg_data_final_w <= next_pc_no_INT_i WHEN emulate_LOAD_and_JAL_i = '1' ELSE -- Jal or jal to ISR (so set $k1 = PC+4)
							x"00000" & b"00" & pc_plus_4_i WHEN RegDst_ctrl_i = "10" ELSE
							write_reg_data_mid_w; -- R type
	
	-- Sign Extend 16-bits to 32-bits
    sign_extend_o <= X"0000" & imm_value_w WHEN imm_value_w(15) = '0' ELSE
					X"FFFF" & imm_value_w;

	-- Register File
	process(rst_i, clk_i)
	begin
		if (rst_i='1') then
			FOR i IN 0 TO 31 LOOP
				RF_q(i) <= CONV_STD_LOGIC_VECTOR(0,32);
			END LOOP;
			
		elsif (clk_i'event and clk_i='1') then
			if ((RegWrite_ctrl_i = '1' or emulate_LOAD_and_JAL_i = '1') AND write_reg_addr_w /= 0) then
				RF_q(CONV_INTEGER(write_reg_addr_w)) <= write_reg_data_final_w;
				-- index is integer type - convert binary to integer
			end if;
			
			-- handle GIE
			if (turn_GIE_off_i = '1') then
				RF_q(26)(0) <= '0';  -- reg $k0[0] = GIE = 0
			elsif (turn_GIE_off_i = '0') then
				RF_q(26)(0) <= '1';  --  reg $k0[0] = GIE = 1
			end if;
		end if;
end process;

END behavior;





