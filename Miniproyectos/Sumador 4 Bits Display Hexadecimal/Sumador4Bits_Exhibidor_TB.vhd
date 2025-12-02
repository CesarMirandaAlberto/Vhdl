-- =========================================================================================
-- 				**** TESTBENCH SUMADOR DE 4 BITS DISPLAY 7 SEGMENTOS ****
--
--  El presente código implementa el desarrollo del Testbench del sumador de 4 bits con 
--	exhibidor de 7 segmentos, a fin de analizar el funcionamiento del mismo.
--  **NOTAS**
--	  * DUT => Nombre de la instanciación
--    * Instanciación Directa
-- ========================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad del Testbench
entity Sumador4Bits_Exhibidor_TB is
end entity;

--Arquitectura
architecture Testbench of Sumador4Bits_Exhibidor_TB is
	
		--Señales internas del Testbench
		signal X_TB : std_logic_vector(3 downto 0);
		signal Y_TB : std_logic_vector(3 downto 0);
		signal CarriSalida_TB : std_logic;
		signal X_Display_TB :  std_logic_vector(6 downto 0);
		signal Y_Display_TB :  std_logic_vector(6 downto 0);
		signal Resultado_TB: std_logic_vector(6 downto 0);
		
	
	begin
		--instanciación del módulo
		DUT : entity  work.Sumador4Bits_Exhibidor
			port map(
				X => X_TB,
				Y => Y_TB,
				CarriSalida => CarriSalida_TB,
				X_Display => X_Display_TB,
				Y_Display => Y_Display_TB,
				Resultado => Resultado_TB
			);

		--Apliación de estimulos a las señales del Testbench
		Estimulos: process
			begin
						--Inyección de valores 
						X_TB <="0000"; Y_TB <= "0010"; wait for 10 ns;
						X_TB <="0001"; Y_TB <= "0101"; wait for 10 ns;
						X_TB <="0010"; Y_TB <= "0011"; wait for 10 ns;
						X_TB <="0011"; Y_TB <= "0011"; wait for 10 ns;
						X_TB <="0100"; Y_TB <= "0100"; wait for 10 ns;
						X_TB <="0101"; Y_TB <= "0101"; wait for 10 ns;
						X_TB <="0110"; Y_TB <= "0011"; wait for 10 ns;
						X_TB <="0111"; Y_TB <= "0111"; wait for 10 ns;
						X_TB <="1000"; Y_TB <= "0011"; wait for 10 ns;
						wait;
		end process; --Fin de los estimulos
		
end Testbench; -- Fin del Testbench