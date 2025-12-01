-- ===========================================================================
--					**** MULTIPLICADOR DE 4 BITS ****
-- 
--	El presente código vhdl implementa el diseño de un módulo multiplicador de 
--	4 bits a nivel estructural.
--		** ESTRUCTURA DEL DISEÑO **
--			* Medio_Sumador.vhd
--			* Sumador_Completo.vhd
--			* Multiplicador4_Bits.vhd
--	El módulo consta de 2 entradas de 4 bits y una salida de 8 bits la cual
--	almacenará el resultado de la Multiplicacion.
--	**FUNCIONAMIENTO**
--	Al igual que una multiplicación donde se realizan multipliaciones y despues
-- 	se hace la suma de los resultados es lo mismo en este diseño donde para 
--	realizar las multipliaciones se implementan compuertas and y posteriormente
--	se realiza la suma de los resultados mediante sumadores comopletos de 1 bit
--	conectados en cascada, Se implementan señales internas para almacenar las 
-- 	multipliaciones con and, sumas parciales, acarreos.
--	** NOTAS **
--	SC = SumadorCompleto
--	SE DEBEN COMPILAR TODOS LOS ARCHIVOS DEL LA ESTRUCTURA DEL DISEÑO EN EL 
--	ORDEN EN QUE SE ENCUENTRAN.
-- ===========================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad y lista de puertos
entity Multiplicador4_Bits is
	port(
		X : in std_logic_vector(3 downto 0);
		Y : in std_logic_vector(3 downto 0);
		Salida : out std_logic_vector( 7 downto 0)
	);
end entity;

--Arquitectura del multiplicador
architecture Multiplicador4 of Multiplicador4_Bits is
	
	--Señales internas
	signal Multiplicacion : std_logic_vector(15 downto 0);
	signal SumaParcial : std_logic_vector(5 downto 0);
	signal Acarreos : std_logic_vector(11 downto 0);
	signal AcarreoFinal : std_logic;
	
	--Constante
	constant TIERRA: std_logic := '0';

	begin
	--Primer acarreo conectado a tierra
	Acarreos(0) <= TIERRA;
	
	--Multiplicaciones
	Multiplicacion(0) <= X(0) and Y(0);
	Multiplicacion(1) <= X(1) and Y(0);
	Multiplicacion(2) <= X(2) and Y(0);
	Multiplicacion(3) <= X(3) and Y(0);
	Multiplicacion(4) <= X(0) and Y(1);
	Multiplicacion(5) <= X(1) and Y(1);
	Multiplicacion(6) <= X(2) and Y(1);
	Multiplicacion(7) <= X(3) and Y(1);
	Multiplicacion(8) <= X(0) and Y(2);
	Multiplicacion(9) <= X(1) and Y(2);
	Multiplicacion(10) <= X(2) and Y(2);
	Multiplicacion(11) <= X(3) and Y(2);
	Multiplicacion(12) <= X(0) and Y(3);
	Multiplicacion(13) <= X(1) and Y(3);
	Multiplicacion(14) <= X(2) and Y(3);
	Multiplicacion(15) <= X(3) and Y(3);
	
	Salida(0) <= Multiplicacion(0);
	--Instanciación de sumadores y suma de resultados de multiplicación
	SC1 : entity work.Sumador_Completo
		port map(
				X => Multiplicacion(1),
				Y => Multiplicacion(4),
				Carrientrada =>	Acarreos(0) ,
				AcarreoSalida => Acarreos(1),
				Salida => Salida(1)
		);

	SC2 : entity work.Sumador_Completo
		port map(
				X => Multiplicacion(2),
				Y => Multiplicacion(5),
				Carrientrada =>	Acarreos(1) ,
				AcarreoSalida => Acarreos(2),
				Salida => SumaParcial(0)
		);

	SC3 : entity work.Sumador_Completo
		port map(
				X => Multiplicacion(6),
				Y => Multiplicacion(3),
				Carrientrada =>	Acarreos(2) ,
				AcarreoSalida => Acarreos(3),
				Salida =>  SumaParcial(1)
		);
		
	SC4 : entity work.Sumador_Completo
		port map(
				X => TIERRA,
				Y => Multiplicacion(7),
				Carrientrada =>	Acarreos(3) ,
				AcarreoSalida => Acarreos(4),
				Salida =>  SumaParcial(2)
		);
		
		
	SC5 : entity work.Sumador_Completo
		port map(
				X => SumaParcial(0),
				Y => Multiplicacion(8),
				Carrientrada =>	Acarreos(4) ,
				AcarreoSalida => Acarreos(5),
				Salida => Salida(2)
		);

	SC6 : entity work.Sumador_Completo
		port map(
				X =>SumaParcial(1),
				Y => Multiplicacion(9),
				Carrientrada =>	Acarreos(5) ,
				AcarreoSalida => Acarreos(6),
				Salida => SumaParcial(3)
		);

	SC7 : entity work.Sumador_Completo
		port map(
				X => SumaParcial(2),
				Y => Multiplicacion(10),
				Carrientrada =>	Acarreos(6) ,
				AcarreoSalida => Acarreos(7),
				Salida => SumaParcial(4)
		);

	SC8 : entity work.Sumador_Completo
		port map(
				X => Multiplicacion(11),
				Y => Acarreos(3),
				Carrientrada =>	Acarreos(7) ,
				AcarreoSalida => Acarreos(8),
				Salida => SumaParcial(5)
		);

	SC9 : entity work.Sumador_Completo
		port map(
				X => SumaParcial(3),
				Y => Multiplicacion(12),
				Carrientrada =>	TIERRA ,
				AcarreoSalida => Acarreos(9),
				Salida => Salida(3)
		);

	SC10 : entity work.Sumador_Completo
		port map(
				X => SumaParcial(4),
				Y => Multiplicacion(13),
				Carrientrada =>	Acarreos(9) ,
				AcarreoSalida => Acarreos(10),
				Salida => Salida(4)
		);

	SC11 : entity work.Sumador_Completo
		port map(
				X => SumaParcial(5),
				Y => Multiplicacion(14),
				Carrientrada =>	Acarreos(10) ,
				AcarreoSalida => Acarreos(11),
				Salida => Salida(5)
		);

	SC12 : entity work.Sumador_Completo
		port map(
				X => Acarreos(8),
				Y => Multiplicacion(15),
				Carrientrada =>	Acarreos(11) ,
				AcarreoSalida => AcarreoFinal,
				Salida => Salida(6)
		);

		--Ultimo bit del resultado
		Salida(7) <=AcarreoFinal;
end Multiplicador4; --Fin del multiplicador