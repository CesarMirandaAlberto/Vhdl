-- ===========================================================================
-- 				***** TESTBENCH DE COMPUERTAS LOGICAS *****
-- 	Este código implementa el testbench de la entidad Compuertas Logicas a fin
--  de comprobar y analizar el correcto funcionamiento de la entidad.
-- ===========================================================================
   
--Inclusion de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Declaración de la entidad del testbench
entity Compuertas_Logicas_TB is
end entity;

-- Declaración de la entidad del testbench
architecture Testbench of Compuertas_Logicas_TB is
--Declaración del componente y su lista de puertos que tendrá el testbench en este caso la entidad que se verificará
	component Compuertas_Logicas
		port(
			X : in std_logic;
			Y : in std_logic;
			Sand : out std_logic;
			Sor : out std_logic;
			Snot: out std_logic;
			Snor: out std_logic;
			Snand: out std_logic;
			Sxor: out std_logic 
		);
	end component;

-- Señales que con las que trabajará el testbench (visualización en el waveform) acorde a la lista de puertos del componente 
	signal X: std_logic := '0';  --Inicialización de Señales
	signal Y: std_logic := '0';
	
	signal Sand : std_logic;
	signal Sor :  std_logic;
	signal Snot:  std_logic;
	signal Snor:  std_logic;
	signal Snand: std_logic;
	signal Sxor:  std_logic;
	
	begin
	--Instanciacion a la entidad principal (conectar los puertos de la entidad principal con las señales del Testbench)
	DUT: Compuertas_Logicas
		port map(
			X => X,
			Y => Y,
			Sand => Sand,
			Sor  => Sor,
			Snot => Snot,
			Snor => Snor,
			Snand => Snand,
			Sxor => Sxor
		);
	
	--Estimulacion de señales
	Estimulos: process
	
	begin
		X <= '0';
		y <= '0';
		wait for 10 ns;
		X <= '1';
		Y <= '0';
		wait for 10 ns; --Retardo entre estimulos
		X <= '0';
		Y <= '1';
		wait for 10 ns;
		X <= '1';
		Y <= '1';
		wait for 10 ns;
		wait;
	end process; --Fin de las estimulaciones
	
end Testbench;
	