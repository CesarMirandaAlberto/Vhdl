-- ===========================================================================
--				****  TESTBENCH FLIP FLOP JK ****
--
--	El presente código implementa el desarrollo del Testbench para el flip FLOP
--	JK a fin de analizar el funcionamiento del código.
--	 * ACERCA DEL CÓDIGO *
--
--		** GENERAR PULSO **
--			Dado que el flip flop requiere el pulso de reloj el bloque Generar_CLK se encarga de
--			generar este pulso, Datos:
--			PERIODO = 10 ns
--			20 ciclos 
--			Pulso completo se genera en 10 ns pero el flanco de subida y bajada tienen una duración
--			de 5 ns "wait for PERIODO/2", el pulso se genera al hacer aplicar una compuerta not a la
--			señal clk.
--		** NOTAS ** 
-- 	  		* DUT => Nombre de la instanciación
--    		* Instanciación directa
-- ========================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad del Testbench
entity FlipFlop_JK_TB is
end entity;

--Arquitectura
architecture Testbench of FlipFlop_JK_TB is
		-- Parámetros para generar los pulsos de reloj
		constant PERIODO : time := 10 ns;
		constant TOTALCICLOS : integer := 20;
		
		--Señales internas del Testbench
		signal clk_TB : std_logic := '0';
		signal J_TB :  std_logic;
		signal K_TB :  std_logic;
		signal Q_TB :  std_logic;
		signal QN_TB : std_logic;
		
		begin
			--Instanciación 
			DUT : entity work.FlipFlop_JK
				port map( --Mapeo de señales
					clk => clk_TB,
					J => J_TB,
					K => K_TB,
					Q => Q_TB,
					QN => QN_TB
				);

			GENERAR_PULSO : process --Generación de pulsos
				variable Ciclos : integer := 0;
			begin
				while Ciclos < TOTALCICLOS loop
					clk_TB <= not clk_TB;
					wait for PERIODO/2;
					Ciclos := Ciclos+1;
				end loop;
				wait;
			end process; -- Fin del generador de pulsos
			
			ESTIMULOS : process --Estimulos a las señales del Testbench
			begin
				
				 J_TB <= '1';  K_TB <= '0'; wait for 15 ns;
				 J_TB <= '0';  K_TB <= '0'; wait for 15 ns;
				 J_TB <= '0';  K_TB <= '1'; wait for 15 ns;
				 J_TB <= '1';  K_TB <= '0'; wait for 15 ns;
				 J_TB <= '1';  K_TB <= '1'; wait for 15 ns;
				 
				 report "Simulacion finalizada.. " severity note; --Texto en consola
				 std.env.stop; -- Paro del Testbench
			end process;-- Fin de estimulos
end Testbench; -- Fin del Testbench