-- ================================================================================
--							**** SUMADOR COMPLETO 1 BIT ****
--
-- El presente código implementa el diseño de una entidad para un sumador completo
-- de un bit el diseño de la entidad es a nivel estructural ya que se instancea 
-- al medio sumador desarrollado previamente.
-- ESTRUCTURA DEL SUMADOR
--	* Medio_Sumador.vhd
--  * Sumador_Completo.vhd
-- La entidad consta de 2 instanciaciones * MedioSumador 1 y 2* 
-- signals internas para mapear los puertos de los medios sumadores con el sumador 
-- completo.
-- ** NOTA ** INSTANCIAONES SON DIRECTAS
-- ================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad y lista de puertos del sumador completo
entity Sumador_Completo is
	port(
		X : in std_logic;
		Y : in std_logic;
		Carrientrada: in std_logic;
		AcarreoSalida : out std_logic;
		Salida : out std_logic
	);
	
end entity;
-- Arquitectura del sumador completo
architecture Sumador of Sumador_Completo is
	
	--Señales internas del sumador
	signal Suma1 : std_logic;
	signal Carrie1 : std_logic;
	signal Carrie2 : std_logic;
	

	begin
-- Instanciaciones
	MedioSumador1: entity work.Medio_Sumador
		port map( --Mapeo de señales
			x => X,
			Y => Y,
			Salida => Suma1,
			CarriSalida => Carrie1
		);
		
	MedioSumador2: entity work.Medio_Sumador
		port map(
			X => Suma1,
			Y => Carrientrada,
			Salida => Salida,
			CarriSalida => Carrie2
		);
		
	-- OR (suma de los carries)
	AcarreoSalida <= Carrie1 or Carrie2;
	
end Sumador; -- Fin del sumador