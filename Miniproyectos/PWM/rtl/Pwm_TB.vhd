-- ===============================================================================================
--								**** TESTBENCH PWM ****
--
--	El presente código implementa el desarrollo del Testbench del PWM a fin de analizar el
--	funcionamiento del mismo.
--	!! ACERCA DEL TESTBENCH !!
--	Para evitar grandes tiempos de simulación se omite los módulos Divisor de frecuencia, y presionar
--	boton, por lo que estos no son necesarios en el módulo Top (rtl) únicamente para Simulacion.
--
--	* Instanciación directa
--		* DUT : Nombre de la Instanciación.
--
--	GENERACIÓN DE PULSO DE RELOJ:
--			* Mediante un bucle y un periodo de N tiempo se genera el pulso de reloj para Simulacion
--
--	PRESIONAR BOTON DISMINUIR / AUMENTAR DUTY
--			* A traves de un bucle while se aplica compuerta not a la señal de los botones 
--				con un retardo para simular que se presiona y sueltan los botones 
--				primero se aplica para aumentar duty y posteriormente para disminuir.
-- ===============================================================================================

--Inclusión de libreria
library IEEE;
use ieee.std_logic_1164.all;


--Entidad del Testbench
entity Pwm_TB is 
end entity;

--Arquitectura del Testbench
architecture Testbench of Pwm_TB is

		-- Señales internas del Testbench
		signal clk_tb : std_logic := '0';
		signal rst_tb : std_logic := '0';
		signal Aumentar_tb : std_logic := '0';
		signal Disminuir_tb : std_logic := '0';
		signal Salida_tb : std_logic;
		signal CentenasPwm_tb : std_logic_vector (6 downto 0);
		signal DecenasPwm_tb : std_logic_vector (6 downto 0);
		signal UnidadesPwm_tb : std_logic_vector (6 downto 0);
		
		-- DURACION DEL PERIODO
		constant PERIODO : time := 1 ns;
		
	begin
		
		-- Instanciaciones
		DUT : entity work.Modulo_Top
			port map(
				clk_top => clk_tb,
				rst_top => rst_tb,
				Aumentar_top => Aumentar_tb,
				Disminuir_top => Disminuir_tb,
				CentenasPwm => CentenasPwm_tb,
				DecenasPwm => DecenasPwm_tb,
				UnidadesPwm => UnidadesPwm_tb,
				Salida_PWMTop => Salida_tb
			);
		
		-- GENERACIÓN DE PULSO DE RELOJ
		GENERAR_PULSOS : process
		begin
			loop
				clk_tb <= not clk_tb;
				wait for PERIODO/2;
			end loop;
			
		end process;
		
		--GENERACIÓN DE ESTIMULOS
		GENERAR_ESTIMULOS : process
		
			--VARIABLE PARA LOS BUCLES
			variable i : integer := 0;
			variable j : integer := 0;
		begin
			  -- MANEJO DE RESET
				rst_tb <= '1'; wait for 2 ns;
				rst_tb <= '0'; wait for 2 ns;
				
				-- PRESIONAR BOTON AUMENTAR DUTY
				while i < 20 loop
						Aumentar_tb <= not Aumentar_tb; wait for 2 ns;
						i := i + 1;
				end loop;
				
				-- PRESIONAR BOTON DISMINUIR DUTY
				while j < 20 loop
						Disminuir_tb <=  not Disminuir_tb; wait for 2 ns;
						j := j + 1;
				end loop;
				
				-- TEXTO EN CONSOLA
				report "Simulacion finalizada" severity note;
				std.env.stop; -- PARO DE SIMULACIÓN
		end process; -- FIN DE LOS ESTIMULOS
		
end Testbench; -- FIN DEL TESTBENCH
