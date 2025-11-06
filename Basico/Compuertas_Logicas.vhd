-- ===========================================================================
--						***** COMPUERTAS LOGICAS *****
		
--	Este codigo VHDL implementa las compuertas logicas como una introducción 
--  a los fundamentos de VHDL.
--  El codigo consta de dos entradas y seis salidas una para cada compuerta
--  se implementa asignamiento continuo para la asignacion de las compuertas
--  lógicas.
-- ===========================================================================

-- Inclusion de librerias
library IEEE;
use IEEE.std_logic_1164.all;

entity Compuertas_Logicas is --Declaración de la entidad
port( --lista de puertos
	--Entradas
	X : in std_logic; 
	Y : in std_logic;
	--Salidas
	Sand : out std_logic; 
	Sor : out std_logic;
	Snot: out std_logic;
	Snor: out std_logic;
	Snand: out std_logic;
	Sxor: out std_logic 
);
end Compuertas_Logicas;

architecture Compuertas of Compuertas_Logicas is -- Declaración de la arquitectura de la entidad

begin -- Comienzo de funcionamiento de la entidad

-- Asignacion de operaciones con compuertas logicas
	Sand <= X and Y;
	Sor <= X or Y;
	Snot <= not X;
	Snor <=  X nor Y;
	Snand <= X nand Y;
	Sxor <= X xor Y;
	
end Compuertas; -- fin de la arquitectura


