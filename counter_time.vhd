library ieee;
use ieee.std_logic_1164.all; 
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity counter_time is port( 
   Set, Enable, Clock: in  std_logic;
	 Load                     : in  std_logic_vector(7 downto 0);
    end_time                 : out std_logic;
    t_out                    : out std_logic_vector(7 downto 0));
end counter_time;

architecture arc_counter_time of counter_time is
	signal cnt: std_logic_vector(7 downto 0);
begin

	process(Clock, Set, Enable, Load)
	begin
		if (Set = '1') then
			cnt <= "01100011";
		elsif (Clock'event and Clock = '1' and (not ((cnt < "00000001") or (cnt > "01111111")))) then
			if (Enable = '1') then
				cnt <= cnt + Load;
			end if;
		end if;
	end process;
	
	end_time <= '1' when ((cnt < "00000001") or (cnt > "01111111")) else '0';
	
	t_out <= cnt;
	
end arc_counter_time;