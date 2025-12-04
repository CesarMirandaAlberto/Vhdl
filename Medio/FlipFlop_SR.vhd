-- ========================================================================================
--									**** FLIP FLOP SR ****
--
--	El presente código implementa el diseño de un flip flop SR, sensible al flanco de subida
--	del pulso de reloj, el módulo consta de las siguientes señales: clk = reloj, S = set, 
--	R = Reset, Salida = Q negada QN.
--	Se implementa process para generar la lista sensitiva en este caso solo se agrega la señal
--	de reloj y dentro del flanco de subida se ajustan los valores acorde a S y R,
--	se implementa una señal auxiliar QAx para inyectar los valores.
-- ========================================================================================

-- Inclusión de librerias								
library IEEE;
use ieee.std_logic_1164.all;

--Entidad y lista de puertos 
entity FlipFlop_SR is
	port(
		clk : in std_logic;
		S : in std_logic;
		R : in std_logic;
		Q : out std_logic;
		Qn : out std_logic
	);
end entity;

--Arquitectura del flip flop
architecture FlipFlopSR of FlipFlop_SR is
	--Señal interna
	signal QAx : std_logic := '0';
	
	begin
		--Lista sensitiva
		process(clk) begin
			
			if rising_edge(clk) then
				--Solo si hay flanco de subida
				if(S = '1' and R = '0') then
					QAx <= '1'; --Ajusta el valor
				elsif(S = '0' and R = '1') then
					QAx <= '0'; --Reset
				end if;
				--En otro caso se memoriza el valor
			end if;
		end process;
		
	--Asignamiento continuo de señal auxiliar a las salidas
	Q <= QAx;
	Qn <= not QAx;
	
end FlipFlopSR;