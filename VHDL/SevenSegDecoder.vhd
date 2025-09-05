LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;

ENTITY SevenSegDecoder IS
	GENERIC(
		n : INTEGER := 4;
		SegmentSize : INTEGER := 7
	);
	PORT(
		data 	: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		seg  	: OUT STD_LOGIC_VECTOR(SegmentSize-1 DOWNTO 0)
	);
END SevenSegDecoder;

ARCHITECTURE dfl OF SevenSegDecoder IS
	SIGNAL data_mid 	: STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	SIGNAL seg_mid  	: STD_LOGIC_VECTOR(SegmentSize-1 DOWNTO 0);
BEGIN
  data_mid <= data;

  seg_mid <= 	"1000000" when data_mid = "0000" else -- 0
				"1111001" when data_mid = "0001" else -- 1
				"0100100" when data_mid = "0010" else -- 2
				"0110000" when data_mid = "0011" else -- 3
				"0011001" when data_mid = "0100" else -- 4
				"0010010" when data_mid = "0101" else -- 5
				"0000010" when data_mid = "0110" else -- 6
				"1111000" when data_mid = "0111" else -- 7
				"0000000" when data_mid = "1000" else -- 8
				"0010000" when data_mid = "1001" else -- 9
				"0001000" when data_mid = "1010" else -- A
				"0000011" when data_mid = "1011" else -- B
				"1000110" when data_mid = "1100" else -- C
				"0100001" when data_mid = "1101" else -- D
				"0000110" when data_mid = "1110" else -- E
				"0001110" when data_mid = "1111" else -- F
				"1111111"; -- Default/None

  seg <= seg_mid;
END dfl;
