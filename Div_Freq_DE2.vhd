library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--para uso com o clock de 50MHz da placa DE2 (CLOCK_50)

entity Div_Freq_DE2 is
	port (	    clk: in std_logic;
				reset: in std_logic;
				CLK_1Hz, sim_2hz: out std_logic
			);
end Div_Freq_DE2;

architecture divisor of Div_Freq_DE2 is
	signal cont: std_logic_vector(27 downto 0); -- Registra valor da contagem
	
	begin
		P1: process(clk, reset, cont)
		begin
			
			 if reset= '1' then
				 cont <= x"0000000";
				 CLK_1Hz <= '0';
				 sim_2hz <= '0';
				 
			 elsif clk'event and clk = '1' then

				
				--1Hz = 1s = 50.000.000Hz = 50.000.000
				if cont < x"17D783F" then  --se contador < 24.999.999 (17D783F em hexadecimal)
					--CLK_1Hz <= '1';
					cont <= cont + 1;
					sim_2hz <= '0';
					clk_1Hz <='0';
					
				elsif cont < x"2FAF07F" then  --se contador < 49.999.999 (2FAF07F em hexadecimal)
					CLK_1Hz <= '0';
					cont <= cont + 1;
					sim_2hz <= '1';
				
				else  
					cont <= x"0000000";
					CLK_1Hz <= '1';
					sim_2hz <= '1';
					
				end if;
			 end if;
		end process;
			
end architecture;