-- ===========================================================================
-- 					**** Testbench Codificador 7 a 3 ****
--
--  El presente código implementa el desarrollo del Testbench del Codificador 
--  7 a 3 a fin de analizar el correcto funcionamiento del Codificador.
--  ** NOTAS **
--  DUT -- Nombre de la instanciación
--  para la instanciación se realiza mediante componente
-- ===========================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Declaración de entidad
entity Codificador7a3_TB is
end entity;

--Arquitectura
architecture Testbench of Codificador7a3_TB is
		--Componente local
		component Codificador7a3
		port(
				X : in std_logic_vector(6 downto 0);
				Salida: out std_logic_vector(2 downto 0)
			);
			
		end component;
		--Señales locales del Testbench
		signal X_TB : std_logic_vector(6 downto 0);
		signal Salida_TB: std_logic_vector(2 downto 0) := "000";
		
		begin
		-- instanciación
		DUT: Codificador7a3
			port map( --Mapeo de señales
				X => X_TB,
				Salida => Salida_TB
			);
		--Estimulos
		Estimulos: process
			begin
				X_TB <= "0000000"; wait for 10 ns;
				X_TB <= "0000001"; wait for 10 ns;
				X_TB <= "0000010"; wait for 10 ns;
				X_TB <= "0000100"; wait for 10 ns;
				X_TB <= "0001000"; wait for 10 ns;
				X_TB <= "0010000"; wait for 10 ns;
				X_TB <= "0100000"; wait for 10 ns;
				X_TB <= "1000000"; wait for 10 ns;
				wait;
			end process;
end architecture;