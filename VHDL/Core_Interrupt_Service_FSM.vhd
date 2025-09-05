LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.aux_package.all;


ENTITY Core_Interrupt_Service_FSM IS
	PORT(
		clk_i, rst_i				: IN STD_LOGIC;
		INTR_i 					: IN STD_LOGIC;
		Jump_ctrl_i 				: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		rs_register_i 				: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		INTA_o 					: OUT STD_LOGIC;
		emulate_LOAD_and_JAL_o 	: OUT STD_LOGIC;
		turn_GIE_off_o 			: OUT STD_LOGIC
	);
END Core_Interrupt_Service_FSM;


ARCHITECTURE behavior OF Core_Interrupt_Service_FSM IS

	SIGNAL INT_state_w : STD_LOGIC_VECTOR(1 DOWNTO 0);
	
BEGIN
		PROCESS (rst_i, clk_i, INTR_i)
		BEGIN
		IF (rst_i = '1') THEN
			INT_state_w 				<= "00";
			INTA_o 					<= '1';
			emulate_LOAD_and_JAL_o 	<= '0';
			turn_GIE_off_o 			<= '0';
		
		ELSIF (rising_edge(clk_i)) THEN
			IF (INT_state_w = "00") THEN
				IF (INTR_i = '1') THEN
				-- acknowledge INTR request (drop INTA_o to '0'), hold PC, set GIE = '0'
				-- receice (TYPE) from IC
				-- read MEM[TYPE] to ISR_addr, set PC = ISR_Addr and $k1 = PC+4 (will be read on next clock rising_edge)
					INT_state_w 				<= "01";
					INTA_o 					<= '0';
					emulate_LOAD_and_JAL_o	<= '1';
					turn_GIE_off_o 			<= '1';
				END IF;
				-- ELSE: no Interrupt, don't do anything
				
			ELSIF (INT_state_w = "01" ) THEN
			-- set INTA_o back to '1'
				INT_state_w 				<= "10";
				INTA_o 					<= '1';
				emulate_LOAD_and_JAL_o	<= '0';
				turn_GIE_off_o 			<= '1';
			ELSIF (INT_state_w = "10" and Jump_ctrl_i = "01" and rs_register_i = "11011") THEN -- Jump_ctrl_i = "01" and rs_register_i = "11010" means reti $k1 (jr $k1)
			-- finish Interrupt Service, (user executed jr $k1)
			-- set GIE = '1', PC = $k1
				INT_state_w 				<= "00";
				INTA_o 					<= '1';
				emulate_LOAD_and_JAL_o	<= '0';
				turn_GIE_off_o 			<= '0';
			END IF;
			
		END IF;
	END PROCESS;
	
END behavior;


