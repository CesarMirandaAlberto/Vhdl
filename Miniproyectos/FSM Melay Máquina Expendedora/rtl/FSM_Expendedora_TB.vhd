-- ===========================================================================================================
--						**** TESTBENCH FSM MÁQUINA EXPENDEDORA ****
--
--	El presente código implementa el desarrollo del Testbench de la FSM Expendedora a fin de 
--	analizar el funcionamiento de la misma.
--
--	!! ESTRUCTURA DEL TESTBENCH !!
--		* Divisor_Frecuencia.vhd
--		* PresionarBoton.vhd
--		* DoubleDabble.vhd
--		* DecoderBCD_7Seg.vhd
--		* FSM_Expendedora.vhd
--		* Modulo_Top.vhd
--		* FSM_Expendedora_TB.vhd
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


-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad y lista de puertos
entity FSM_Expendedora_TB is
end entity;

--Arquitectura del Testbench
architecture Testbench of FSM_Expendedora_TB is
	
		--Señales internas del Testbench
		signal clk_TOP_TB : std_logic := '0';
		signal rst_TOP_TB : std_logic := '0';
		signal Moneda_TOP_TB : std_logic_vector(1 downto 0) := "00";
		signal BComprar_TOP_TB : std_logic := '0';
		signal Entrega_TOP_TB :  std_logic := '0';
		signal Cambio_TOP_TB :  std_logic := '0';
		signal Display_Unidades_TB : std_logic_vector(6 downto 0) := "0000000";
		signal Display_Decenas_TB : std_logic_vector(6 downto 0) := "0000000";
		
		constant PERIODO : time := 2 ns;
		
		begin
			
			-- Instanciación
			DUT : entity work.Modulo_Top
				port map( -- Mapeo de Señales
					clk_TOP => clk_TOP_TB,
					rst_TOP => rst_TOP_TB,
					Moneda_TOP => Moneda_TOP_TB,
					BComprar_TOP => BComprar_TOP_TB,
					Entrega_TOP => Entrega_TOP_TB,
					Cambio_TOP => Cambio_TOP_TB,
					Display_Unidades => Display_Unidades_TB,
					Display_Decenas => Display_Decenas_TB
				);
			
			-- Generación de pulsos de reloj
			GENERAR_PULSO:
				process begin
						loop
							clk_TOP_TB <= not clk_TOP_TB;
							wait for PERIODO/2;
						end loop;
				end process;
			
			-- Inyección de valores a las señales internas
			ESTIMULOS : process
				begin
				rst_TOP_TB <= '1';
				wait for 12 ns;
				rst_TOP_TB <= '0';
				wait for 12 ns;
				-- CINCO EN CINCO
				Moneda_TOP_TB <= "01"; wait for 25 ns;
				Moneda_TOP_TB <= "00"; wait for 25 ns;
				Moneda_TOP_TB <= "01"; wait for 25 ns;
				Moneda_TOP_TB <= "00"; wait for 25 ns;
				Moneda_TOP_TB <= "01"; wait for 25 ns; 
				Moneda_TOP_TB <= "00"; wait for 25 ns;
				BComprar_TOP_TB <= '1'; wait for 12 ns; BComprar_TOP_TB <= '0'; wait for 12 ns;
				
				--DIEZ Y CINCO
				Moneda_TOP_TB <= "10"; wait for 25 ns;
				Moneda_TOP_TB <= "00"; wait for 25 ns;
				Moneda_TOP_TB <= "01"; wait for 25 ns;
				Moneda_TOP_TB <= "00"; wait for 25 ns;
				BComprar_TOP_TB <= '1'; wait for 12 ns; BComprar_TOP_TB <= '0'; wait for 12 ns;
				
				--DIEZ Y DIEZ
				Moneda_TOP_TB <= "10"; wait for 25 ns;
				Moneda_TOP_TB <= "00"; wait for 25 ns;
				Moneda_TOP_TB <= "10"; wait for 25 ns;
				Moneda_TOP_TB <= "00"; wait for 25 ns;
				BComprar_TOP_TB <= '1'; wait for 12 ns; BComprar_TOP_TB <= '0'; wait for 12 ns;
				
				
				
				report "Simulacion finalizada....." severity note;
				std.env.stop;
				
			end process; -- Fin de los estimulos
				
				
end Testbench; -- Fin del Testbench
