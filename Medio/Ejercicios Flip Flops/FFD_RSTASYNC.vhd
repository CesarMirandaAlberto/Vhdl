-- ===============================================================================================
--						**** FLIP FLOP D CON RESET ASINCRONO ****
--
--	El presente código implementa el desarrollo de un flip flop D con reset asincrono, el diseño 
--	consta de 3 entradas clk= reloj, rst= reset, D = Dato y 1 salida Q.
--	El flip flop se activa en el flanco negativo de reloj mientras que el reset es activado cuando
--	se encuentra en estado bajo "0".
-- ===============================================================================================

-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad y lista de puertos
entity FFD_RSTASYNC is
	port(
		clk : in std_logic;
		rst : in std_logic;
		D : in std_logic;
		Q : out std_logic
	);
end entity;

-- Arquitectura
architecture FFDR of FFD_RSTASYNC is
	
	begin
		-- Lista sensitiva
		process(clk, rst) begin
		
			if(rst = '0') then
				Q <= '0'; -- Reset de señal
			elsif falling_edge(clk) then
					Q <= D; -- Asignación de datos
			end if;
		end process; -- Fin de la lista sensitiva
end FFDR; -- Fin de la Arquitectura
