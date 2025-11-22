-- ===========================================================================
--			**** DECODIFICADOR BINARIO A HEXADECIMAL ****
-- 
--	El presente còdigo implementa el diseño de un Decodificador Binario a 
--  HEXADECIMAL teniendo una entrada con un ancho de 4 bits para una Salida
--  de 7 bits.
--  ** NOTA**
--  La salida del DECODIFICADOR esta desarrollada para mostrarse en un display
--  siete segmentos de Ànodo comùn para un FPGA DE10-Lite, por lo que su 
--  còdigo de salida no serà el hexadecimal si no las combinaciones de bits
--  para formar el nùmero hexadecimal en el display.
--  Se implementan constantes para evitar nùmeros màgicos en la evaluaciòn del 
--  la entrada.
-- ===========================================================================

--Inclusiòn de libreria
library IEEE;
use ieee.std_logic_1164.all;

--Entidad y lista de puertos
entity DecodificadorBinario_Hexadecimal is
		port(
			X : in std_logic_vector(3 downto 0);
			Salida: out std_logic_vector(6 downto 0)
		);
end entity;
 
architecture Decodificador of DecodificadorBinario_Hexadecimal is

-- Definiciòn de constantes 
-- Para los cases, (numero BINARIO)
	constant CERO: std_logic_vector(3 downto 0) := "0000";
	constant UNO: std_logic_vector(3 downto 0) := "0001";
	constant DOS: std_logic_vector(3 downto 0) := "0010";
	constant TRES: std_logic_vector(3 downto 0) := "0011";
	constant CUATRO: std_logic_vector(3 downto 0) := "0100";
	constant CINCO: std_logic_vector(3 downto 0) := "0101";
	constant SEIS: std_logic_vector(3 downto 0) := "0110";
	constant SIETE: std_logic_vector(3 downto 0) := "0111";
	constant OCHO: std_logic_vector(3 downto 0) := "1000";
	constant NUEVE: std_logic_vector(3 downto 0) := "1001";
	constant A: std_logic_vector(3 downto 0) := "1010";
	constant B: std_logic_vector(3 downto 0) := "1011";
	constant C: std_logic_vector(3 downto 0) := "1100";
	constant D: std_logic_vector(3 downto 0) := "1101";
	constant E: std_logic_vector(3 downto 0) := "1110";
	constant F: std_logic_vector(3 downto 0) := "1111";
	
-- Para Numero HEXADECIMAL en el display
	constant NUMEROCERO: std_logic_vector(6 downto 0) := "1000000";
	constant NUMEROUNO: std_logic_vector(6 downto 0) := "1111001";
	constant NUMERODOS: std_logic_vector(6 downto 0) := "0100100";
	constant NUMEROTRES: std_logic_vector(6 downto 0) := "0110000";
	constant NUMEROCUATRO: std_logic_vector(6 downto 0) := "0011001";
	constant NUMEROCINCO: std_logic_vector(6 downto 0) := "0010010";
	constant NUMEROSEIS: std_logic_vector(6 downto 0) := "0000010";
	constant NUMEROSIETE: std_logic_vector(6 downto 0) := "1111000";
	constant NUMEROOCHO: std_logic_vector(6 downto 0) := "0000000";
	constant NUMERONUEVE: std_logic_vector(6 downto 0) := "0010000";
	constant LETRAA: std_logic_vector(6 downto 0) := "0001000";
	constant LETRAB: std_logic_vector(6 downto 0) := "1100000";
	constant LETRAC: std_logic_vector(6 downto 0) := "0110001";
	constant LETRAD: std_logic_vector(6 downto 0) := "1000010";
	constant LETRAE: std_logic_vector(6 downto 0) := "0110000";
	constant LETRAF: std_logic_vector(6 downto 0) := "0111000";
	constant DEFECTO: std_logic_vector(6 downto 0) := "1111111";
	
	begin
		--Lista sensitiva
		process(X) begin
		Salida <= DEFECTO; --Evitar latches
			case X is --Asignaciones
				when CERO => Salida <=NUMEROCERO;
				when UNO => Salida <=NUMEROUNO;
				when DOS => Salida <=NUMERODOS;
				when TRES => Salida <=NUMEROTRES;
				when CUATRO => Salida <=NUMEROCUATRO;
				when CINCO => Salida <=NUMEROCINCO;
				when SEIS => Salida <=NUMEROSEIS;
				when SIETE => Salida <=NUMEROSIETE;
				when OCHO => Salida <=NUMEROOCHO;
				when NUEVE => Salida <=NUMERONUEVE;
				when A => Salida <=LETRAA;
				when B => Salida <=LETRAB;
				when C => Salida <=LETRAC;
				when D => Salida <=LETRAD;
				when E => Salida <=LETRAE;
				when F => Salida <=LETRAF;
				when others => Salida <= DEFECTO;
			end case;
		end process;
		
end Decodificador; -- Fin de la arquitectura