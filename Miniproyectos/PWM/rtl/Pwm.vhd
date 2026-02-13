-- ===============================================================================================
--								**** MODULO PRINCIPAL PWM ****
--
--	El presente código implementa el desarrollo del módulo pwm el cual se encarga de generar la 
--	señal acorde a la resolución, y valores del duty.
--	El módulo consta de 4 entradas (clk, rst, duty cycle, y la salida generada por los valores
--	del duty. Si el reset esta en estado alto se establece la señal PWM en estado bajo y el ContadorPWM
--	se reinicia a 0, en caso contrario mediante el flanco de subida de reloj se incrementa el 
--	ContadorPWM y actualiza la señal de salida del pwm.
--
-- ===============================================================================================

-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad y lista de puertos
entity Pwm is
	generic (
		RESOLUCION : integer := 100 -- RESOLUCIÓN DE LA SEÑAL PWM 
	);
	port(
		clk : in std_logic;
		rst : in std_logic;
		dutyCy : in integer range 0 to RESOLUCION;-- Boton de entrada
		SalidaPwm : out std_logic
	);
end entity;

--Arquitectura del PWM
architecture simple of Pwm is

	--Contador auxiliar
	signal ContadorPWM : integer range 0 to RESOLUCION := 0;
	
	begin
		process(clk) begin --Lista sensitiva unicamente con el pulso de reloj
			if rst = '1' then --reseteo
				ContadorPWM <= 0;
				SalidaPwm <= '0';
			elsif rising_edge(clk) then -- Incremento en la señal PWM
				-- PWM clásico
				if ContadorPWM = RESOLUCION then
					ContadorPWM <= 0;
				else
					ContadorPWM <= ContadorPWM + 1;
				end if;

				if ContadorPWM < dutyCy then
					SalidaPwm <= '1';
				else
					SalidaPwm <= '0';
				end if;
			end if;
		end process;
	
end simple; -- Fin del módulo
