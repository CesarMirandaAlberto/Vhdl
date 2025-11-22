-- ===========================================================================
--		 				**** Decodificador Binario A Gray ****
--
--  El presente código vhdl desarrolla el diseño de un decodificador binario a 
--  gray. El diseño consta de 1 entrada y 1 salida ambas con un ancho de 4 bits
--  ademas que se implementan constantes para evitar números mágicos al momento 
--  de las asignaciones, estas se realizan mediante un case al mismo tiempo que
--  se iniciliza en 0 al inicio de la lista sensitiva para evitar latches.
--  ** LISTA SENSITIVA ** Solo se agrega la entrada a evaluar.
-- ============================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad y lista de puertos del diseño
entity DecodificadorBinario_Gray is
	port(
		Binario: in std_logic_vector(3 downto 0);
		Gray : out std_logic_vector(3 downto 0)
	);
end entity;

architecture Decoder of DecodificadorBinario_Gray is

	-- Definición de constantes para los case en binario
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
	constant DIEZ: std_logic_vector(3 downto 0) := "1010";
	constant ONCE: std_logic_vector(3 downto 0) := "1011";
	constant DOCE: std_logic_vector(3 downto 0) := "1100";
	constant TRECE: std_logic_vector(3 downto 0) := "1101";
	constant CATORCE: std_logic_vector(3 downto 0) := "1110";
	constant QUINCE: std_logic_vector(3 downto 0) := "1111";
	
	begin
		--lista sentiva
		process(Binario) begin
		Gray <= "0000";
			case Binario is --Asignación de valores acorde a la entrada
					when CERO => Gray <= "0000";
					when UNO => Gray <= "0001";
					when DOS => Gray <= "0011";
					when TRES => Gray <= "0010";
					when CUATRO => Gray <= "0110";
					when CINCO => Gray <= "0111";
					when SEIS => Gray <= "0101";
					when SIETE => Gray <= "0100";
					when OCHO => Gray <= "1100";
					when NUEVE => Gray <= "1101";
					when DIEZ => Gray <= "1111";
					when ONCE => Gray <= "1110";
					when DOCE => Gray <= "1010";
					when TRECE => Gray <= "1011";
					when CATORCE => Gray <= "1001";
					when QUINCE => Gray <= "1000";
					when others => Gray <= "0000";
			end case;
		end process; 
	
end Decoder; -- Fin de la arquitectura
