-- ===========================================================================
-- 				***** TESTBENCH MULTIPLEXOR 4 A 1 *****
-- 	El presente código implementa el desarrollo del testbench para analizar el 
--  funcionamiento del Multiplexor4a1
--  Nota: DUT-> Nombre de la instanciación
-- ===========================================================================
--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Declaración de entidad
entity Multiplexor4a1_TB is
end entity;

--Declaración de la arquitectura
architecture Testbench of Multiplexor4a1_TB is
--Componente local y su lista de puertos
	component Multiplexor4a1
	port (
			A : in std_logic_vector(2 downto 0);
			B : in std_logic_vector(2 downto 0);
			C : in std_logic_vector(2 downto 0);
			D : in std_logic_vector(2 downto 0);
			Selector: in std_logic_vector(2 downto 0);
			Salida : out std_logic_vector(2 downto 0)
	);
	end component;
	--Señales locales del testbench
		signal  A : std_logic_vector(2 downto 0) := "010";
		signal	B : std_logic_vector(2 downto 0) := "011";
		signal	C : std_logic_vector(2 downto 0) := "100";
		signal	D : std_logic_vector(2 downto 0) := "101" ;
		signal	Selector: std_logic_vector(2 downto 0) := "000";
		signal	Salida :  std_logic_vector(2 downto 0);
	
	begin
	--instanciación de Multiplexor4a1
	DUT: Multiplexor4a1
		port map( --Mapeo de señales
			A => A,
			B => B,
			C => C,
			D => D,
			Selector => Selector,
			Salida => Salida
		);
		
	Estimulos: process --Estimulos
		begin
			Selector <= "000";
			wait for 10 ns; --retardos
			Selector <= "001";
			wait for 10 ns;
			Selector <= "010";
			wait for 10 ns;
			Selector <= "011";
			wait for 10 ns;
			Selector <= "100";
			wait for 10 ns;
			Selector <= "101";
			wait for 10 ns;
			wait;
			
	end process; --Fin de estimulos

end Testbench; --fin de la arquitectura