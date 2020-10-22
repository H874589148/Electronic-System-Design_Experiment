---FPGA EXP1 @ 20201022 by hurui
library ieee;
use ieee.std_logic_1164.all;

entity FPGA_EXP1_tb is
end FPGA_EXP1_tb;

architecture arch_tb of FPGA_EXP1_tb is
	component FPGA_EXP1 is
	port(
		y0_n,y1_n,y2_n,y3_n,y4_n,y5_n,y6_n,y7_n :out std_logic;
		a,b,c :in std_logic
	);
	end component;
	
	signal y0_n,y1_n,y2_n,y3_n,y4_n,y5_n,y6_n,y7_n : std_logic;
	signal a,b,c : std_logic;

begin
	u_tb :FPGA_EXP1 port map(
		y0_n,y1_n,y2_n,y3_n,y4_n,y5_n,y6_n,y7_n,
		a,b,c);
		
	process
	begin
		a <= '0';
		b <= '0';
		c <= '0';
		wait for 20 ns;
		a <= '0';
		b <= '0';
		c <= '1';
		wait for 20 ns;
		a <= '0';
		b <= '1';
		c <= '0';
		wait for 20 ns;
		a <= '0';
		b <= '1';
		c <= '1';
		wait for 20 ns;
		a <= '1';
		b <= '0';
		c <= '0';
		wait for 20 ns;
		a <= '1';
		b <= '0';
		c <= '1';
		wait for 20 ns;
		a <= '1';
		b <= '1';
		c <= '0';
		wait for 20 ns;
		a <= '1';
		b <= '1';
		c <= '1';
		wait for 20 ns;
		a <= '0';
		b <= '0';
		c <= 'X';
		wait for 20 ns;
		
		a <= '0';
		b <= 'U';
		c <= '0';
		wait for 20 ns;
	end process;
end arch_tb;


