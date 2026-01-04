-- ===============================================================================================
--						**** TESTBENCH CONTADOR 6 bits CON RESET ASINCRÓNICO ****
--
--	El presente código implementa el desarrollo del Testbench del contador de 6 bits a fin de 
--	analizar el funcionamiento del mismo.
-- * ACERCA DEL CÓDIGO *
--
--		** GENERAR PULSO **
--			Dado que el flip flop requiere el pulso de reloj el bloque Generar_CLK se encarga de
--			generar este pulso, Datos:
--			PERIODO = 10 ns
--			Pulso completo se genera en 10 ns pero el flanco de subida y bajada tienen una duración
--			de 5 ns "wait for PERIODO/2", el pulso se genera al hacer aplicar una compuerta not a la
--			señal clk.
--		** NOTAS ** 
-- 	  		* DUT => Nombre de la instanciación
--    		* Instanciación directa
-- ===============================================================================================

-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad del Testbench
entity Contador6Bits_RA_TB is
end entity;

--Arquitectura del Testbench
architecture Testbench of Contador6Bits_RA_TB is
		-- Parámetros para generar los pulsos de reloj
		constant PERIODO : time := 10 ns;
		
		-- Señales internas del Testbench
		signal clk_TB : std_logic := '0';
		signal rst_TB : std_logic;
		signal Q_TB :  std_logic_vector(5 downto 0);

	begin 
	
		-- Instanciación
		DUT : entity work.Contador6Bits_RA
			port map( -- Mapeo de Señales
				clk => clk_TB, 
				rst => rst_TB,
				Q => Q_TB
			);
		--Generación de pulsos
		GENERAR_PULSO : process
		begin
			loop
				clk_TB <= not clk_TB;
				wait for PERIODO/2;
			end loop;
		end process;
		
		--Estimulos a señales internas del Testbench
		ESTIMULOS : process
		begin
			rst_TB <= '1'; wait for 12 ns;
			rst_TB <= '0'; wait for 652 ns;
			rst_TB <= '1'; wait for 12 ns;
			report "Simulacion finalizada ..." severity note; --Texto en consola
			std.env.stop; -- Paro de Simulacion
			
		end process; -- Fin de Estimulos
end Testbench; -- Fin del Testbench