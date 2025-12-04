-- ========================================================================================
--							**** TESTBENCH LATCH SR ****
--
--	El presente código implementa el desarrollo del Testbench del Latch SR a fin de analizar
--	el funcionamiento del mismo.
--	** NOTAS ** 
-- 	  * DUT => Nombre de la instanciación
--    * Instanciación directa
-- ========================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad del Testbench
entity Latch_SR_TB is
end entity;

--Arquitectura
architecture Testbench of Latch_SR_TB is
		--Señales internas del Testbench
		signal S_TB :  std_logic;
		signal R_TB :  std_logic;
		signal Q_TB :  std_logic;
		signal QN_TB : std_logic;
		
	begin
		--Instanciación
		DUT : entity work.Latch_SR
			port map( --Mapeo de señales
				S => S_TB, 
				R => R_TB,
				Q => Q_TB,
				QN => QN_TB
			);
		
		--Estimulos a las señales internas
		Estimulos : process
		begin
			S_TB <='0'; R_TB<='0'; wait for 10 ns;
			S_TB <='0'; R_TB<='1'; wait for 10 ns;
			S_TB <='1'; R_TB<='0'; wait for 10 ns;
			S_TB <='1'; R_TB<='1'; wait for 10 ns;
			S_TB <='0'; R_TB<='1'; wait for 10 ns;
			S_TB <='1'; R_TB<='0'; wait for 10 ns;
			S_TB <='1'; R_TB<='1'; wait for 10 ns;
			S_TB <='0'; R_TB<='0'; wait for 10 ns;
			wait;
		end process; --Fin de estimulos
		
end Testbench; --Fin del Testbench
