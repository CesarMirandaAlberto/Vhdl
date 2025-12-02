-- =========================================================================================
-- 				**** SUMADOR DE 4 BITS DISPLAY 7 SEGMENTOS ****
--
-- 	El presente código implementa el desarrollo de un sumador de 4 bits configuration
--	exhibidor de 7 segmentos. El funcionamiento es el mismo que el sumador de 4 BITS
--  presentado en la carpeta Basico con la diferencia que en este módulo se agrega El
-- 	exhibidor de ánodo común, esto mediante instanciación del decodificador Binario a
--	hexadecimal.
--			** ESTRUCTURA DEL DISEÑO **
--				* Medio_Sumador.vhd
--				* Sumador_Completo.vhd
--				* DecodificadorBinario_Hexadecimal.vhd
--				* Sumador4Bits_Exhibidor.vhd
--	Para cada señal de entrada se determina su equivalencia en salida de 7 bits esto para 
--	mostrar en el display 7 segmentos el valor en hexadecimal, Ejemplo: Entrada X de 4 bits
--	Su equivalencia en salida es X_Display de 7 bits.
--	**NOTAS**
--	DBH: Datos Binario a Hexadecimal
--	SC : Sumador Completo
--	DADO QUE ES DISEÑO A NIVEL ESTRUCTURAL ES NECESARIO COMPILAR LAS ENTIDADES INSTANCIADAS
-- ANTES DE LA ENTIDAD PRINCIPAL, TAL CUAL ESTA EN LA ESTRUCTURA DEL DISEÑO.
-- =========================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad y lista de puertos
entity Sumador4Bits_Exhibidor is
	port(
		X : in std_logic_vector(3 downto 0);
		Y : in std_logic_vector(3 downto 0);
		CarriSalida : out std_logic;
		X_Display : out std_logic_vector(6 downto 0);
		Y_Display : out std_logic_vector(6 downto 0);
		Resultado: out std_logic_vector(6 downto 0)
	);
end entity;

--Arquitectura
architecture Sumador4BE of Sumador4Bits_Exhibidor is
	--Señales internas
	signal Acarreos : std_logic_vector(3 downto 0);
	signal Salida : std_logic_vector(3 downto 0);
	

	begin	
	
	Acarreos(0) <= '0'; --Primer acarreo a tierra
	
	--Sumador de 4 bits en formada por sumadores de 1 bit conectados en cascada mediante instanciaciones directas
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
	
	-- Aplicación de decodificador en base a los valores de las señales X, Y, Resultado
	DBHX: entity work.DecodificadorBinario_Hexadecimal
		port map(
			X => X,
			Salida => X_Display
		);
		
	DBHY: entity work.DecodificadorBinario_Hexadecimal
		port map(
			X => Y,
			Salida => Y_Display
		);
	
	DBHR: entity work.DecodificadorBinario_Hexadecimal
		port map(
			X => Salida,
			Salida => Resultado
		);
		
	
end Sumador4BE; --Fin del sumador 