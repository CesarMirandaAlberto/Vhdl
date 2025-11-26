-- ================================================================================
--						**** TESTBENCH RESTADOR COMPLETO ****
--
--	El presente código implementa el desarrollo del Testbench para el restador 
--	completo, a fin de analizar el funcionamiento del mismo.
--	NOTAS
-- 	DUT: Nombre de la instanciación
--  La instanciación de la entidad es directa
-- ================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad del Testbench
entity Restador_Completo_TB is
end entity;

--Arquitectura del tesbench
architecture Testbench of Restador_Completo_TB is
		--Señales internas del Testbench
		signal X_TB : std_logic;
		signal Y_TB : std_logic;
		signal CarrieNEntrada_TB: std_logic;
		signal R_TB : std_logic;
		signal CarrieNSalida_TB : std_logic;
		
	begin
		--Instanciación de la entidad
		DUT:  entity  work.Restador_Completo
			port map( --Mapeo de señales
				X => X_TB,
				Y => Y_TB,
				CarrieNEntrada => CarrieNEntrada_TB,
				R => R_TB,
				CarrieNSalida => CarrieNSalida_TB
			);
			
		--Estimulos en el Testbench	
		Estimulos: process
			begin
			
						X_TB <= '0'; Y_TB <= '0'; CarrieNEntrada_TB<= '0'; wait for 10 ns;
						X_TB <= '0'; Y_TB <= '0'; CarrieNEntrada_TB<= '1'; wait for 10 ns;
						X_TB <= '0'; Y_TB <= '1'; CarrieNEntrada_TB<= '0'; wait for 10 ns;
						X_TB <= '0'; Y_TB <= '1'; CarrieNEntrada_TB<= '1'; wait for 10 ns;
						
						X_TB <= '1'; Y_TB <= '0'; CarrieNEntrada_TB<= '0'; wait for 10 ns;
						X_TB <= '1'; Y_TB <= '0'; CarrieNEntrada_TB<= '1'; wait for 10 ns;
						X_TB <= '1'; Y_TB <= '1'; CarrieNEntrada_TB<= '0'; wait for 10 ns;
						X_TB <= '1'; Y_TB <= '1'; CarrieNEntrada_TB<= '1'; wait for 10 ns;
						wait;
		
		end process;
end Testbench; --Fin del Testbench