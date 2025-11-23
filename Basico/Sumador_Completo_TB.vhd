-- ================================================================================
-- 						**** TESTBENCH SUMADOR COMPLETO ****
--
-- El presente código implementa el desarrollo del Testbench del sumador completo
-- a fin de analizar el funcionamiento del sumador.
-- *NOTAS* DUT=> Nombre de la instanciación
-- instanciación de la entidad es por componente
-- ================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad del Testbench
entity Sumador_Completo_TB is 
end entity;

--Arquitectura
architecture Testbench of Sumador_Completo_TB is
	component Sumador_Completo --Componente local
		port(
			X : in std_logic;
			Y : in std_logic;
			Carrientrada: in std_logic;
			AcarreoSalida : out std_logic;
			Salida : out std_logic
			);
	end component;
	--Señales internas del Testbench
			signal X_TB :  std_logic;
			signal Y_TB :  std_logic;
			signal Carrientrada_TB : std_logic;
			signal AcarreoSalida_TB : std_logic;
			signal Salida_TB : std_logic;
			
	begin
		--Instanciación de la entidad
		DUT: Sumador_Completo
			port map( --Mapeo de señales
				X => X_TB,
				Y => Y_TB,
				Carrientrada => Carrientrada_TB,
				AcarreoSalida => AcarreoSalida_TB,
				Salida => Salida_TB
			);
		--Estimulos
		Estimulos: process begin
						X_TB <= '0'; Y_TB <= '0'; Carrientrada_TB<= '0'; wait for 10 ns;
						X_TB <= '0'; Y_TB <= '1'; Carrientrada_TB<= '0'; wait for 10 ns;
						X_TB <= '1'; Y_TB <= '0'; Carrientrada_TB<= '0'; wait for 10 ns;
						X_TB <= '1'; Y_TB <= '1'; Carrientrada_TB<= '0'; wait for 10 ns;
						
						X_TB <= '0'; Y_TB <= '0'; Carrientrada_TB<= '1'; wait for 10 ns;
						X_TB <= '0'; Y_TB <= '1'; Carrientrada_TB<= '1'; wait for 10 ns;
						X_TB <= '1'; Y_TB <= '0'; Carrientrada_TB<= '1'; wait for 10 ns;
						X_TB <= '1'; Y_TB <= '1'; Carrientrada_TB<= '1'; wait for 10 ns;
						wait;
					end process;
end Testbench; --Fin del Testbench
