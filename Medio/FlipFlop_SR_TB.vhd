-- ========================================================================================
--									**** Testbench FLIP FLOP SR ****
--
--	El presente código implementa el desarrollo del Testbench para el Flip Flop SR a fin de
--	analizar el funcionamiento del mismo.
--	** GENERAR PULSO **
--		Dado que el flip flop requiere el pulso de reloj el bloque Generar_CLK se encarga de
--		generar este pulso, Datos:
--		PERIODO = 10 ns
--		20 ciclos 
--		Pulso completo se genera en 10 ns pero el flanco de subida y bajada tienen una duración
--		de 5 ns "wait for PERIODO/2", el pulso se genera al hacer aplicar una compuerta not a la
--		señal clk.
--	** NOTAS ** 
-- 	  * DUT => Nombre de la instanciación
--    * Instanciación directa
-- ========================================================================================
								
--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad del Testbench
entity FlipFlop_SR_TB is
end entity;

--Arquitectura
architecture Testbench of FlipFlop_SR_TB is
		
		--Constantes para la cantidad de ciclos y periodo del pulso
		constant PERIODO : time := 10 ns;
		constant TOTALCICLOS : integer := 20;
		
		--Señales internas de reloj
		signal clk_TB : std_logic := '0';
		signal S_TB :  std_logic;
		signal R_TB : std_logic;
		signal Q_TB : std_logic;
		signal Qn_TB : std_logic;
		
		begin
			--instanciación
			DUT: entity work.FlipFlop_SR
				port map( --Mapeo de señales
					clk => clk_TB,
					S => S_TB,
					R => R_TB,
					Q => Q_TB,
					Qn => Qn_TB
				);
			
			--Generación del pulso de reloj
			Generar_CLK : process
				variable Ciclos : integer := 0; --Controlar el ciclo
			begin
				while Ciclos < TOTALCICLOS loop
				
					clk_TB <= not clk_TB;
					wait for PERIODO/2;
					Ciclos := Ciclos+1; --Aumenta el iterador
				end loop;
			 wait; --fin del ciclo
			end process;
			
			--Aplicación de estimulos a las señales internas S y R del Testbench
			Estimulos : process
			begin
				S_TB <= '1'; R_TB <= '0'; wait for 15 ns;
				S_TB <= '0'; R_TB <= '1'; wait for 15 ns;
				S_TB <= '1'; R_TB <= '0'; wait for 15 ns;
				S_TB <= '0'; R_TB <= '0'; wait for 15 ns;
				S_TB <= '0'; R_TB <= '1'; wait for 15 ns;
				S_TB <= '1'; R_TB <= '1'; wait for 15 ns;
				
				report "Simulacion finalizada correctamente." severity note; --Mensaje en consola
				std.env.stop;--Detiene la Simulacion
			end process; --Fin de los estimulos
end Testbench; --Fin del Testbench
