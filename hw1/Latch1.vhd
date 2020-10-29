library ieee;
use ieee.std_logic_1164.all;

entity Latch1 is
	port(
		cs_in: in std_logic_vector(2 downto 0);
		D1: in std_logic_vector(3 downto 0);
		en: in std_logic;
		Q1: out std_logic_vector(31 downto 0)
	);
end Latch1;

architecture dec_Latch of Latch1 is
	component decoder_own is
		port(
			data_in: in std_logic_vector(2 downto 0);
			data_out: out std_logic_vector(7 downto 0)
		);
	end component;
	component latch_own is
		port(
			en,cs: in std_logic;
			D: in std_logic_vector (3 downto 0);
			Q: out std_logic_vector (3 downto 0)
		);
	end component;
	signal cs_out:std_logic_vector(7 downto 0);
begin
	deco: decoder_own port map(data_in=>cs_in, data_out => cs_out);
	L1: for i in 0 to 7 generate
		lat: latch_own port map(en, cs_out(i), D1, Q1(4*i+3 downto 4*i));
	end generate L1;
end dec_Latch;