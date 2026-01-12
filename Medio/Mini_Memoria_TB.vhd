-- ===============================================================================================
--						**** TESTBENCH MINIMEMORIA 16 LOCALIDADES ****
--
--	El presente código implementa el desarrollo del Testbench de la minimemoria a fin de analizar
--	el funcionamiento de la misma.
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
use ieee.numeric_std.all;

-- Entidad del Testbench
entity Mini_Memoria_TB is
end entity;

-- Arquitectura 
architecture Testbench of Mini_Memoria_TB is

		-- Parámetros para generar pulsos de reloj
		constant PERIODO : time := 20 ns;
		constant DIRECCIONES : integer := 16;
		
		--Señales internas del Testbench
		signal clk_TB : std_logic := '0';
		signal rst_TB : std_logic;
		signal wre_TB : std_logic;
		signal DEentrada_TB : std_logic_vector (1 downto 0) := (others => '0');
		signal Direcion_TB :  std_logic_vector(3 downto 0) := (others => '0');
		signal DSalida_TB :  std_logic_vector (1 downto 0) := "00";
		
		begin
			
			-- Instanciación
			DUT : entity work.Mini_Memoria
				port map( -- Mapeo de Señales
					clk => clk_TB,
					rst => rst_TB,
					wre => wre_TB,
					DEentrada => DEentrada_TB,
					Direcion => Direcion_TB,
					DSalida => DSalida_TB
				);
			
			-- Generación de pulsos
			GENERAR_PULSO : process 
			begin
				loop 
					clk_TB <= not clk_TB;
					wait for PERIODO/2;		
				end loop;
			end process;
			
			ESTIMULOS : process
			begin
			
				-- TODO EN CERO
				rst_TB <= '1'; wre_TB <= '0'; wait for 12 ns;
		
				rst_TB <= '0'; wre_TB <= '1'; wait for 12 ns;
				
				--Escritura de datos
				for i in 0 to DIRECCIONES-1 loop
					Direcion_TB <= std_logic_vector(to_unsigned(i, 4));
					DEentrada_TB  <= std_logic_vector(to_unsigned(i mod 4, 2));
					wait for 12 ns;
				end loop;
				
				
				--Lectura de datos
				for i in 0 to DIRECCIONES-1 loop
					Direcion_TB  <= std_logic_vector(to_unsigned(i, 4)); -- Asigna a Direcion_TB el valor de i truncado a 4 bits
					wait for 12 ns;
				end loop;
				
				-- CASO DIRIGIDO COMPROBACIÓN DE RESET
				rst_TB <= '1'; wait for 12 ns;
				
				for i in 0 to DIRECCIONES-1 loop
					Direcion_TB  <= std_logic_vector(to_unsigned(i, 4));
					wait for 12 ns;
				end loop;
				
				report "Simulacion finalizada...." severity note; -- Texto en consola
				std.env.stop; -- Paro de Simulacion
				
			end process; -- Fin de los estimulos
end Testbench;-- Fin del Testbench