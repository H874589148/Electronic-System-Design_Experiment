---FPGA EXP2 @ 20201022 by hurui
LIBRARY IEEE;
USE ieee.std_logic_1164.all;

entity counter4_tb is
end counter4_tb;

ARCHITECTURE arch_tb of counter4_tb IS
	component counter4 is
	port( 
		d1,d0: IN Std_logic;
		p: OUT Std_logic;
		q: OUT Std_logic_vector (6 downto 0)
	);
	END component;
	
	signal d1,d0: Std_logic;
	signal p: Std_logic;
	signal q: Std_logic_vector (6 downto 0);
	
BEGIN
		u_tb :counter4 port map(
		d1,d0,p,q);
		PROCESS
		BEGIN
		d0 <= '0';
		d1 <= '0';
		wait for 20 ns;
		d0 <= '0';
		d1 <= '1';
		wait for 20 ns;
		d0 <= '1';
		d1 <= '0';
		wait for 20 ns;
		d0 <= '1';
		d1 <= '1';
		wait for 20 ns;
	END PROCESS ;
END arch_tb;
