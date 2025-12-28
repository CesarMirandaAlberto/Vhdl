-- ===========================================================================
--				**** TESTBENCH FLIP FLOP D ****
--
--	El presente código implementa el desarrollo del Testbench del Flip Flop D
--	a fin de analizar el funcionamiento del mismo.
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

--Inclusion de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad del Testbench
entity FlipFlop_D_TB is
end entity;

--Arquitectura
architecture Testbench of FlipFlop_D_TB is
		--Constantes para controlar la generación del pulso de reloj
		constant PERIODO : time := 10 ns;
		constant TOTALCICLOS : integer := 20;
		
		--Señales internas del Testbench
		signal clk_TB : std_logic := '0';
		signal	D_TB :  std_logic;
		signal	Q_TB :  std_logic;
		
		begin 
			--Instanciación 
			DUT : entity work.FlipFlop_D
					port map( --Mapeo de Señales
						clk => clk_TB,
						D => D_TB,
						Q => Q_TB
					);
					
			GENERAR_PULSO : process --Generador de pulsos
			variable Ciclos : integer := 0;
			
				begin
						while Ciclos < TOTALCICLOS loop
							clk_TB <= not clk_TB;
							wait for PERIODO/2;
							Ciclos := Ciclos+1;
						end loop;
						wait;
					
			end process; --Fin generador de pulsos
			
			--Estimulos a las señales del testbench 
			Estimulos: process
			begin
				D_TB <= '1'; wait for 10 ns;
				D_TB <= '0'; wait for 10 ns;
				D_TB <= '1'; wait for 10 ns;
				D_TB <= '0'; wait for 10 ns;
				
				report "Simulacion finalizada." severity note; --Texto en consola
				std.env.stop; -- Paro de Simulacion
			end process; --Fin de los Estimulos
end Testbench; -- Fin del Testbench