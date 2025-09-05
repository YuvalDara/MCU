LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY Shifter IS
	GENERIC(
		n : INTEGER := 32;
		k : INTEGER := 5 --log2(n)
	);
    PORT(
		y: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		x: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		shift_dir: IN STD_LOGIC; -- '1' for left, '0' for right
		outp: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0));
END Shifter;

-- implementation idea:
-- shift y input vector by exponents of 2 depending on bit values in x input vector
ARCHITECTURE behav OF Shifter IS
    SUBTYPE vector IS STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    TYPE matrix IS ARRAY (k DOWNTO 0) OF vector;
    SIGNAL row: matrix; -- saves the output after each step in the shift
	constant zeros_helper : STD_LOGIC_VECTOR(n-1 downto 0) := (others => '0'); -- helper vector for easy concatenation of desired size
BEGIN

		row(0) <= y;
		G1: for m in 0 to k-1 generate
		-- if shift is needed, shift all required bits and concatenate zeroes
		-- example: "10010110" shifted by 4 left (n=8, m=2) means move "0110" by 4 to the left and concatenate "0000"
		-- if shift not needed, just copy the previous
			row(m+1) <= row(m)(n-1-2**m downto 0) & zeros_helper(2**m-1 downto 0)   when x(m) = '1' and shift_dir = '1' else -- left shift
						zeros_helper(n-1 downto n-2**m) & row(m)(n-1 downto 2**m) 	when x(m) = '1' and shift_dir = '0' else -- right shift
						row(m); -- if no shift required for this bit, copy last row
		end generate;
		outp <= row(k);
	
END behav;