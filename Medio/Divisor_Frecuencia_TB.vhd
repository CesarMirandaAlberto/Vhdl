library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Divisor_Frecuencia_TB is
end entity;

architecture DivisorTB of Divisor_Frecuencia_TB is
	
		constant PERIODO : time := 20 ns;
		
		signal clk_Entrada_TB : std_logic := '0';
		signal rst_TB : std_logic;
		signal clk_Salida_TB : std_logic;
		
begin

	DUT : entity work.Divisor_Frecuencia
		port map(
			clk_Entrada => clk_Entrada_TB,
			rst => rst_TB,
			clk_Salida => clk_Salida_TB
		);
		
	GENERAR_PULSO : process
	begin
		clk_Entrada_TB <= not clk_Entrada_TB;
		wait for PERIODO/2;
	end process;
	
	ESTIMULOS : process
	begin
			rst_TB <= '1'; wait for 40 ns;
			rst_TB <= '0'; wait for 10 ms;
			report "Simulacion Finalizada..." severity note;
			std.env.stop;
	end process;
end DivisorTB;