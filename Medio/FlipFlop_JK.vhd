-- ===========================================================================
--				**** FLIP FLOP JK ****
--
--	El presente código implementa el desarrollo del flip flop JK, que actua en 
--	respuesta al flanco de subida de reloj.
--	El flip flop consta de 3 entradas clk= reloj, J, K, Salida = Q negada QN
--  para la asignación de valores a Q se implementa una señal auxiliar para 
-- 	realizar asignaciones, posteriormente mediante asignamiento continuo esta
-- 	es asignada a la Salida Q y Qn.
-- ===========================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad y lista de puertos
entity FlipFlop_JK is
	port(
		clk : in std_logic;
		J : in std_logic;
		K : in std_logic;
		Q : out std_logic;
		QN : out std_logic
	);
end entity;

--Arquitectura
architecture FF_JK of FlipFlop_JK is
		--Señal auxiliar
		signal QAx : std_logic := '0';
		
		begin 
			--Lista sensitiva 
			process(clk) begin
				if rising_edge(clk) then --Lectura de flanco de reloj
					if(J = '0' and K = '0') then
						QAx <= QAx; --Mantiene valor
					elsif(J = '0' and K = '1') then
						QAx <= '0';	-- Resetea
					elsif(J = '1' and K = '0') then
						QAx <= '1'; --Ajusta a 0
					else
						QAx <= not QAx; -- Niega el valor de Q
					end if;
				end if;
			end process; -- Fin de lista sensitiva
			
	Q <= QAx; --Asignación de Q
	QN <= not QAx; --Asignación de QN
	
end FF_JK; --Fin de Arquitectura