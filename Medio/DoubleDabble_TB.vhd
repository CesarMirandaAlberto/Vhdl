-- ===============================================================================================
--						**** ALGORITMO DOUBBLE DABBLE ****
--
--	El presente código implementa el Testbench del Algoritmo doubble dabble a fin de analizar el 
--	funcionamiento del mismo.
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

-- Entidad del Testbench
entity DoubleDabble_TB is
end entity;

-- Arquitectura
architecture Testbench of DoubleDabble_TB is
	
		-- Señales internas del Testbench
		signal X_TB : std_logic_vector(7 downto 0)  := (others => '0');
		signal Centenas_TB : std_logic_vector(3 downto 0);
		signal Decenas_TB :  std_logic_vector(3 downto 0);
		signal Unidades_TB : std_logic_vector(3 downto 0);
		
		-- Numero de pruebas 
		constant PRUEBAS : integer := 87;
		
	begin
		
		-- instanciación
		DUT : entity work.DoubleDabble
			port map( -- Mapeo de señales
				X => X_TB,
				Centenas => Centenas_TB,
				Decenas => Decenas_TB,
				Unidades => Unidades_TB
			);
		-- Estimulos de las señales internas del Testbench
		ESTIMULOS : process
						
						-- Parámetros para función uniform
						variable semilla1 : positive;
						variable semilla2 : positive;
						
						variable VReal : real;
						variable VAleatorio : integer;
			
			begin
					-- Inicialización de parámetros
					semilla1 := 21;
					semilla2 := 23;
					-- Bucle para generar valores aleatorios
					for i in 0 to PRUEBAS loop
						uniform(semilla1, semilla2, VReal);
						VAleatorio := integer(VReal * 256.0) mod 256; -- Generación de valor aleatorio
						X_TB <= std_logic_vector(to_unsigned(VAleatorio, 8)); -- Asingación de valor truncado a 8 bits
						
						wait for 10 ns; --Retardos
					end loop;
					report "Simulacion finalizada..." severity note; -- Texto en consola
					wait;-- Fin de Simulacion
		end process; -- Fin de Estimulos
		
end Testbench; -- Fin del Testbench