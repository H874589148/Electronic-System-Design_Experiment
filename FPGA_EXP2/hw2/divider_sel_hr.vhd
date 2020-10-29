library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity divider_sel_hr IS
	port(
		clk_in: in std_logic;
		reset: in std_logic;
		div_sel: in std_logic_vector(1 downto 0);
		clk_out:out std_logic
	);
end divider_sel_hr;

architecture div of divider_sel_hr is
	signal cnt:std_logic_vector(3 downto 0);
begin
	process(clk_in,reset)
	begin
		if(reset='0') then
			cnt<="0000";
		elsif(clk_in'event and clk_in='1') then
			cnt<=cnt+1;
		end if;
	end process;
	process(div_sel,cnt)
	begin
		case div_sel is
			when "00"=>
				clk_out <=cnt(0);
			when "01"=>
				clk_out <=cnt(1);
			when "10"=>
				clk_out <=cnt(2);
			when "11"=>
				clk_out <=cnt(3);
			when others=>
				clk_out <='0';
		end case;
	end process;
end div;
