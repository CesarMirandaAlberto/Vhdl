-- ===============================================================================================
--						**** TESTBENCH CONTADOR 0 a 10 CON ACARREO ****
--
--	El presente código implementa el desarrollo del tesbench del contador 0 a 10 con acarreo 
--	a fin de analizar el funcionamiento del mismo.
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
entity Contador10_Acarreo_TB is
end entity;

-- Arquitectura
architecture Testbench of Contador10_Acarreo_TB is
		-- Parámetros para generar los pulsos de reloj
		constant PERIODO : time := 10 ns;
		
		-- Señales internas del Testbench
		signal rst_TB :  std_logic;
		signal clk_TB :  std_logic := '0';
		signal Carry_TB : std_logic;
		signal Q_TB :  std_logic_vector(3 downto 0);
		
	begin
		-- Instanciación
		DUT : entity work.Contador10_Acarreo
			port map( -- Mapeo de señales
				rst => rst_TB,
				clk => clk_TB,
				Carry => Carry_TB,
				Q => Q_TB
			);
		
		-- Generar pulsos de reloj
		GENERAR_PULSO : process
		begin
				loop
					clk_TB <= not clk_TB;
					wait for PERIODO/2;
				end loop;
		end process;
		
		-- Estimulos de señales internas del Testbench
		ESTIMULOS : process
		begin
					rst_TB <= '1'; wait for 12 ns;
					rst_TB <= '0'; wait for 122 ns;
					report "Simulacion finalizada..." severity note; -- Texto en consola
					std.env.stop; -- Paro de Simulacion
		end process; -- Fin de los estimulos de Señales
end Testbench; -- Fin del Testbench