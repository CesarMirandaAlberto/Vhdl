-- ===========================================================================
--				**** DECODER BCD A SIETE SEGMENTOS ****
--
--	El presente código implementa el diseño de un decoder binario a decimal 
--	con display 7 segmentos de ánodo común. Se implementan constantes para
--	evitar números magicos en la evaluación de los case para la entrada en 
--	binario.
--	Se implementa asignamiento por defecto al inicio de la lista sensitiva 
--  para evitar latches.
-- ===========================================================================

--Inclusion de libreria
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad y lista de puertos
entity DecoderBCD_7Seg  is
	port(
		Binario : in std_logic_vector(3 downto 0);
		Decimal : out std_logic_vector(6 downto 0)
	);
end entity;

--Arquitectura del decoder
architecture Decoderbcd of DecoderBCD_7Seg is
	
	--Constantes para mostrar números en display 7 segmentos
	constant NUMEROCERO: std_logic_vector(6 downto 0) := "1000000";
	constant NUMEROUNO: std_logic_vector(6 downto 0) := "1111001";
	constant NUMERODOS: std_logic_vector(6 downto 0) := "0100100";
	constant NUMEROTRES: std_logic_vector(6 downto 0) := "0110000";
	constant NUMEROCUATRO: std_logic_vector(6 downto 0) := "0011001";
	constant NUMEROCINCO: std_logic_vector(6 downto 0) := "0010010";
	constant NUMEROSEIS: std_logic_vector(6 downto 0) := "0000010";
	constant NUMEROSIETE: std_logic_vector(6 downto 0) := "1111000";
	constant NUMEROOCHO: std_logic_vector(6 downto 0) := "0000000";
	constant NUMERONUEVE: std_logic_vector(6 downto 0) := "0011000";
	constant DEFECTO: std_logic_vector(6 downto 0) := "1111111";
	
	begin
		--Lista sensitiva unicamente con la señal de entrada Binario 
		process(Binario) begin
			Decimal <= DEFECTO; --Evitar latches
			case Binario is -- Evaluación de la entrada en binario
				when "0000" => Decimal <= NUMEROCERO;
				when "0001" => Decimal <= NUMEROUNO;
				when "0010" => Decimal <= NUMERODOS;
				when "0011" => Decimal <= NUMEROTRES;
				when "0100" => Decimal <= NUMEROCUATRO;
				when "0101" => Decimal <= NUMEROCINCO;
				when "0110" => Decimal <= NUMEROSEIS;
				when "0111" => Decimal <= NUMEROSIETE;
				when "1000" => Decimal <= NUMEROOCHO;
				when "1001" => Decimal <= NUMERONUEVE;
				when others => Decimal <= DEFECTO;
				end case;
		end process; --Fin de la lista sensitiva
end Decoderbcd;-- Fin del diseño