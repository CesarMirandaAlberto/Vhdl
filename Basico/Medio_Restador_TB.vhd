-- ================================================================================
--						**** TESTBENCH MEDIO RESTADOR ****
--
--	El presente código implementa el desarrollo del testbench del medio restador a
--	fin de analizar el funcionamiento del mismo.
--  NOTAS
--	DUT : Nombre de la instanciación
--	La instanciación de la entidad es directa
-- ================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad del Testbench
entity Medio_Restador_TB is
end entity;

--Arquitectura del Testbench
architecture Testbench of Medio_Restador_TB is
				--Señales internas del Testbench
				signal X_TB : std_logic;
				signal Y_TB : std_logic;
				signal R_TB: std_logic;
				signal AN_TB : std_logic;
	
	begin
	--instanciación de la entidad
	DUT : entity work.Medio_Restador
		port map( --Mapeo de señales
			X => X_TB,
			Y => Y_TB,
			R => R_TB,
			AN => AN_TB
		);
	--Estimulos del Testbench
	Estimulos: process
		begin
		
			X_TB <= '0'; Y_TB <='0'; wait for 10 ns;
			X_TB <= '0'; Y_TB <='1'; wait for 10 ns;
			X_TB <= '1'; Y_TB <='0'; wait for 10 ns;
			X_TB <= '1'; Y_TB <='1'; wait for 10 ns;
			wait;
	end process;
	
end Testbench; --Fin del Testbench