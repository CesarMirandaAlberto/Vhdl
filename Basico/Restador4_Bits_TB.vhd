-- ===========================================================================
--						**** TESTBENCH RESTADOR DE 4 BITS ****
--
--	El presente código implementa el desarrollo del Testbench para analizar el
--	funcionamiento del restador de 4 bits.
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
entity Restador4_Bits_TB is
end entity;

--Arquitectura
architecture Testbench of Restador4_Bits_TB is
	
		--Señales internas del Testbench
		signal X_TB : std_logic_vector(3 downto 0);
		signal Y_TB : std_logic_vector(3 downto 0);
		signal CarrieNegSalida_TB : std_logic;
		signal R_TB : std_logic_vector(3 downto 0);
		
	begin 
		--instanciación del módulo
		DUT: entity work.Restador4_Bits
			port map( --Mapeo de señales
				X => X_TB,
				Y => Y_TB,
				CarrieNegSalida => CarrieNegSalida_TB,
				R => R_TB
			);
		
		--Estimulos y generación de valores
		Estimulos: process
		begin	
			for i in 0 to 15 loop
				for j in 0 to 15 loop
				
					X_TB <= std_logic_vector(to_unsigned(i, 4)); --Truncamiento de variables e inyección de datos
					Y_TB <= std_logic_vector(to_unsigned(j, 4));
					wait for 10 ns; --Retardos
					 
				end loop;
			end loop;
					
	
		
		wait; --Fin
		end process; --Fin de los estimulos
end Testbench;--Fin del Testbench