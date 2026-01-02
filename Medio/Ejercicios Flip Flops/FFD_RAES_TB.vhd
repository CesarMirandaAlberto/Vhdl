-- ==============================================================================================
-- **** Flip-flop “D” de flanco ascendente con reinicio asíncrono y habilitación síncrona. ****
--
--	El presente código implementa el desarrollo del Testbench de Flip Flop D con reinicio asincrono
--	e habilitación sincrona.
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
-- ==============================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad del Testbench
entity FFD_RAES_TB is
end entity;

-- Arquitectura
architecture Testbench of FFD_RAES_TB is
		-- Parámetros para generar pulsos de reloj
		constant PERIODO : time := 10 ns;
		constant TOTALCICLOS : integer := 20;
	
		--Señales internas del Testbench
		signal clk_TB : std_logic := '0';
		signal rst_TB : std_logic := '0';
		signal en_TB : std_logic := '0';
		signal D_TB :  std_logic;
		signal Q_TB :  std_logic;
		
		begin
		
		-- instanciación
		DUT : entity work.FFD_RAES
			port map( --Mapeo de señales
				clk => clk_TB,
				rst => rst_TB,
				en => en_TB,
				D => D_TB,
				Q => Q_TB
			);
			-- Generación de pulsos de relog
		GENERAR_PULSO : process
			variable Ciclos : integer := 0;
		begin
			while Ciclos < TOTALCICLOS loop
				clk_TB <= not clk_TB;
				wait for PERIODO/2;
				Ciclos := Ciclos+1;
			end loop;
			wait;
		end process; -- Fin del generador de pulsos
		
		--Estimulos de señales
		ESTIMULOS : process
		begin
			rst_TB <= '1'; D_TB <= '1'; wait for 10 ns;
			rst_TB <= '0'; en_TB <= '1'; wait for 10 ns;
			rst_TB <= '0'; en_TB <= '0'; D_TB <= '0'; wait for 10 ns;
			
			rst_TB <= '0'; en_TB <= '1'; wait for 10 ns;
			rst_TB <= '0'; en_TB <= '1'; D_TB <= '1'; wait for 10 ns;
			rst_TB <= '1'; wait for 10 ns;
			
			report "Simulacion finalizada..." severity note; -- Texto en consola
			std.env.stop; -- Paro de Simulacion
		end process; -- Fin de los Estimulos
end Testbench; -- Fin del Testbench
