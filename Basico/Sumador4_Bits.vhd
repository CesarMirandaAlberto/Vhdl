-- ========================================================================================
-- 						**** SUMADOR DE 4 BITS	****
--
-- El presente código implementa el diseño de un sumador de 4 bits a nivel estructural
-- la entidad consta de 2 entradas de 4 bits, una CarriSalida de 1 bit y su Salida
-- (resultado) de 4 bits.
-- 	ESTRUTURA DEL DISEÑO DE LA ENTIDAD:
--		* Medio_Sumador.vhd
--		* Sumador_Completo.vhd
--		* Sumador4_Bits.vhd
-- Para el funcionamiento de la entidad se realiza la instanciación del sumador completo
-- en cuatro ocaciones 1 por cada bit.
-- ** NOTA **
-- SC1..2..3 = SUMADORCOMPLETO1
-- DADO QUE ES DISEÑO A NIVEL ESTRUCTURAL ES NECESARIO COMPILAR LAS ENTIDADES INSTANCIADAS
-- ANTES DE LA ENTIDAD PRINCIPAL, TAL CUAL ESTA EN LA ESTRUCTURA DEL DISEÑO.
-- =========================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Declaración de entidad y lista de puertos
entity Sumador4_Bits is 
	port(
		X : in std_logic_vector(3 downto 0);
		Y : in std_logic_vector(3 downto 0);
		CarriSalida : out std_logic;
		Salida : out std_logic_vector(3 downto 0)
	);
end entity;

--Arquitectura del sumador
architecture Sumador4B of Sumador4_Bits is
		--Para los acarreos de los sumadores de 1 bit
		signal Acarreos : std_logic_vector(3 downto 0);
		
		

begin		
	Acarreos(0) <= '0'; -- Conectado a tierra
	--Instanciaciones y mapeo de señales
	SC1: entity work.Sumador_Completo
		port map(
			X => X(0),
			Y => Y(0),
			Carrientrada => Acarreos(0),
			AcarreoSalida => Acarreos(1) ,
			Salida  => Salida(0)
		);
		
	SC2: entity work.Sumador_Completo
		port map(
			X => X(1),
			Y => Y(1),
			Carrientrada => Acarreos(1),
			AcarreoSalida => Acarreos(2) ,
			Salida  => Salida(1)
		);
		
	SC3: entity work.Sumador_Completo
		port map(
			X => X(2),
			Y => Y(2),
			Carrientrada => Acarreos(2),
			AcarreoSalida => Acarreos(3) ,
			Salida  => Salida(2)
		);

	SC4: entity work.Sumador_Completo
		port map(
			X => X(3),
			Y => Y(3),
			Carrientrada => Acarreos(3),
			AcarreoSalida => CarriSalida ,
			Salida  => Salida(3)
		);		
		
end Sumador4B; --Fin del sumador