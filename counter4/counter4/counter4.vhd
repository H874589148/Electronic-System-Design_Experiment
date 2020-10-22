---FPGA EXP2 @ 20201022 by hurui
LIBRARY IEEE;
USE ieee.std_logic_1164.all;

entity counter4 is
port( 
	d1,d0: IN Std_logic;
	p: OUT Std_logic;
	q: OUT Std_logic_vector (6 downto 0)
);
END counter4;

ARCHITECTURE behave of counter4 IS
	signal tmp: std_logic_vector(1 downto 0) ;
BEGIN
		p<='1';
		tmp <= d1 & d0;
		PROCESS (tmp)
		BEGIN
		case tmp is
			when "00" => q <= "0000001";
			when "01" => q <= "1001111";
			when "10" => q <= "0010010";
			when "11" => q <= "0000110";
			when others => null;
		end case ;
	END PROCESS ;
END behave;