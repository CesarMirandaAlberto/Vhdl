-- ===========================================================================
-- 				***** MULTIPLEXOR 4 A 1 *****
-- 	El presente código implementa el desarrollo de un multiplexor 4 a 1 
--  4 Entradas y 1 salida de tipo vector con un ancho de 3 bits al igual
--  que el selector.
-- ===========================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Declaración de la entidad
entity Multiplexor4a1 is
-- Declaración de lista de puertos
	port(
	--Entradas 
		A : in std_logic_vector(2 downto 0);
		B : in std_logic_vector(2 downto 0);
		C : in std_logic_vector(2 downto 0);
		D : in std_logic_vector(2 downto 0);
		Selector: in std_logic_vector(2 downto 0);
		--Salida
		Salida : out std_logic_vector(2 downto 0)
	);
end entity;

--Definición de la arquitectura
architecture Multiplexor of Multiplexor4a1 is
--Definición de constantes
constant Entrada1: std_logic_vector (2 downto 0):= "001";
constant Entrada2: std_logic_vector (2 downto 0):= "010";
constant Entrada3: std_logic_vector (2 downto 0):= "011";
constant Entrada4: std_logic_vector (2 downto 0):= "100";
constant Defecto: std_logic_vector  (2 downto 0):=  "000";


begin
--Asignación condicional de las salidas
		with Selector select
		
			Salida <= A when Entrada1,
					  B when Entrada2,
					  C when Entrada3,
					  D when Entrada4,
					  Defecto when others;
					  
end Multiplexor; --fin de la arquitectura