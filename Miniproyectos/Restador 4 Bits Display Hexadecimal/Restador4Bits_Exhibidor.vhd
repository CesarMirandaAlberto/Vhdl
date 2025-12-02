-- =========================================================================================
-- 				**** SUMADOR DE 4 BITS DISPLAY 7 SEGMENTOS  HEXADECIMAL ****
--
--	El presente código implementa el desarrollo de un restador de 4 bits con exhibidor de
--	4 segmentos. El funcionamiento es el mismo que el restador de 4 BITS presentado en la 
--  carpeta Basico con la diferencia que en este módulo se agrega El exhibidor de ánodo común
--  esto mediante instanciación del decodificador Binario a Hexadecimal.
--				** ESTRUCTURA DEL DISEÑO **
--				* Medio_Restador.vhd
--				* Restador_Completo.vhd
--				* DecodificadorBinario_Hexadecimal.vhd
--				* Restador4Bits_Exhibidor.vhd
--	Para cada señal de entrada se determina su equivalencia en salida de 7 bits esto para 
--	mostrar en el display 7 segmentos el valor en hexadecimal, Ejemplo: Entrada X de 4 bits
--	Su equivalencia en salida es X_Display de 7 bits.
--	**NOTAS**
-- 	Instanciación directa
--	DBH: Datos Binario a Hexadecimal
--	RC : Restador Completo
--	DADO QUE ES DISEÑO A NIVEL ESTRUCTURAL ES NECESARIO COMPILAR LAS ENTIDADES INSTANCIADAS
-- ANTES DE LA ENTIDAD PRINCIPAL, TAL CUAL ESTA EN LA ESTRUCTURA DEL DISEÑO.
-- =========================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad y Lista de puertos
entity Restador4Bits_Exhibidor is
	port(
		X : in std_logic_vector(3 downto 0);
		Y : in std_logic_vector(3 downto 0);
		CarrieNegSalida : out std_logic;
		X_Display : out std_logic_vector(6 downto 0);
		Y_Display : out std_logic_vector(6 downto 0);
		Resultado: out std_logic_vector(6 downto 0)
		);
end entity;

--Arquitectura
architecture Restador4BE of Restador4Bits_Exhibidor is

	--Señales internas par conectar los acarreos negativos
	signal CarrieNegativos : std_logic_vector(4 downto 0);
	signal R : std_logic_vector(3 downto 0);
	
	begin
	
		CarrieNegativos(0) <= '0'; --Primer Carrie va a tierra
		--Creación mediante instanciación del restador de 4 bits partiendo de 4 restadores completos de 1 bit conectados en cascada
		RC1 : entity work.Restador_Completo
		port map(
			X =>X(0),
			Y =>Y(0),
			CarrieNEntrada => CarrieNegativos(0),
			R => R(0),
			CarrieNSalida => CarrieNegativos(1)	
		);
		
		RC2 : entity work.Restador_Completo
			port map(
				X =>X(1),
				Y =>Y(1),
				CarrieNEntrada =>CarrieNegativos(1),
				R =>R(1),
				CarrieNSalida =>CarrieNegativos(2)	
			);
			
		RC3 : entity work.Restador_Completo
			port map(
				X =>X(2),
				Y =>Y(2),
				CarrieNEntrada => CarrieNegativos(2),
				R =>R(2),
				CarrieNSalida =>CarrieNegativos(3)	
			);
			
		RC4 : entity work.Restador_Completo
			port map(
				X =>X(3),
				Y =>Y(3),
				CarrieNEntrada =>CarrieNegativos(3),
				R => R(3),
				CarrieNSalida =>CarrieNegativos(4)	
			);
		
		CarrieNegSalida <= CarrieNegativos(4);
		
		DBX : entity work.DecodificadorBinario_Hexadecimal
			port map(
				X => X,
				Salida => X_Display
		);
		
		DBY : entity work.DecodificadorBinario_Hexadecimal
			port map(
				X => Y,
				Salida => Y_Display
		);
		
		DBR : entity work.DecodificadorBinario_Hexadecimal
			port map(
				X => R,
				Salida => Resultado
		);
	
	
end Restador4BE; --Fin del restador
