-- ========================================================================================
--									**** TESTBENCH LATCH D ****
--
--	El presente código implementa el desarrollo del Testbench para el latch D a fin de
--	analizar el funcionamiento del mismo.
--	** NOTAS ** 
-- 	  * DUT => Nombre de la instanciación
--    * Instanciación directa
-- ========================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad del Testbench
entity Latch_D_TB is
end entity;

--Arquitectura
architecture Testbench of Latch_D_TB is
		
		--Señales internas del Testbench
		signal E_TB : std_logic;
		signal D_TB : std_logic;
		signal Q_TB : std_logic;
		signal QN_TB : std_logic;

		begin
			--Instanciación del latch
			DUT : entity work.Latch_D
				port map( --Mapeo de señales
					E => E_TB, 
					D => D_TB,
					Q => Q_TB,
					QN => QN_TB
				);
			
			--Aplicación de estimulos a las señales internas del Testbench
			Estimulos : process begin
			
				E_TB <= '0';  D_TB<= '1'; wait for 10 ns;
				
				E_TB <= '1';  D_TB<= '0'; wait for 10 ns;
				E_TB <= '1';  D_TB<= '1'; wait for 10 ns;
				E_TB <= '0';  D_TB<= '0'; wait for 10 ns;
				wait;
			
			end process;
		
end Testbench; --Fin del Testbench