library ieee;
use ieee.std_logic_1164.all; 
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity counter_round is port( 
   Set, Enable, Clock: in  std_logic;
    end_round           : out std_logic;
    Y                   : out std_logic_vector(3 downto 0));
end counter_round;

architecture arc_counter_round of counter_round is
	signal cnt: std_logic_vector(4 downto 0);
begin

	process(Clock, set, Enable)
	begin
		if (Set = '1') then
			cnt <= "01111";
		elsif (Clock'event and Clock = '1' and not (cnt = "00000")) then
			if (Enable = '1') then
				cnt <= cnt + "11111";
			end if;
		end if;
	end process;
	
	end_round <= '1' when (cnt = "00000") else '0';
	
	Y <= cnt(3 downto 0);
	
end arc_counter_round;