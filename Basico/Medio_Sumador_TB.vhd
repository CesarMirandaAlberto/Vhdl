-- ===========================================================================
--					**** TESTBENCH MEDIO SUMADOR ****
--
-- El presente código implementa el desarrollo del testbench para el medio
-- medio sumador, a fin de analizar el funcionamiento de la entidad.
-- NOTAS:
-- *DUT-> Nombre de la instanciacion.
-- La instanciación se realiza por componente
-- ===========================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad del Testbench
entity Medio_Sumador_TB is
end entity;

--Arquitectura
architecture Testbench of Medio_Sumador_TB is
	-- Componente local del Testbench
	component Medio_Sumador
		port(
			X : in std_logic;
			Y : in std_logic;
			Salida : out std_logic;
			CarriSalida : out std_logic
		);
	end component;
	
	--Señales internas
	signal X_TB : std_logic := '0';
	signal Y_TB : std_logic := '0';
	signal Salida_TB : std_logic;
	signal CarriSalida_TB : std_logic;
	
	begin
	--Instanciacion de la entidad
	DUT : Medio_Sumador
		port map( --Mapeo de señales
			X => X_TB,
			Y => Y_TB,
			Salida => Salida_TB,
			CarriSalida => CarriSalida_TB
		);
		
	Estimulos: process --Estimulos
		begin
				X_TB <= '0'; Y_TB <= '0'; wait for 10 ns;
				X_TB <= '0'; Y_TB <= '1'; wait for 10 ns;
				X_TB <= '1'; Y_TB <= '0'; wait for 10 ns;
				X_TB <= '1'; Y_TB <= '1'; wait for 10 ns;
				wait;
				
		end process;
end Testbench; -- Fin del testbench