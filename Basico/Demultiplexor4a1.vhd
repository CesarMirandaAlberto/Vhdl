-- ===========================================================================
-- 				***** DEMULTIPLEXOR 1 A 4 *****
-- 	Este código implementa el desarrollo de un demultiplexor 1 a 4 con 
--  1 Entrada y 4 Salidas (vectores) con un ancho de 4 bits.
--  ademas se implementa el uso de constantes para evitar números mágicos
-- ===========================================================================

--Inclusion de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Declaración de la entidad y lista de puertos
entity Demultiplexor4a1 is
	port(
		--Entradas
		X : in std_logic_vector(3 downto 0);
		Selector : in std_logic_vector(3 downto 0);
		--Salidas
		Salida1 : out std_logic_vector(3 downto 0);
		Salida2 : out std_logic_vector(3 downto 0);
		Salida3 : out std_logic_vector(3 downto 0);
		Salida4 : out std_logic_vector(3 downto 0)
	);
end entity;

--Declaración de la arquitectura
architecture Demultiplexor of Demultiplexor4a1 is 
--Declaración de constantes
	constant SALIDAUNO : std_logic_vector := "0001";
	constant SALIDADOS : std_logic_vector := "0010";
	constant SALIDATRES : std_logic_vector := "0011";
	constant SALIDACUATRO: std_logic_vector := "0100";
	constant DEFECTO: std_logic_vector := "0000";
	
	begin
-- Asignación condicional de las salidas	
		Salida1 <= X when Selector = SALIDAUNO else DEFECTO;
		Salida2 <= X when Selector = SALIDADOS else DEFECTO;
		Salida3 <= X when Selector = SALIDATRES else DEFECTO;
		Salida4 <= X when selector = SALIDACUATRO else DEFECTO;
		
end Demultiplexor; --Fin de la arquitectura