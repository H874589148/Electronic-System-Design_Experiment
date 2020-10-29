library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity seq_detector_hr_tb is 
end seq_detector_hr_tb;

architecture arch_tb of seq_detector_hr_tb is
	component seq_detector_hr is
		port(
			clk: in std_logic;
			reset: in std_logic;
			datainput: in std_logic;
			detector_out: out std_logic
		);
	end component;
	signal clk: std_logic:='0';
	signal reset: std_logic:='1';
	signal datainput: std_logic:='0';
	signal detector_out: std_logic;
begin
	ins: seq_detector_hr port map(clk,reset,datainput,detector_out);
	process
	begin
		wait for 10ns;
		clk <='1';
		wait for 10ns;
		clk <='0';
	end process;
	process
	begin
		wait for 10ns;
		reset <='0';
		wait for 10ns;
		reset <='1';
		wait for 20ns;
		datainput <='1';
		wait for 20ns;
		datainput <='1';
		wait for 20ns;
		datainput <='1';
		wait for 20ns;
		datainput <='0';
		wait for 20ns;
		datainput <='1';
		wait for 20ns;
		datainput <='0';
		wait for 20ns;
		datainput <='0';
		wait for 20ns;
		datainput <='1';
		wait for 20ns;
		datainput <='1';
		wait for 20ns;
		datainput <='0';
	end process;
end arch_tb;