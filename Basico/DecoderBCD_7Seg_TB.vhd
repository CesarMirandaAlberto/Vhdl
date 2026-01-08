-- ===========================================================================
--				**** TESTBENCH DECODER BCD A SIETE SEGMENTOS ****
--
--	El presente código implementa el desarrollo del Testbench del decoder BCD
-- 	a fin de analizar el funcionamiento del mismo. 
-- ** NOTAS **
--	+ DUT : NOMBRE DE LA INSTANCIACIÓN
--  + INSTANCIACIÓN DE LA ENTIDAD ES DIRECTA
-- ===========================================================================

-- Inclusión  de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad del Testbench
entity DecoderBCD_7Seg_TB is
end entity;

--	Arquitectura
architecture Testbench of DecoderBCD_7Seg_TB is
		--Señales internas del Testbench
		signal Binario_TB : std_logic_vector(3 downto 0);
		signal Decimal_TB : std_logic_vector(6 downto 0);
		
	begin
		--Instanciación
		DUT : entity work.DecoderBCD_7Seg
			port map( --Mapeo de Señales
				Binario => Binario_TB,
				Decimal => Decimal_TB
			);
		--Inyección de valores a las señales del Testbench
		ESTIMULOS : process begin
			
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
			wait;
		end process; --Fin de los estimulos
		
end Testbench; --Fin del Testbench