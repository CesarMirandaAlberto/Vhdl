-- ===============================================================================================
--								**** PRESIONAR BOTON ****
--
--	El presente código implementa el diseño de un módulo el cual prepara push button para su 
--	correcto uso (evitar rebotes, DetectorFlancos).
--
--	** ACERCA DEL DISEÑO ** 
--
--		generic : 
--		Implementa parámetros básicos para el antirrebote (Frecuencia de reloj, Tiempo de espera 
--		para volver a leer el estado del boton.
--
--		SINCRONIZACIÓN :
--		Se implementan dos señales para sincronizar la señal de entrada del push button con el
--		pulso de reloj.
--
--		ACTUALIZACIÓN :
--		Se realiza la actualización de los estados de las señales con respecto al flanco de subida
--		de reloj.
--
-- ===============================================================================================


--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad y 
entity PresionarBoton is
	generic(
		--FREQUENCIA_CLK : integer := 50_000_000; 
		FREQUENCIA_CLK : integer := 1000; -- PARA SIMULACIÓN
		TIEMPO_ESPERA : integer := 0 --0 para simulación
	);
	port(
		clk : in std_logic;
		rst : in std_logic;
		Boton : in std_logic;
		PulsoEstable : out std_logic
	);
	
end entity;

-- Arquitectura del diseño
architecture rtl of PresionarBoton is
	
	-- CALCULA TIEMPO DE ESPERA PARA REALIZAR LECTURA DEL BOTTON
	constant LIMITE : integer := (FREQUENCIA_CLK / 1000) * TIEMPO_ESPERA;
	
	-- SEÑALES INTERNAS
	
	-- PARA SINCRONIZAR
	signal Sincron1 : std_logic;
	signal Sincron2 : std_logic;
	
	-- PARA ANTIRREBOTE
	signal BotonEstable : std_logic;
	signal Contador : integer range 0 to LIMITE := 0;
	
	-- DETECTOR DE FLANCOS
	signal DetectorFlanco : std_logic;
	
	begin
	
		-- Lista sensitiva
		process(clk) begin
		
			if rising_edge(clk) then
				-- Reseteo de señales
				if rst = '1' then
					Sincron1 <= '0';
					Sincron2 <= '0';
					BotonEstable <= '0';
					Contador <= 0;
					DetectorFlanco <= '0';
					PulsoEstable <= '0';
				else
					-- Sincronización
					Sincron1 <= Boton;
					Sincron2 <= Sincron1;
					
					-- REBOTES
					if Sincron2 = BotonEstable then
						Contador <= 0;
					else
						if Contador < LIMITE then
							Contador <= Contador +1;
						else
							BotonEstable <= Sincron2;
							Contador <= 0;
						end if;
					end if;
					
					-- DETECTOR DE FLANCOS 
					PulsoEstable <=  BotonEstable and (not DetectorFlanco);
					DetectorFlanco <= BotonEstable;
					
				end if;
			end if;
		end process;
		
end rtl; -- Fin del diseño