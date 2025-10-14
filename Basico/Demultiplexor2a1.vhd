-- ===========================================================================
--						***** DEMULTIPLEXOR 2 A 1*****
--	Este codigo VHDL implementa un demultiplexor 2 a 1 
--  El codigo consta de dos entradas y una salida de un bit
-- ===========================================================================

--Inclusion de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Declaración de la entidad y la lista de puertos
entity Demultiplexor2a1 is 
	port( 	--Entradas
			X : in std_logic;
			Selector: in std_logic_vector(1 downto 0); --Entrada con acho de dos bits de tipo vector
			--Salidas
			Salida1 : out std_logic;
			Salida2 : out std_logic
	);
end entity;

--Declaración de arquitectura de la entidad
architecture Demultiplexor of Demultiplexor2a1 is
	--Declaracion de constantes 
	constant SALIDAUNO : std_logic_vector := "01";
	constant SALIDADOS : std_logic_vector := "10";
	constant DEFECTO : std_logic := '0';
	
	begin 
		--logica Combinacional: Asignacion condicional de salidas
		Salida1 <= X when Selector = SALIDAUNO else DEFECTO;
		Salida2 <= X when Selector = SALIDADOS else DEFECTO;
		
end Demultiplexor;