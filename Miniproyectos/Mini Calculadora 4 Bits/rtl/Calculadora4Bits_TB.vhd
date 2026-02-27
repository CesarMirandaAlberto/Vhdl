-- ===============================================================================================
--						**** TESTBENCH CALCULADORA 4 BITS ****
--
--	El presente código implementa el desarrollo del Testbench de la calculadora de 4 bits 
--	a fin de analizar el funcionamiento el mismo.
--	
--	!! ACERCA DEL CÓDIGO !!
--	INYECCIÓN DE ESTIMULOS
--
--	Mediante un ciclo for se generan valores para el selector de operaciones.
--
--	PARA ENTRADAS X E Y
--	Se generan valores de 4 bits para las entradas mediante 2 ciclos for anidados.
--
-- ===============================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad del Testbench
entity Calculadora4Bits_TB is
end entity;

--Arquitectura
architecture Testbench of Calculadora4Bits_TB is
	
		--SEÑALES INTERNAS DEL TESTBENCH 
		signal X_TB : std_logic_vector(3 downto 0);
		signal Y_TB:  std_logic_vector(3 downto 0);
		signal Selector_TB : std_logic_vector(1 downto 0);
		-- SALIDAS
		signal DisplayEntradaX_TB : std_logic_vector(6 downto 0);
		signal DisplayEntradaY_TB :  std_logic_vector(6 downto 0);
		signal DisplayUnidades_TB :  std_logic_vector(6 downto 0);
		signal DisplayDecenas_TB :   std_logic_vector(6 downto 0);
		signal DisplayCentenas_TB :  std_logic_vector(6 downto 0);
		
	begin
		--INSTANCIACIÓN DE LA CALCULADORA
		DUT : entity work.Calculadora4Bits
			port map( -- MAPEO DE SEÑALES
				X_Top => X_TB,
				Y_Top => Y_TB,
				Selector => Selector_TB,
				DisplayEntradax => DisplayEntradaX_TB,
				DisplayEntradaY => DisplayEntradaY_TB,
				DisplayUnidades => DisplayUnidades_TB,
				DisplayDecenas => DisplayDecenas_TB,
				DisplayCentenas => DisplayCentenas_TB
			);
		
		
		ESTIMULOS : process
		begin
				--INYECCIÓN DE VALORES
				for sel in 0 to 2 loop
					Selector_TB <= std_logic_vector(to_unsigned(sel,2)); --PARA EL SELECTOR
				
				 for i in 0 to 15 loop -- PARA LAS ENTRADAS X E Y
						for j in 0 to 15 loop
							X_TB <= std_logic_vector(to_unsigned(i,4));
							Y_TB <= std_logic_vector(to_unsigned(j,4));
							
							wait for 20 ns;
						end loop;
				 end loop;
				end loop;
				
				report "Simulacion finalizada" severity note; --FIN DE LA SIMULACIÓN
				wait;
		end process; -- FIN DE LOS ESTIMULOS
		
		
end Testbench; -- FIN DEL TESTBENCH
