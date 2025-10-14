-- ===========================================================================
-- 				***** 	TESTBENCH DEMULTIPLEXOR 4 A 1 *****
-- 	El presente código implementa el desarrollo del testbench para analizar 
--  funcionamiento del multiplexor 1 a 4.
--  DUT: Nombre de la instanciación a la entidad del demultiplexor
-- ===========================================================================
--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Declaración de la entidad
entity Demultiplexor4a1_TB is
end entity;

--Declaración de la arquitectura
architecture Testbench of Demultiplexor4a1_TB is
-- Declaración de componente local y lista de puertos
	component Demultiplexor4a1
		port(
			X : in std_logic_vector(3 downto 0);
			Selector : in std_logic_vector(3 downto 0);
			Salida1 : out std_logic_vector(3 downto 0);
			Salida2 : out std_logic_vector(3 downto 0);
			Salida3 : out std_logic_vector(3 downto 0);
			Salida4 : out std_logic_vector(3 downto 0)
		);
	end component;
--Señales locales del testbench	
			signal X :  std_logic_vector(3 downto 0) := "1010";
			signal Selector : std_logic_vector(3 downto 0) := "0000";
			
			signal Salida1 :  std_logic_vector(3 downto 0);
			signal Salida2 :  std_logic_vector(3 downto 0);
			signal Salida3 :  std_logic_vector(3 downto 0);
			signal Salida4 :  std_logic_vector(3 downto 0);
	
	begin
		DUT: Demultiplexor4a1 --Instanciación de la entidad del demultiplexor
			port map ( --Mapeo de señales
				X => X,
				Selector => selector,
				Salida1 => Salida1,
				Salida2 => Salida2,
				Salida3 => Salida3,
				Salida4 => Salida4
			);
			
	Estimulos: process --Estimulos de las señales
		begin
				Selector <= "0000"; --Asignación de valores
				wait for 10 ns; -- Retardos
				Selector <= "0001";
				wait for 10 ns;
				Selector <= "0010";
				wait for 10 ns;
				Selector <= "0011";
				wait for 10 ns;
				Selector <= "0100";
				wait for 10 ns;
				Selector <= "0101";
				wait for 10 ns;
				wait;
		end process;-- Fin del proceso de estimulos
end Testbench; --Fin de la arquitectura