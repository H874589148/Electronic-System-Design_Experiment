library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity seq_detec_tb is 
end seq_detec_tb;

architecture arch_tb of seq_detec_tb is
	component seq_detec is
		port(
			clk: in std_logic;
			reset: in std_logic;
			sel: in std_logic;
			div_sel: in std_logic_vector(1 downto 0);
			detector_out: out std_logic
		);
	end component;
	signal clk: std_logic:='0';
	signal reset: std_logic:='1';
	signal sel: std_logic:='0';
	signal div_sel: std_logic_vector(1 downto 0):="00";
	signal detector_out: std_logic;
begin
	ins: seq_detec port map(clk,reset,sel,div_sel,detector_out);
	process
	begin
		wait for 10ns;
		clk <='1';
		wait for 10ns;
		clk <='0';
	end process;
	process
	begin
		reset <='0';
		sel<='1';
		wait for 10ns;
		reset <='1';
		wait for 1000ns;
	end process;
end arch_tb;

