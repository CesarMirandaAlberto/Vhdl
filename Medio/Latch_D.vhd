-- ========================================================================================
--									**** LATCH D ****
--
--	El presente código implementa el diseño de un latch D donde se implementan 2 entradas
--	E = Enable, D= Datos, Salida = Q negada QN.
--	Se implementa un process para la lista sensitiva acorde a las señales de entrada que 
--	requiere el latch, ademas que se usa una señal auxiliar QAx, finalmente fuera del process
--	se asignan a las señales el valor de la auxiliar mediante asignamiento continuo.
-- ========================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad y lista de puertos
entity Latch_D is
	port(
		E : in std_logic;
		D : in std_logic;
		Q : out std_logic;
		QN : out std_logic
	);
	
end entity;

--Arquitectura
architecture LatchD of Latch_D is
	--Señal auxiliar
	signal QAx : std_logic := '0'; 
	
	begin
		--Lista sensitiva
		process(E, D) begin
		
			if(E = '1' ) then --Habilita escritura de datos
				QAx <= D;
			end if;
			--Si E ~=1 se mantiene el valor 
		end process;
	
	--Asignamiento continuo
	Q <= QAx; 
	QN <= not QAx;
	
end LatchD; --Fin de la entidad