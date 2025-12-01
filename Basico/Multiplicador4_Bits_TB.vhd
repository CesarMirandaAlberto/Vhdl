-- ===========================================================================
--					**** TESTBENCH MULTIPLICADOR DE 4 BITS ****
--
--	El presente código implementa el desarrollo del Testbench del multiplicador 
-- 	de 4 bits a fin de analizar el funcionamiento del mismo.
-- 	Se generán numeros mediante dos bucles for en las variables i e j 
--	los valores de estas variables son inyectados a las señales internas del
--  Testbench y a su vez estas estimulan el módulo. 
--	Los valores generados por los bucles son truncados a 4 bits.
--  **NOTAS**
--	  * DUT => Nombre de la instanciación
--	  * Instanciación directa de la entidad
-- ===========================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Entidad del Testbench
entity Multiplicador4_Bits_TB is
end entity;

--Arquitectura
architecture Testbench of Multiplicador4_Bits_TB is
		
		--16 combinaciones partiendo desde el 0 para un número de 4 bits
		constant COMBINACIONES: integer := 15;
		
		--Señales internas del Testbench
		signal X_TB :  std_logic_vector(3 downto 0);
		signal Y_TB :  std_logic_vector(3 downto 0);
		signal Salida_TB : std_logic_vector( 7 downto 0);
	
	begin
		--Instanciación de la entidad
		DUT : entity work.Multiplicador4_Bits
			port map( --Mapeo de señales
				X => X_TB,
				Y => Y_TB,
				Salida => Salida_TB
			);
	--Estimulos	
	Estimulos: process
	begin
			--Generación de valores
			for i in 0 to COMBINACIONES loop
				for j in 0 to COMBINACIONES loop
					X_TB <= std_logic_vector(to_unsigned(i, 4)); --Inyección de valores a señales internas
					Y_TB <= std_logic_vector(to_unsigned(j, 4));
					wait for 10 ns;
				end loop;
			end loop;
	
	wait;
	end process; --Fin de los Estimulos
end Testbench; --Fin del Testbench