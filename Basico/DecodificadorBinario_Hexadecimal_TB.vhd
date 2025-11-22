-- ===========================================================================
--			**** TESTBENCH DECODIFICADOR BINARIO A HEXADECIMAL ****
--
--	El presente còdigo vhdl implementa el desarrollo del Testbench del 
--  decodificador binario a hexadecimal, a fin de analizar el funcionamiento
-- 	de la entidad.
--  **NOTAS**
-- 	DUT: Nombre de la instanciaciòn
--  Intanciaciòn hecha mediante componentes
-- ===========================================================================

-- Inclusiòn de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad del Testbench
entity DecodificadorBinario_Hexadecimal_TB is
end entity;

--Arquitectura del Testbench
architecture Testbench of DecodificadorBinario_Hexadecimal_TB is

	--Componente local
	component DecodificadorBinario_Hexadecimal
	port(
		X : in std_logic_vector(3 downto 0);
		Salida: out std_logic_vector(6 downto 0)
	);
end component;
		
		--Señales internas del Testbench
		signal X_TB : std_logic_vector(3 downto 0);
		signal Salida_TB: std_logic_vector(6 downto 0);
		
		begin
		--Instanciaciòn de la entidad
		DUT: DecodificadorBinario_Hexadecimal
			port map( --Mapeo de señales
				X => X_TB,
				Salida => Salida_TB
			);
		
		--Estimulos a las señales del testbench
		Estimulos: process
			begin
				X_TB <= "0000"; wait for 10 ns;
				X_TB <= "0001"; wait for 10 ns;
				X_TB <= "0010"; wait for 10 ns;
				X_TB <= "0011"; wait for 10 ns;
				X_TB <= "0100"; wait for 10 ns;
				X_TB <= "0101"; wait for 10 ns;
				X_TB <= "0110"; wait for 10 ns;
				X_TB <= "0111"; wait for 10 ns;
				X_TB <= "1000"; wait for 10 ns;
				X_TB <= "1001"; wait for 10 ns;
				X_TB <= "1010"; wait for 10 ns;
				X_TB <= "1011"; wait for 10 ns;
				X_TB <= "1100"; wait for 10 ns;
				X_TB <= "1101"; wait for 10 ns;
				X_TB <= "1110"; wait for 10 ns;
				X_TB <= "1111"; wait for 10 ns;
				wait;
			
		end process;
end Testbench; -- Fin del Testbench