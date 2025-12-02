-- =========================================================================================
-- 				**** TESTBENCH SUMADOR DE 4 BITS DISPLAY 7 SEGMENTOS HEXADECIMAL****
--
--  El presente código implementa el desarrollo del Testbench del Restador de 4 bits con 
--	exhibidor de 7 segmentos, a fin de analizar el funcionamiento del mismo.
--  **NOTAS**
--	  * DUT => Nombre de la instanciación
--    * Instanciación Directa
-- 	Para el desarrollo del Testbench se generan valores mediante dos bucles for anidados 
--	los cuales mediante el iterador cuyo valor es truncado a 4 bits e inyectado a las
--	señales internas del Testbench para estimular el Restador de 4 bits, esto se hace para 
--	16 valores los mismos posibles para señales de 4 bits de ancho.
-- ========================================================================================

--Incluasión de librerias
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Entidad del Testbench
entity Restador4Bits_Exhibidor_TB is
end entity;

--Arquitectura 
architecture Testbench of Restador4Bits_Exhibidor_TB is
		--Señales internas del Testbench
		signal X_TB : std_logic_vector(3 downto 0);
		signal Y_TB : std_logic_vector(3 downto 0);
		signal CarrieNegSalida_TB : std_logic;
		signal X_Display_TB :  std_logic_vector(6 downto 0);
		signal Y_Display_TB :  std_logic_vector(6 downto 0);
		signal Resultado_TB : std_logic_vector(6 downto 0);
		
	begin
		--Instanciación del módulo
		DUT : entity work.Restador4Bits_Exhibidor
			port map( --Mapeo de señales
				 X => X_TB,
				 Y => Y_TB,
				 CarrieNegSalida => CarrieNegSalida_TB,
				 X_Display => X_Display_TB,
				 Y_Display => Y_Display_TB,
				 Resultado => Resultado_TB
			);
		--Estimulo de señales internas del Testbench
		Estimulos: process
			begin
					for i in 0 to 15 loop 
						for j in 0 to 15 loop
						
							X_TB <= std_logic_vector(to_unsigned(i, 4)); --Truncamiento de valores
							Y_TB <= std_logic_vector(to_unsigned(j, 4));
							wait for 10 ns; --Retardos
							
						end loop;
					end loop;
			wait;
			end process;--Fin de los estimulos
		
end Testbench; --Fin del Testbench