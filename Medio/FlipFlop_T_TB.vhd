-- ===========================================================================
--				**** TESTBENCH FLIP FLOP T ****
--
--	El presente código implementa el desarroolo del Testbench del flip flop T,
--	a fin de analizar el funcionamiento del mismo.
-- * ACERCA DEL CÓDIGO *
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

--	Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad
entity FlipFlop_T_TB is
end entity;

--Arquitectura del flip flop T
architecture Testbench of FlipFlop_T_TB is
		
		--parámetros para generar pulsos de reloj
		constant PERIODO : time := 10 ns;
		constant TOTALCICLOS : integer := 20;
		
		--Señales internas del Testbench
		signal clk_TB : std_logic := '0';
		signal T_TB :  std_logic;
		signal Q_TB :  std_logic;
		
		begin
			-- instanciación
			DUT : entity work.FlipFlop_T
				port map( --Mapeo de señales
					clk => clk_TB,
					T => T_TB,
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
			end process; --Fin del generador
			
			--Estimulos a las Señales
			ESTIMULOS : process
			begin
					T_TB <= '1'; wait for 10 ns;
					T_TB <= '0'; wait for 10 ns;
					T_TB <= '1'; wait for 10 ns;
					T_TB <= '0'; wait for 10 ns;
					
					report "Simulacion finalizada...." severity note; --Texto en consola
					std.env.stop; --Paro de Simulacion
			end process; --Fin de estimulos
end Testbench; -- Fin del Testbench