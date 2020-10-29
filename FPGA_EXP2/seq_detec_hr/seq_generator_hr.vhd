---序列产生器 & 序列选择器 @ 20201029 by hurui

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity seq_generator_hr is  --序列产生器
	port(
		clk: in std_logic;
		reset: in std_logic;	
		sel: in std_logic;    --选择器
		dataout: out std_logic
	);
end seq_generator_hr;

architecture fsm of seq_generator_hr is
	type states is (S0,S1,S2,S3,S4,S5,S6,S7,S8);
	signal Crst,Nxst: states;

begin

	P1:process(clk,reset)
	begin
		if(reset='0') then
			Crst <=S0;          --当前状态
		elsif(clk'event and clk='1') then
			Crst <=Nxst;        --下一状态
		end if;
	end process P1;
	
	P2:process(Crst,sel)         --选择器选1时序列为111010011
	begin                        --选择器选0时序列为000101100
		case Crst is
			when S0=>
				if(sel='1') then
					dataout<='1';    --选择器选1时序列为1
				else
					dataout<='0';
				end if;
				Nxst <=S1;
			when S1=>
				if(sel='1') then
					dataout<='1';    --选择器选1时序列为1
				else
					dataout<='0';
				end if;
				Nxst <=S2;
			when S2=>
				if(sel='1') then
					dataout<='1';    --选择器选1时序列为1
				else
					dataout<='0';
				end if;
				Nxst <=S3;
			when S3=>
				if(sel='1') then
					dataout<='0';    --选择器选1时序列为0
				else
					dataout<='1';
				end if;
				Nxst <=S4;
			when S4=>
				if(sel='1') then
					dataout<='1';    --选择器选1时序列为1
				else
					dataout<='0';
				end if;
				Nxst <=S5;
			when S5=>
				if(sel='1') then
					dataout<='0';    --选择器选1时序列为0
				else
					dataout<='1';
				end if;
				Nxst <=S6;
			when S6=>
				if(sel='1') then
					dataout<='0';    --选择器选1时序列为0
				else
					dataout<='1';
				end if;
				Nxst <=S7;
			when S7=>
				if(sel='1') then
					dataout<='1';    --选择器选1时序列为1
				else
					dataout<='0';
				end if;
				Nxst <=S8;
			when S8=>
				if(sel='1') then
					dataout<='1';    --选择器选1时序列为1
				else
					dataout<='0';
				end if;
				Nxst <=S0;
		end case;
	end process P2;
end fsm;