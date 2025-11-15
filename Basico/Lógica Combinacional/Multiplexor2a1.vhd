-- ===========================================================================
-- 				***** MULTIPLEXOR 2 A 1 *****
-- 	El presente código implementa el desarrollo de un multiplexor 2 a 1
--  2 Entradas 1 Salida con un ancho de 1 bit
--  Selector de tipo vector con ancho de 2 bits
--  apesar que solo se necesita un bit para el selector dado que solo son dos
--  entradas el selector se implementa para 4 combinaciones para analizar mas
--  a detalle e funcionamiento de las asignaciones.
-- ===========================================================================
--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Declaración de entidad y lista de puertos
entity Multiplexor2a1 is 
	port( 
	--Entradas
		X : in std_logic;
		Y : in std_logic;
		--Salidas
		Selector : in std_logic_vector(1 downto 0);
		Salida : out std_logic
	);
end Multiplexor2a1;

--Declaración de la arquitectura
architecture Mux of Multiplexor2a1 is
--Definición de constantes
		constant Entrada1 : std_logic_vector(1 downto 0)  := "01";
		constant Entrada2 : std_logic_vector(1 downto 0)  := "10";
		constant Defecto : std_logic := '0';
begin 
		
		--Asignación condicional de las salidas
		with Selector select 
		
			Salida <= X when Entrada1,
					  Y when Entrada2,
					  Defecto when others;
end Mux;-- Fin de la arquitectura
