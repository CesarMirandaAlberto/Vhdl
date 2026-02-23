library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Calculadora4Bits is
	port(
		X_Top : in std_logic_vector(3 downto 0);
		Y_Top: in std_logic_vector(3 downto 0);
		Selector : in std_logic_vector(1 downto 0);
		-- SALIDAS
		DisplayEntradaX: out std_logic_vector(6 downto 0);
		DisplayEntradaY : out std_logic_vector(6 downto 0);
		DisplayUnidades : out std_logic_vector(6 downto 0);
		DisplayDecenas : out std_logic_vector(6 downto 0);
		DisplayCentenas : out std_logic_vector(6 downto 0)
	);
end entity;

architecture simple of Calculadora4Bits is

	signal SUMA : std_logic_vector(3 downto 0);
	signal RESTA : std_logic_vector(3 downto 0);
	
	
	signal RESULTADOSUMA : std_logic_vector(7 downto 0);
	signal RESULTADORESTA : std_logic_vector(7 downto 0);
	signal RESULTADOMULTIPLICACION : std_logic_vector(7 downto 0);
	
	signal BCDUnidades: std_logic_vector(3 downto 0);
	signal BCDDecenas: std_logic_vector(3 downto 0);
	signal BCDCentenas : std_logic_vector(3 downto 0);
	
	signal bufferCentenasX : std_logic_vector(3 downto 0);
	signal BufferUnidadesX : std_logic_vector(3 downto 0);
	signal BufferDecenasX : std_logic_vector(3 downto 0);
	
	signal bufferCentenasY : std_logic_vector(3 downto 0);
	signal BufferUnidadesY : std_logic_vector(3 downto 0);
	signal BufferDecenasY : std_logic_vector(3 downto 0);
	
	signal carrieAux : std_logic;
	signal carrieAux2 : std_logic;
	
	signal ResultadoFinal : std_logic_vector(7 downto 0);
	
	begin
		-- INSTANCIACIONES
		
		-- SUMADOR 4 BITS
		IS4 : entity work.Sumador4_Bits
			port map(
			 X => X_Top,
			 Y => Y_Top,
			 CarriSalida => carrieAux,
			 Salida => SUMA
			);
			
		-- RESTADOR 4 BITS
		IR4 : entity work.Restador4_Bits
			port map(
				X => X_Top,
				Y => Y_Top,
				CarrieNegSalida => carrieAux2,
				R => RESTA
			);
			
		-- MULTIPLICADOR DE 4 BITS
		IM4 : entity work.Multiplicador4_Bits
			port map(
				X => X_Top,
				Y => Y_Top,
				Salida => RESULTADOMULTIPLICACION
			);
		
		RESULTADOSUMA <= "0000" & SUMA;
		RESULTADORESTA <= "0000" & RESTA;
		-- MULTIPLEXOR
		with Selector select
			ResultadoFinal <=  RESULTADOSUMA when "00",
							   RESULTADORESTA when "01",
							   RESULTADOMULTIPLICACION when "10",
							  (others => '0') when others;
							  
		-- ALGORITMO DOUBLE DABBLE		
		IADD : entity work.DoubleDabble
			 port map(
				X => ResultadoFinal,
				Centenas => BCDCentenas,
				Decenas => BCDDecenas,
				Unidades => BCDUnidades
			 );

		
		-- DECODERS
			-- PARA LA ENTRADA X
		IDBHX : entity work.DecodificadorBinario_Hexadecimal
			port map(
				X => X_Top,
				Salida => DisplayEntradaX
			);
			
		
			-- PARA LA ENTRADA Y
		IDBHY : entity work.DecodificadorBinario_Hexadecimal
			port map(
				X => Y_Top,
				Salida => DisplayEntradaY
			);
			
		-- RESULTADO	
		IDDRU : entity work.DecoderBCD_7Seg
			port map(
				Binario => BCDUnidades,
				Decimal => DisplayUnidades
			);
			
		IDDRD : entity work.DecoderBCD_7Seg
			port map(
				Binario => BCDDecenas,
				Decimal => DisplayDecenas
			);
			
		IDDRC : entity work.DecoderBCD_7Seg
			port map(
				Binario => BCDCentenas,
				Decimal => DisplayCentenas
			);
		
end simple;
