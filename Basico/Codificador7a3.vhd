-- ===========================================================================
-- 					**** CODIFICADOR 7 A 3 ****
--
--	 El presente código VHDL implementa el diseño de un Codificador 7 a 3
--   7 entradas y una 3 salidas. Se implementa el uso de arreglos para las 
-- 	 entradas y salidas, ademas del uso de constantes para evitar números
--   mágicos.
--   La asinación de valores a las salidas se realiza mediante el uso de process
--   y case para evaluar los valores de la entrada  ademas que se inicializa
--   en 0 la Salida fuera del case para evitar latches.
-- ===========================================================================

-- Inclusión ibrerias
library IEEE;
use  ieee.std_logic_1164.all;

-- Definición de la entidad y lista de puertos
entity Codificador7a3 is
	port(
		X : in std_logic_vector(6 downto 0);
		Salida: out std_logic_vector(2 downto 0)
	);
end entity;

--Arquitectura
architecture Codificador of Codificador7a3 is

-- Definición de constantes
	constant CERO : std_logic_vector(6 downto 0) := "0000000";
	constant UNO : std_logic_vector(6 downto 0) := "0000001";
	constant DOS : std_logic_vector(6 downto 0) := "0000010";
	constant TRES: std_logic_vector(6 downto 0) := "0000100";
	constant CUATRO: std_logic_vector(6 downto 0) :="0001000";
	constant CINCO: std_logic_vector(6 downto 0) := "0010000";
	constant SEIS: std_logic_vector(6 downto 0) :="0100000";
	constant SIETE: std_logic_vector(6 downto 0) :="1000000";
	
	begin
	process(X) begin
		Salida <="000"; --Evitar latches
		
			case X is --asinación de salidas
				when CERO => Salida <= "000";
				when UNO => Salida <= "001";
				when DOS => Salida <= "010";
				when TRES => Salida <= "011";
				when CUATRO => Salida <= "100";
				when CINCO => Salida <= "101";
				when SEIS => Salida <= "110";
				when SIETE => Salida <= "111";
				when others => Salida <="000";	
			end case;
	end process;
end Codificador;