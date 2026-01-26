-- ===============================================================================================
--								**** FSM SEMAFORO 2 VIAS TESTBENCH ****
--
--	El presente código vhdl implementa el diseño del Testbench para la FSM del semaforo de 2 vias 
--	a fin de analizar el funcionamiento del mismo.

--	ESTRUCTURA DEL TESTBENCH:
--		* Divisor_Frecuencia.vhd
--		* Contador.vhd 
--		* FSM_Semaforo2V.vhd
--		* Modulo_Top.vhd
--		* FSM_Semaforo2V_TB.vhd
--	
--	Para que el Testbench compile es necesario compilar todos los módulos de la estructura del 
--	testbench.
--
--	** NOTAS **
--		Instanciación : directa.
--		DUT : Nombre de la instanciación.
--
--	Se generan pulsos de reloj con una duración total de 10 ns los cuales cada 5 ns se aplica una
--	compuerta not para invertir el estado de la salida.
--
-- ===============================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad del Testbench
entity FSM_Semaforo2V_TB is 
end entity;

--Arquitectura del Testbench
architecture Testbench of FSM_Semaforo2V_TB is
		
		--Parámetros para generar pulso de reloj
		constant PERIODO : time := 10 ns;
		
		--Señales internas del Testbench
		signal clk_TB : std_logic := '0';
		signal rst_TB : std_logic := '0';
		signal SEMAFORO1_TB : std_logic_vector(2 downto 0);
		signal SEMAFORO2_TB : std_logic_vector(2 downto 0);

	begin
	
		-- Instanciación
		DUT : entity work.Modulo_Top
			port map(
				clk => clk_TB,
				rst => rst_TB,
				SEMAFORO1 => SEMAFORO1_TB,
				SEMAFORO2 => SEMAFORO2_TB
			);
		
		-- Generación de pulsos de reloj
		GENERAR_PULSO : process
		begin
				loop
					clk_TB <= not clk_TB;
					wait for PERIODO/2;
				end loop;
		end process;
		
		-- Estimulos
		GENERAR_ESTIMULOS : process
		begin
				rst_TB <= '1';
				wait for 2 ns;
				
				rst_TB <= '0';
				wait for 500 us;
				
				std.env.stop;
		end process;
		
end Testbench; -- Fin de los estimulos
