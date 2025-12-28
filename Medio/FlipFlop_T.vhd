-- ===========================================================================
--				**** FLIP FLOP T ****
--
--	El presente código implementa el diseño de un flip flop T con habilitación
--	en el flanco de subida.
--	El diseño consta de 2 entradas clk= pulso de reloj, T y una salida Q, se 
--	implementa QAx como señal auxiliar para realizar los cambios en la salida 
--	y posteriormente esta señal auxiliar mediante asignamiento continuo es 
--	asignado a la salida Q.
-- ===========================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad y lista de puertos
entity FlipFlop_T is
	port(
		clk : in std_logic;
		T : in std_logic;
		Q : out std_logic
	);
end entity;

--Arquitectura del flip flop
architecture FF_T of FlipFlop_T is
		--Señal auxiliar
		signal QAx : std_logic := '0';
		
		begin
			process(clk) begin --lista sensitiva
				if rising_edge(clk) then --Lectura del pulso de reloj 
					if T = '1' then
						QAx <= not QAx; -- Niega Q
					end if;
				end if;
			end process; -- Fin de lista sensitiva
		
	Q <= QAx; --Asignamiento de QAX a Q
	
end FF_T; --Fin de la Arquitectura