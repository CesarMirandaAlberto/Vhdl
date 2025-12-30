-- =====================================================================================
-- **** FLIP FLOP REGISTRO EN SERIE SENSIBLE AL FLANCO DE SUBIDA Y RESET ASINCRONO ****
--
--	EL presente código implementa el desarrollo de un flip flop que implementa registro 
--	en serie y que es sensible al flanco de subida con reset asincrono.
--	El diseño consta de 3 entradadas clk= pulso de reloj, rst=reset, D = datos y 1 salida
--	Q con un ancho de 4 bits.
--	EL registro de los datos se hace recorriendo los bits hacia la izquierda ej.
--	0000 registro 1 = 0001 registro 2 = 0010 etc.
--	** LISTA SENSITIVA **
--	La lista sensitiva consta de las dos señales que controlan el diseño clk y rst.
-- =====================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad y lista de puertos
entity FF_RSRA is
	port(
		clk : in std_logic;
		rst : in std_logic;
		D : in std_logic;
		Q : out std_logic_vector(3 downto 0)
	);
end entity;

--Arquitectura
architecture FF_RegistroS of FF_RSRA is
	
	signal QAX : std_logic_vector(3 downto 0); --Señal auxiliar para manejar los cambios
	begin
			--Lista sensitiva
			process(rst, clk)
			begin
				if(rst= '1') then --Reseteo de valores de la salida
					QAX <= (others => '0'); 
				elsif rising_edge(clk) then --Registro de los bits en serie
					QAX(0) <= D;
					QAX(3 downto 1) <= QAX(2 downto  0);
					
				end if;	
			end process; --Fin de la lista sensitiva
	
	Q <= QAX; --Asignamiento de señal auxiliar a la salida Q
end FF_RegistroS; -- Fin de la arquitectura