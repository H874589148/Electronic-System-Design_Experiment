---序列检测器 @ 20201029 by hurui

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity seq_detector_hr is             --序列检测器
	port(
		clk: in std_logic;
		reset: in std_logic;
		datainput: in std_logic;
		detector_out: out std_logic
	);
end seq_detector_hr;

architecture FSM of seq_detector_hr is
	type states is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9);
	signal Crst, Nxst: states;
	
begin

	P1:process(clk,reset)  
	begin
		if(reset='0') then
			Crst <=S0;
		elsif(clk'event and clk='1') then
			Crst <=Nxst;
		end if;
	end process P1;
	
	P2:process(Crst,datainput)
	begin
		case Crst is
			when S0=>
				if(datainput='1') then
					Nxst <=S1;
				else
					Nxst <=S0;
				end if;
			when S1=>
				if(datainput='1') then
					Nxst <=S2;
				else
					Nxst <=S0;
				end if;
			when S2=>
				if(datainput='1') then
					Nxst <=S3;
				else
					Nxst <=S0;
				end if;
			when S3=>
				if(datainput='0') then
					Nxst <=S4;
				else
					Nxst <=S3;
				end if;
			when S4=>
				if(datainput='1') then
					Nxst <=S5;
				else
					Nxst <=S0;
				end if;
			when S5=>
				if(datainput='0') then
					Nxst <=S6;
				else
					Nxst <=S1;
				end if;
			when S6=>
				if(datainput='0') then
					Nxst <=S7;
				else
					Nxst <=S1;
				end if;
			when S7=>
				if(datainput='1') then
					Nxst <=S8;
				else
					Nxst <=S0;
				end if;
			when S8=>
				if(datainput='1') then
					Nxst <=S9;
				else
					Nxst <=S0;
				end if;
			when S9=>
				if(datainput='1') then
					Nxst <=S1;
				else
					Nxst <=S0;
				end if;
		end case;
	end process P2;
	
	P3:process(Crst)
	begin
		case Crst is
			when S0 => detector_out<='0';
			when S1 => detector_out<='0';
			when S2 => detector_out<='0';
			when S3 => detector_out<='0';
			when S4 => detector_out<='0';
			when S5 => detector_out<='0';
			when S6 => detector_out<='0';
			when S7 => detector_out<='0';
			when S8 => detector_out<='0';
			when S9 => detector_out<='1';
		end case;
	end process P3;
	
end FSM;


