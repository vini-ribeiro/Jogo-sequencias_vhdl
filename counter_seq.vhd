library ieee;
use ieee.std_logic_1164.all; 
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity counter_seq is port( 
    Reset, Enable, Clock: in std_logic;
    end_sequence: out std_logic;
	seq: out std_logic_vector(2 downto 0));
end counter_seq;

architecture arc_counter_seq of counter_seq is
	signal cnt: std_logic_vector(2 downto 0);
begin

	process(Clock, Reset, Enable)
	begin
		if (Reset = '1') then
			cnt <= "000";
		elsif (Clock'event and Clock = '1' and cnt < "011") then
			if (Enable = '1') then
				cnt <= cnt + "001";
			end if;
		elsif (Clock'event and Clock = '1') then
		    end_sequence <= '1';
		    cnt <= "100";
		end if;
	end process;
	
	seq <= cnt;
	
end arc_counter_seq;