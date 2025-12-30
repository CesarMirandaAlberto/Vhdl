-- ===============================================================================================
-- **** FLIP FLOP REGISTRO EN SERIE SENSIBLE AL FLANCO DE SUBIDA Y RESET ASINCRONO  V2 ****
--
--	El presente código implementa el desarrollo del Testbench del flip flop con registro en serie
--	a que implementa la función shift_left fin de analizar el funcionamiento del mismo.
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
-- ===============================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad del Testbench
entity FF_RSRAV2_TB is
end entity;

-- Lista de puertos
architecture Testbench of FF_RSRAV2_TB is
		
		--Parámetro para generar los pulsos de reloj
		constant PERIODO : time := 20 ns;
		--Señales internas del Testbench
		signal clk_TB :  std_logic := '0';
		signal rst_TB :  std_logic;
		signal D_TB :  std_logic;
		signal Q_TB :  std_logic_vector(3 downto 0);
		
		begin 
			
			--Instanciación 
			DUT : entity work.FF_RSRAV2
				port map( -- Mapeo de señales 
					clk => clk_TB,
					rst => rst_TB,
					D => D_TB,
					Q => Q_TB
				);
			-- Generación de pulsos de reloj	
			GENERAR_ESTIMULOS : process
			begin
				loop
				clk_TB <= not clk_TB;
				wait for PERIODO/2;
				end loop;
			end process;
			
			-- Estimulos de las señales 
			ESTIMULOS : process
			begin
					rst_TB <= '1'; D_TB<= '0'; wait for 12 ns;
					rst_TB <= '0'; wait for 12 ns;
					--Datos 
					D_TB<= '1'; wait for 20 ns;
					D_TB<= '0'; wait for 20 ns;
					D_TB<= '1'; wait for 20 ns;
					D_TB<= '0'; wait for 20 ns;
					rst_TB <= '1'; wait for 20 ns;
					report "Simulacion finalizada ...." severity note; -- Texto en consola
					std.env.stop; -- Paro de Simulacion
			end process; -- Fin de estimulos
			
end Testbench; -- Fin del Testbench