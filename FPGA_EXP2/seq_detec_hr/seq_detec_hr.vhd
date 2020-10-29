---顶层模块 @ 20201029 by hurui

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity seq_detec_hr is                       --顶层模块
	port(
		clk: in std_logic;
		reset: in std_logic;
		sel: in std_logic;
		div_sel: in std_logic_vector(1 downto 0);
		detector_out: out std_logic
	);
end seq_detec_hr;

architecture whole of seq_detec_hr is

	component seq_detector_hr is             --序列检测器
		port(
			clk: in std_logic;
			reset: in std_logic;
			datainput: in std_logic;
			detector_out: out std_logic
		);
	end component;
	
	component seq_generator_hr is           --序列产生器 & 序列选择器
		port(
			clk: in std_logic;
			reset: in std_logic;	
			sel: in std_logic;
			dataout: out std_logic
		);
	end component;
	
	component divider_sel_hr is             --分频器
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
	detect:seq_detector_hr port map(clk_out,reset,data_out,detector_out);
	gen: seq_generator_hr port map(clk_out,reset,sel,data_out);
	div: divider_sel_hr port map(clk,reset,div_sel,clk_out);
end whole;