library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity Comparador is
port(
	in0, in1: in  std_logic_vector(7 downto 0);
    S       : out std_logic
	);
end Comparador;

architecture arch_Comparador of Comparador is
begin
    
    S <= '1' when in0 = in1 else '0';

end arch_Comparador;