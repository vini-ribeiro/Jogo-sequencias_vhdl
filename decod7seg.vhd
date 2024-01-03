library ieee;
use ieee.std_logic_1164.all;

entity decod7seg is
port(
    input: in std_logic_vector(3 downto 0);
    output: out std_logic_vector(6 downto 0)
	);
end decod7seg;

architecture arch_decod7seg of decod7seg is
begin
    
    output <= "1000000" when input(3 downto 0) = "0000" else
            "1111001" when input(3 downto 0) = "0001" else
            "0100100" when input(3 downto 0) = "0010" else
            "0110000" when input(3 downto 0) = "0011" else
            "0011001" when input(3 downto 0) = "0100" else
            "0010010" when input(3 downto 0) = "0101" else
            "0000010" when input(3 downto 0) = "0110" else
            "1111000" when input(3 downto 0) = "0111" else
            "0000000" when input(3 downto 0) = "1000" else
            "0011000" when input(3 downto 0) = "1001" else
            "1111111";

end arch_decod7seg;