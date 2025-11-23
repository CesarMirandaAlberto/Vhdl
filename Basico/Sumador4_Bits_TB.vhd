-- ========================================================================================
-- 						**** TESTBENCH SUMADOR DE 4 BITS ****
--
-- 	El presente código implementa el Testbench del sumador de 4 bits a fin de analizar El
--  funcionamiento del sumador.
--  **NOTAS**
--	  * DUT => Nombre de la instanciación
--    * Instanciación mediante componente
-- ========================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Declaración de entidad del Testbench
entity Sumador4_Bits_TB is
end entity;

--Arquitectura
architecture Testbench of Sumador4_Bits_TB is
		--componente local
		component Sumador4_Bits
			port(
				X : in std_logic_vector(3 downto 0);
				Y : in std_logic_vector(3 downto 0);
				CarriSalida : out std_logic;
				Salida : out std_logic_vector(3 downto 0)
				);
		end component;
		
		--Señales internas
				signal X_TB : std_logic_vector(3 downto 0);
				signal Y_TB : std_logic_vector(3 downto 0);
				signal CarriSalida_TB : std_logic;
				signal Salida_TB : std_logic_vector(3 downto 0);
				
	begin			
		DUT : Sumador4_Bits -- instanciación
			port map( --Mapeo de señales
				X => X_TB,
				Y => Y_TB, 
				CarriSalida => CarriSalida_TB,
				Salida => Salida_TB
			);
		
		Estimulos: process --Estimulos
			begin
					X_TB <="0000"; Y_TB <= "0000"; wait for 10 ns;
					X_TB <="0001"; Y_TB <= "0001"; wait for 10 ns;
					X_TB <="0010"; Y_TB <= "0010"; wait for 10 ns;
					X_TB <="0011"; Y_TB <= "0011"; wait for 10 ns;
					X_TB <="0100"; Y_TB <= "0100"; wait for 10 ns;
					X_TB <="0101"; Y_TB <= "0101"; wait for 10 ns;
					X_TB <="0110"; Y_TB <= "0110"; wait for 10 ns;
					X_TB <="0111"; Y_TB <= "0111"; wait for 10 ns;
					X_TB <="1000"; Y_TB  <= "0011"; wait for 10 ns;
					wait;
			end process;
end Testbench; --Fin del Testbench
