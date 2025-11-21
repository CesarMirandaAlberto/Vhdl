-- ===========================================================================
-- 				***** TESTBENCH MULTIPLEXOR 2 A 1 *****
-- 	El presente código implementa el desarrollo del testbench para analizar el
--  funcionamiento del Multiplexor2a1 
--  Nota: DUT-> Nombre de la instanciación
--  Para la instanciación se hace mediante componente
-- ===========================================================================
-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Declaración de la entidad
entity Multiplexor2a1_TB is
end entity;

--Declaración de arquitectura
architecture Testbench of Multiplexor2a1_TB is
--Componente local con lista de puertos
	component Multiplexor2a1
		port(
		X : in std_logic;
		Y : in std_logic;
		Selector : in std_logic_vector(1 downto 0);
		Salida : out std_logic
		);
	end component;
	--Señales locales para el testbench
		signal  X_TB : std_logic := '0';
		signal Y_TB : std_logic := '0';
		signal Selector_TB : std_logic_vector(1 downto 0) :="00";
		signal Salida_TB : std_logic;
		
	begin
	--Instanciación del Multiplexor2a1
		DUT: Multiplexor2a1
		port map( -- Mapeo de señakes
			X => X_TB,
			Y => Y_TB,
			Selector => Selector_TB,
			Salida => Salida_TB
		);
		
	Estimulos: process --Inicio de estimulos a las señales
	
		begin
		
			X_TB <= '1';
			Y_TB <= '0';
			
			Selector_TB <="00"; 
			wait for 10 ns; 
			Selector_TB <= "01"; 
			wait for 10 ns;
			Selector_TB <="10";
			wait for 10 ns;
			Selector_TB <= "11"; 
			wait for 10 ns;
			wait;
			
		end process; --Fin de los estimulos
		
end Testbench; --Fin de la arquitectura