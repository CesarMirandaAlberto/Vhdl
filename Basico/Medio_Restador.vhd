-- ================================================================================
-- 							**** MEDIO RESTADOR ****
--
--	El presente código implementa el diseño de un medio restador a nivel compuertas
--	lógicas.
--	Este diseño será parte de proyectos mas complejos como el restador completo de 
--	1 bit o restador completo de N bits. El código consta de de 2 entradas y 2 
--  salidas de un bit X, Y R= Resultado, AN = Acarreo Negativo, el asignamiento de
--	las operaciones es por asignamiento continuo.
-- ================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad y Lista de puertos
entity Medio_Restador is
		port(
			X : in std_logic;
			Y : in std_logic;
			R : out std_logic;
			AN : out std_logic
		);
end entity;

--Arquitectura de la entidad
architecture MedioRestador of Medio_Restador is 
	begin
		--Asignamiento de operaciones con compuertas lógicas
		R <= X xor Y;
		AN <= (not X) and Y;
	
end MedioRestador; --Fin de la Arquitectura