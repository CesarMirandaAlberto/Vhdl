-- ===========================================================================
--				**** FLIP FLOP D ****
--
--	El presente código implementa el desarrollo de un flip flop D, se implementa
--  la lista sensitiva unicamente con la señal de reloj, el flip flop actua con 
--	respecto al flanco de subida de reloj.
-- ===========================================================================

-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad y lista de puertos
entity FlipFlop_D is
	port(
		clk : in std_logic;
		D : in std_logic;
		Q : out std_logic
	);
end entity;

--Arquitectura del flip flop 
architecture FLipFlopD of FlipFlop_D is
	
	begin
		--Lista sensitiva
		process(clk) begin
			if(rising_edge(clk)) then --Flanco de subida
				Q <= D; --Asignación de valor de D
			end if;
		end process;-- Fin de la lista sensitiva
		
end FLipFlopD; -- Fin de la arquitectura