-- ===========================================================================
--							**** MEDIO SUMADOR ****
-- 
-- El presente código implementa el diseño de un medio sumador a nivel
-- compuertas lógicas. El diseño (entidad) será utilizado para proyectos mas 
-- avanzados como por ejemplo sumador completo o sumador de N bits.
-- Para asignar las operaciones con compuertas lógicas se implementa
-- asignamiento continuo, la entidad consta de 2 entradas y 2 salidas de 1 bit 
-- ===========================================================================

-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad y Lista de puertos
entity Medio_Sumador is
	port(
		X : in std_logic;
		Y : in std_logic;
		Salida : out std_logic;
		CarriSalida : out std_logic
	);
end entity;

--ArquitecturA
architecture MedioSumador of Medio_Sumador is
	begin
	--Asignamiento continuo de operaciones mediante compuertas lógicas 
	 Salida <= X xor Y;
	 CarriSalida <= X and Y;
	 
end MedioSumador; --Fin de la arquitectura