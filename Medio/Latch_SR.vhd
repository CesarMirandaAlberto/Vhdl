-- ========================================================================================
--							**** LATCH SR ****
--
--	El presente código implementa el diseño de un latch SR, se implementan 2 entradas S=Set
--	R= Reset Salida= Q negada QN.
--	Se implementa QAX como señal auxiliar de la señal de salida salida, se implementa un 
--	process para la lista sensitiva con las señales que se requiere operar el latch.
-- ========================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad y lista de puertos
entity Latch_SR is
	port(
		S : in std_logic;
		R : in std_logic;
		Q : out std_logic;
		QN : out std_logic
	);
end entity;

--Arquitectura del latch
architecture LatchSR of Latch_SR is
	--Señal auxiliar
	signal QAx: std_logic;
	
	begin
		--Lista sensitiva
		process(S, R) begin
			--Condiciones
			if(S = '1' and R ='0') then
				QAx <= '1'; --Establece
			elsif(S = '0' and R='1') then
				QAx <= '0'; --Resetea
			else
				QAx <= QAx; --Mantiene valor
			end if;
		end process;
	
	--Asignamiento continuo de las salidas Q y QN 
	Q <= QAx;
	QN <= not QAx;
	
end architecture; --Fin del latch
