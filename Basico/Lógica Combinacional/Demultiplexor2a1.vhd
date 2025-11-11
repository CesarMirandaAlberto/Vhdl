-- ===========================================================================
--						***** DEMULTIPLEXOR 2 A 1*****
--	Este codigo VHDL implementa un demultiplexor 2 a 1 
--  El codigo consta de dos entradas y una salida de un bit
--  aunque solo se necesita 1 bit para las salidas posibles se implementa un 
--  Selector de 2 bits para comprobar que no hay asignamiento en otros valores
--  del selector.
-- ===========================================================================

--Inclusion de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Declaración de la entidad y la lista de puertos
entity Demultiplexor2a1 is 
	port( 	--Entradas
			X : in std_logic;
			Selector: in std_logic_vector(1 downto 0); 
			--Salidas
			Salida1 : out std_logic;
			Salida2 : out std_logic
	);
end entity;

--Declaración de la arquitectura de la entidad
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