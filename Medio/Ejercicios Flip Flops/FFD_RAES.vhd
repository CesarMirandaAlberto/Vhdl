-- ==============================================================================================
-- **** Flip-flop “D” de flanco ascendente con reinicio asíncrono y habilitación síncrona. ****
--
--	El diseño consta de 4 entradas clk= pulso de reloj, rst = reset, en = enable(habilitar)
-- 	D = Datos y Q salida. La lista sensitiva incluye las señales clk y rst para realizar
--	las asignaciones correspondientes, si en es 1 se asignarán los datos de D a la salida
--	en caso contrario se mantienen los valores (esta habilitada o no la escritura de datos)
--==============================================================================================

-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad y lista de puertos
entity FFD_RAES is
	port(
		clk : in std_logic;
		rst : in std_logic;
		en : in std_logic;
		D : in std_logic;
		Q : out std_logic
	);
end entity;

-- Arquitectura
architecture FFD of FFD_RAES is
	begin
		-- Lista sensitiva
		process(clk, rst) begin
		
			if (rst = '1') then
				Q <= '0';	--reset
			elsif (rising_edge(clk)) then
				if(en = '1') then
					Q <= D; -- Asignación de Datos a la salida
				end if;
			end if;
			
		end process; -- Fin de la lista sensitiva
		
end architecture; -- Fin de la Arquitectura