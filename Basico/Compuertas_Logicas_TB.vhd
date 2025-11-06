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
	signal X_TB: std_logic := '0';  --Inicialización de Señales
	signal Y_TB: std_logic := '0';
	
	signal Sand_TB : std_logic;
	signal Sor_TB :  std_logic;
	signal Snot_TB:  std_logic;
	signal Snor_TB:  std_logic;
	signal Snand_TB: std_logic;
	signal Sxor_TB:  std_logic;
	
	begin
	--Instanciacion a la entidad principal (conectar los puertos de la entidad principal con las señales del Testbench)
	DUT: Compuertas_Logicas
		port map(
			X => X_TB,
			Y => Y_TB,
			Sand => Sand_TB,
			Sor  => Sor_TB,
			Snot => Snot_TB,
			Snor => Snor_TB,
			Snand => Snand_TB,
			Sxor => Sxor_TB
		);
	
	--Estimulacion de señales
	Estimulos: process
	
	begin
		X_TB <= '0';
		Y_TB <= '0';
		wait for 10 ns;
		X_TB <= '1';
		Y_TB <= '0';
		wait for 10 ns; --Retardo entre estimulos
		X_TB <= '0';
		Y_TB <= '1';
		wait for 10 ns;
		X_TB <= '1';
		Y_TB <= '1';
		wait for 10 ns;
		wait;
	end process; --Fin de las estimulaciones
	
end Testbench;