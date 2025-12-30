-- ===============================================================================================
--						**** TESTBENCH FLIP FLOP CON REGISTRO PARALELO	****
--
--	El presente código implementa el desarrollo del Testbench del flip flop con registro de 
--	datos en paralelo, a fin de analizar el funcionamiento del mismo.
--	-- * ACERCA DEL CÓDIGO *
--
--		** GENERAR PULSO **
--			Dado que el flip flop requiere el pulso de reloj el bloque Generar_CLK se encarga de
--			generar este pulso, Datos:
--			PERIODO = 10 ns
--			20 ciclos 
--			Pulso completo se genera en 10 ns pero el flanco de subida y bajada tienen una duración
--			de 5 ns "wait for PERIODO/2", el pulso se genera al hacer aplicar una compuerta not a la
--			señal clk.
--		** GENERAR VALORES ALEATORIOS **
--			Para inyectar valores en el Testbench, se generan valores aleatorios mediante la función 
--			uniform, estos valores son de un ancho de 8 bits y utilizan mod 256, posteriormente los
--			valores son truncados a un ancho de 4 bits para ser inyectados a la señal interna del
--			Testbench, los valores son generados un total de 255 veces mediante un bucle.
--
--		** NOTAS ** 
-- 	  		* DUT => Nombre de la instanciación
--    		* Instanciación directa
-- ===============================================================================================

-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

--Entidad del Testbench
entity FF_RegistroParalelo_TB is
end entity;

--Arquitectura
architecture Testbench of FF_RegistroParalelo_TB is
		
		-- Parámetros para generar los pulsos de reloj
		constant PERIODO : time := 10 ns;
		constant TOTALCICLOS : integer := 20;
		
		-- Señales internas del Testbench
		signal clk_TB : std_logic := '0';
		signal rst_TB : std_logic;
		signal D_TB : std_logic_vector(7 downto 0);
		signal Q_TB : std_logic_vector(7 downto 0);
		
		
		begin
			-- Instanciaciones
			DUT : entity work.FF_RegistroParalelo
				port map( -- Mapeo de Señales
					clk => clk_TB,
					rst => rst_TB,
					D => D_TB,
					Q => Q_TB
				);
			-- Generación de pulsos
			GENERAR_PULSO: process
			begin
				loop
					clk_TB <= not clk_TB;
					wait for PERIODO/2;
				end loop;
			end process; -- Fin del generador de pulsos
			
			--Estimulos de señales
			ESTIMULOS: process
						-- Parámetros para función uniform
						variable semilla1 : positive;
						variable semilla2 : positive;
						
						variable VReal : real;
						variable VEntero : integer;
			
			begin
			
				semilla1 := 01234;
				semilla2 := 56789;
				-- Inicialización de Señales
				rst_TB <= '1'; D_TB <="00000000"; wait for 12 ns;
				rst_TB <= '0'; wait for 12 ns;
				
				-- CASOS DIRIGIDOS
				D_TB <= "01010101"; wait for 12 ns;
				D_TB <= "10001010"; wait for 12 ns;
				
				rst_TB <= '1'; wait for 12 ns;
				rst_TB <= '0'; wait for 12 ns;
				
				-- VALORES ALEATORIOS
				for i in 0 to TOTALCICLOS loop
					uniform(semilla1, semilla2, VReal); -- Generación de valor
					
					VEntero := integer(VReal * 256.0) mod 256;	-- Generación de valor entero
					D_TB <= std_logic_vector(to_unsigned(VEntero, 8)); -- Truncamiento de bits
					wait for 12 ns; -- Retraso
				end loop;
				report "Fin de la simulacion.." severity note; -- Texto en consola
				std.env.stop; -- Paro de simulacion
			
			end process; -- Fin de los Estimulos
end Testbench; -- Fin del Testbench