library ieee;
use ieee.std_logic_1164.all;

entity latch_own is
	port(
		en,cs: in std_logic;
		D: in std_logic_vector (3 downto 0);
		Q: out std_logic_vector (3 downto 0)
	);
end latch_own;

architecture behave of latch_own is
begin
	process(en,cs,D)
	begin
		if(cs='1' and en='1')then
			Q <= D;
		end if;
	end process;
end behave;