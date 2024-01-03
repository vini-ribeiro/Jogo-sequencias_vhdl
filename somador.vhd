library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity somador is
port(
	A, B: in std_logic_vector(7 downto 0);
	S: out std_logic_vector(7 downto 0)
	);
end somador;

architecture arc_somador of somador is
begin
    
   S <= A + B; 

end arc_somador;