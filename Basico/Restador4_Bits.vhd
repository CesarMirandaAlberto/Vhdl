-- ===========================================================================
--						**** RESTADOR DE 4 BITS ****
--
--	El presente código implementa el diseño de un restador de 4 bits a nivel 
--	estructural:
--		** ESTRUCTURA DEL DISEÑO **
--			* Medio_Restador.vhd
--			* Restador_Completo.vhd
--			* Restador4_Bits.vhd
--	el diseño consta de 2 entradas y 1 salida con un ancho de 4 bits ademas del
--	carrie negativo el cual se puede interpretar como una bandera para detectar
--	cuando hay un desborde en los bits.
--	Las entradas y salidas instancean a 4 restadores completos los cuales estan 
-- 	conectados en cascada entre si para de esta forma formar el restador de los
--	4 bits, se implementan señales internas para conectar los acarreos negativos
--	de los restadores completos.
--	** NOTAS **
--	RC= RestadorCompleto
--	ES NECESARIO COMPILAR TODOS LOS MÓDULOS DE LA ESTRUCTURA DEL DISEÑO EN EL 
--	ORDEN EN QUE ESTAN.
-- ===========================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad y lista de puertos del diseño
entity Restador4_Bits is
	port(
		X : in std_logic_vector(3 downto 0);
		Y : in std_logic_vector(3 downto 0);
		CarrieNegSalida : out std_logic;
		R : out std_logic_vector(3 downto 0)
	);
end entity;

--Arquitectura del diseño
architecture Restador4b of Restador4_Bits is

	--Señales internas
	signal CarrieNegativos : std_logic_vector(4 downto 0);

	begin
		--Primer acarreo va a tierra
	 CarrieNegativos(0) <= '0';
	 --Instanciación de los restadores y mapeo de señales en cascada
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
	
	CarrieNegSalida <= CarrieNegativos(4); --Último acarreo
end Restador4b;