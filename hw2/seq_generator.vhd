library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity seq_generator is
	port(
		clk: in std_logic;
		reset: in std_logic;	
		sel: in std_logic;
		dataout: out std_logic
	);
end seq_generator;

architecture fsm of seq_generator is
	type states is (S0,S1,S2,S3,S4,S5,S6,S7,S8);
	signal Crst,Nxst: states;
begin
	P1:process(clk,reset)
	begin
		if(reset='0') then
			Crst <=S0;
		elsif(clk'event and clk='1') then
			Crst <=Nxst;
		end if;
	end process P1;
	P2:process(Crst,sel)
	begin
		case Crst is
			when S0=>
				if(sel='1') then
					dataout<='1';
				else
					dataout<='0';
				end if;
				Nxst <=S1;
			when S1=>
				if(sel='1') then
					dataout<='1';
				else
					dataout<='0';
				end if;
				Nxst <=S2;
			when S2=>
				if(sel='1') then
					dataout<='1';
				else
					dataout<='0';
				end if;
				Nxst <=S3;
			when S3=>
				if(sel='1') then
					dataout<='0';
				else
					dataout<='1';
				end if;
				Nxst <=S4;
			when S4=>
				if(sel='1') then
					dataout<='1';
				else
					dataout<='0';
				end if;
				Nxst <=S5;
			when S5=>
				if(sel='1') then
					dataout<='0';
				else
					dataout<='1';
				end if;
				Nxst <=S6;
			when S6=>
				if(sel='1') then
					dataout<='0';
				else
					dataout<='1';
				end if;
				Nxst <=S7;
			when S7=>
				if(sel='1') then
					dataout<='1';
				else
					dataout<='0';
				end if;
				Nxst <=S8;
			when S8=>
				if(sel='1') then
					dataout<='1';
				else
					dataout<='0';
				end if;
				Nxst <=S0;
		end case;
	end process P2;
end fsm;