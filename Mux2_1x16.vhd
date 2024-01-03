library ieee;
use ieee.std_logic_1164.all; 

entity Mux2_1x16 is port( 
	S     : in  std_logic;
    L0, L1: in  std_logic_vector(15 downto 0);
    D     : out std_logic_vector(15 downto 0));
end Mux2_1x16;

architecture arc_Mux2_1x16 of Mux2_1x16 is
begin

	D <= L0 when S = '0' else
				L1;
	
end arc_Mux2_1x16;
