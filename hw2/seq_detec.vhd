library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity seq_detec is
	port(
		clk: in std_logic;
		reset: in std_logic;
		sel: in std_logic;
		div_sel: in std_logic_vector(1 downto 0);
		detector_out: out std_logic
	);
end seq_detec;

architecture whole of seq_detec is
	component seq_detector is
		port(
			clk: in std_logic;
			reset: in std_logic;
			datainput: in std_logic;
			detector_out: out std_logic
		);
	end component;
	component seq_generator is
		port(
			clk: in std_logic;
			reset: in std_logic;	
			sel: in std_logic;
			dataout: out std_logic
		);
	end component;
	component divider_sel is
		port(
			clk_in: in std_logic;
			reset: in std_logic;
			div_sel: in std_logic_vector(1 downto 0);
			clk_out:out std_logic
		);
	end component;
	signal data_out: std_logic;
	signal clk_out: std_logic;
begin
	detect:seq_detector port map(clk_out,reset,data_out,detector_out);
	gen: seq_generator port map(clk_out,reset,sel,data_out);
	div: divider_sel port map(clk,reset,div_sel,clk_out);
end whole;