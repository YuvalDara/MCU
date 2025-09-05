library IEEE;
use ieee.std_logic_1164.all;

package const_package is

	--	IDECODE constants - operation codes
	constant R_TYPE_OPC 	: STD_LOGIC_VECTOR(5 DOWNTO 0) := "000000";
	constant LW_OPC 		: STD_LOGIC_VECTOR(5 DOWNTO 0) := "100011";
	constant SW_OPC 		: STD_LOGIC_VECTOR(5 DOWNTO 0) := "101011";
	constant BEQ_OPC 		: STD_LOGIC_VECTOR(5 DOWNTO 0) := "000100";
	constant BNE_OPC 		: STD_LOGIC_VECTOR(5 DOWNTO 0) := "000101";
	constant ANDI_OPC 		: STD_LOGIC_VECTOR(5 DOWNTO 0) := "001100";
	constant ORI_OPC 		: STD_LOGIC_VECTOR(5 DOWNTO 0) := "001101";
	constant XORI_OPC 		: STD_LOGIC_VECTOR(5 DOWNTO 0) := "001110";
	constant ADDI_OPC 		: STD_LOGIC_VECTOR(5 DOWNTO 0) := "001000";
	constant ADDIU_OPC 	: STD_LOGIC_VECTOR(5 DOWNTO 0) := "001001";
	constant SLTI_OPC 		: STD_LOGIC_VECTOR(5 DOWNTO 0) := "001010";
	constant JUMP_OPC 		: STD_LOGIC_VECTOR(5 DOWNTO 0) := "000010";
	constant JAL_OPC 		: STD_LOGIC_VECTOR(5 DOWNTO 0) := "000011";
	constant LUI_OPC 		: STD_LOGIC_VECTOR(5 DOWNTO 0) := "001111";
	constant MUL_OPC 		: STD_LOGIC_VECTOR(5 DOWNTO 0) := "011100";
	
	-- MM (Memory Mapped) GPIO address constants
	constant HEX0_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"804";
	constant HEX1_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"805";
	constant HEX2_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"808";
	constant HEX3_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"809";
	constant HEX4_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"80C";
	constant HEX5_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"80D";
	constant LEDR_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"800";
	constant Switches_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"810";
	-- MM KEY inputs address constants
	constant KEYS3_1 		: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"814";
	
	-- MM BASIC TIMER address constants
	constant BTCTL_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"81C"; -- LSB Byte
	constant BTCNT_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"820";
	constant BTCCR0_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"824";
	constant BTCCR1_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"828";
	
	-- MM FIR filter address constants
	constant FIRCTL_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"82C"; -- LSB Byte
	constant FIRIN_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"830";
	constant FIROUT_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"834";
	constant COEF3_0_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"838";
	constant COEF7_4_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"83C";
	
	-- MM Interrupt Controller address constants
	constant IE_ADDR 		: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"840"; -- LSB Byte
	constant IFG_ADDR 		: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"841"; -- LSB Byte
	constant TYPE_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"842"; -- LSB Byte
	
	-- MM UART address constants
	constant UTCL_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"818"; -- LSB Byte
	constant RX_BF_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"819"; -- LSB Byte
	constant TX_BF_ADDR 	: STD_LOGIC_VECTOR(11 DOWNTO 0) := x"81A"; -- LSB Byte
	
end const_package;

