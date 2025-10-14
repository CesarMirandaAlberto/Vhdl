-- ===========================================================================
--						***** TESTBENCH DEMULTIPLEXOR 2 A 1 *****
--	Este codigo VHDL implementa el testbench para verificar y analizar el 
--  funcionamiento del demultiplexor 2 a 1.
--  Notas: DUT -> Nombre de la instanciación
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
			signal X : std_logic := '1';
			signal Selector:  std_logic_vector(1 downto 0) := "00";
			signal Salida1 :  std_logic := '0';
			signal Salida2 :  std_logic := '0';
	
	begin
--Instanciación del demultiplexor	
	DUT: Demultiplexor2a1
--Mapeo de señales
		port map(
			X => X,
			Selector => Selector,
			Salida1 => Salida1,
			Salida2 => Salida2
		);
--Aplicación de estimulos		
		Estimulos: process
	
			begin
				Selector <= "01";
				wait for 10 ns; --Retardos
				Selector <= "10";
				wait for 10 ns; 
				Selector <= "11";
				wait for 10 ns;
				Selector <= "00";
				wait for 10 ns;
				wait;
				
			end process; --Fin de estimulos
			
end Testbench;