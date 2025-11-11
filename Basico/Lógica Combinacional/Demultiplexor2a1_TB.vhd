-- ===========================================================================
--						***** TESTBENCH DEMULTIPLEXOR 2 A 1 *****
--	Este codigo VHDL implementa el testbench para verificar y analizar el 
--  funcionamiento del demultiplexor 2 a 1.
--  Notas: DUT -> Nombre de la instanciación
--  La instanciación de la entidad se realiza por componente.
-- ===========================================================================
--Inclusion de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Declaración de entidad del testbench
entity Demultiplexor2a1_TB is
end entity;

--Declaración de la arquitectura
architecture Testbench of Demultiplexor2a1_TB is

--Definición del componente (entidad) a verificar de forma local 
	component Demultiplexor2a1
		port(
				X : in std_logic;
				Selector: in std_logic_vector(1 downto 0);
				Salida1 : out std_logic;
				Salida2 : out std_logic
		);
	end component;
--Señales locales con las que trabajará el testbench 
			signal X_TB : std_logic := '1';
			signal Selector_TB:  std_logic_vector(1 downto 0) := "00";
			signal Salida1_TB :  std_logic := '0';
			signal Salida2_TB :  std_logic := '0';
	
	begin
--Instanciación del demultiplexor	
	DUT: Demultiplexor2a1
--Mapeo de señales
		port map(
			X => X_TB,
			Selector => Selector_TB,
			Salida1 => Salida1_TB,
			Salida2 => Salida2_TB
		);
--Aplicación de estimulos		
		Estimulos: process
	
			begin
				Selector_TB <= "01";
				wait for 10 ns; --Retardos
				Selector_TB <= "10";
				wait for 10 ns; 
				Selector_TB <= "11";
				wait for 10 ns;
				Selector_TB <= "00";
				wait for 10 ns;
				wait;
				
			end process; --Fin de estimulos
			
end Testbench;