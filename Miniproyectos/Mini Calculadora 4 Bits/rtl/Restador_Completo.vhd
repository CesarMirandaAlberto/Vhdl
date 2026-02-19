-- ================================================================================
--						**** RESTADOR COMPLETO 1 BIT ****
--
--	El presente código implementa el diseño de un restador completo de 1 bit a 
--	nivel estructural, se instancia al Medio Restador en dos ocaciones para 
--	formar el restador completo.
--  ESTRUCTURA DEL DISEÑO:
--		* Medio_Restador
--		* Restador_Completo
--  NOTA : Se deben compilar las entidades acorde a la estructura del diseño. 
--	La entidad consta de 3 entradas y 2 salidas de un bit.
--	se implementan signal para conectar los medios restadores
--  MR1 : Medio Restador 1 etc.
--	Las instanciaciones de los medios restadores son directas.
-- ================================================================================

-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad y Lista de puertos
entity Restador_Completo is
	port(
		X : in std_logic;
		Y : in std_logic;
		CarrieNEntrada: in std_logic;
		R : out std_logic;
		CarrieNSalida : out std_logic
	);
end entity;

--Arquitectua del restador completo
architecture Restador of Restador_Completo is
	--Señales internas
	signal Resta1: std_logic;
	signal CarrieN1 : std_logic;
	signal CarrieN2 : std_logic;
	
	begin
		--Instanciacion de medios restadores y Mapeo de señales
		MR1: entity work.Medio_Restador
			port map(
				X => X,
				Y => Y,
				R => Resta1,
				AN => CarrieN1
			);
		
		MR2: entity work.Medio_Restador
			port map(
				X => Resta1,
				Y => CarrieNEntrada,
				R => R,
				AN => CarrieN2
			);
		
		CarrieNSalida <=  CarrieN1 OR CarrieN2; --Sumar los acarreos negativos
		
end Restador; --Fin de la Arquitectua