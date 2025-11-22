-- ===========================================================================
--		 				**** Testbench Decodificador Binario A Gray ****
--
-- El presente código implementa el Testbench del Decodificador binario a gray
-- a fin de analizar el funcionamiento de la entidad.
-- ** NOTAS **
--	+ DUT : NOMBRE DE LA INSTANCIACIÓN
--  + INSTANCIACIÓN DE LA ENTIDAD ES POR COMPONENTE
-- ===========================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad del Testbench
entity DecodificadorBinario_Gray_TB is
end entity;

-- Arquitectura
architecture Testbench of DecodificadorBinario_Gray_TB is

	-- Componente local
	component DecodificadorBinario_Gray
		port(
			Binario: in std_logic_vector(3 downto 0);
			Gray : out std_logic_vector(3 downto 0)
		);
	end component;
	
	--Señales internas del Testbench
	signal Binario_TB : std_logic_vector(3 downto 0);
	signal Gray_TB : std_logic_vector(3 downto 0) := "0000";
	
	begin
	--Instanciación de la entidad
	DUT: DecodificadorBinario_Gray
	port map(
			Binario => Binario_TB,
			Gray => Gray_TB
	);
	
	--Aplicación de estimulos a las señales del Testbench
	Estimulos: process
	begin
		
		Binario_TB <= "0000"; wait for 10 ns;
		Binario_TB <= "0001"; wait for 10 ns;
		Binario_TB <= "0010"; wait for 10 ns;
		Binario_TB <= "0011"; wait for 10 ns;
		Binario_TB <= "0100"; wait for 10 ns;
		Binario_TB <= "0101"; wait for 10 ns;
		Binario_TB <= "0110"; wait for 10 ns;
		Binario_TB <= "0111"; wait for 10 ns;
		Binario_TB <= "1000"; wait for 10 ns;
		Binario_TB <= "1001"; wait for 10 ns;
		Binario_TB <= "1010"; wait for 10 ns;
		Binario_TB <= "1011"; wait for 10 ns;
		Binario_TB <= "1100"; wait for 10 ns;
		Binario_TB <= "1101"; wait for 10 ns;
		Binario_TB <= "1110"; wait for 10 ns;
		Binario_TB <= "1111"; wait for 10 ns;
		wait;
	end process;
end Testbench; --Fin del Testbench