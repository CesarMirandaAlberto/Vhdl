-- ===========================================================================
-- 				***** TESTBENCH MULTIPLEXOR 2 A 1 *****
-- 	El presente código implementa el desarrollo del testbench para analizar el
--  funcionamiento del Multiplexor2a1 
--  Nota: DUT-> Nombre de la instanciación
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
		signal  X : std_logic := '0';
		signal Y : std_logic := '0';
		signal Selector : std_logic_vector(1 downto 0) :="00";
		signal Salida : std_logic;
		
	begin
	--Instanciación del Multiplexor2a1
		DUT: Multiplexor2a1
		port map( -- Mapeo de señakes
			X => X,
			Y => Y,
			Selector => Selector,
			Salida => Salida
		);
		
	Estimulos: process --Inicio de estimulos a las señales
	
		begin
			Selector <="00"; --Asignación de valores
			wait for 10 ns; --Retardo entre estimulos
			Selector <= "01"; 
			wait for 10 ns;
			Selector <="10";
			wait for 10 ns;
			Selector <= "11"; 
			wait for 10 ns;
			wait;
			
		end process; --Fin de los estimulos
		
end Testbench; --Fin de la arquitectura