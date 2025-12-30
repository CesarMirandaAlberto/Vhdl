-- ===============================================================================================
-- **** FLIP FLOP REGISTRO EN SERIE SENSIBLE AL FLANCO DE SUBIDA Y RESET ASINCRONO  V2 ****
--	
--	EL presente código implementa el desarrollo de un flip flop que implementa registro 
--	en serie y que es sensible al flanco de subida con reset asincrono.
--	El diseño consta de 3 entradadas clk= pulso de reloj, rst=reset, D = datos y 1 salida
--	Q con un ancho de 4 bits.
--
--
-- ** Esta versión implementa el uso de la función shift_left para realizar el recorrimientos
--	de los bits **
--
--
--	EL registro de los datos se hace recorriendo los bits hacia la izquierda ej.
--	0000 registro 1 = 0001 registro 2 = 0010 etc.
--	** LISTA SENSITIVA **
--	La lista sensitiva consta de las dos señales que controlan el diseño clk y rst.
-- =====================================================================================

-- Inclusión de librerias 
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad y lista de puertos
entity FF_RSRAV2 is
	port(
		clk : in std_logic;
		rst : in std_logic;
		D : in std_logic;
		Q : out std_logic_vector (3 downto 0)
	);
end entity;

--Arquitectura
architecture Simple of FF_RSRAV2 is
	-- Señal auxiliar
	signal QAX : std_logic_vector(3 downto 0);
	
	begin	
	
		process(rst, clk) -- Lista
			begin
				if(rst = '1') then --reset de la señal 
					QAX <= (others => '0');
				elsif rising_edge(clk) then
					QAX <= std_logic_vector(shift_left(unsigned(QAX), 1)); --Desplaza los bits a la izquierda (1 solo bit)
					QAX (0)<= D;
				end if;
		end process; --Fin de lista sensitiva
	
	Q <= QAX; --Asignamiento continuo de señal auxiliar
	
end Simple; --Fin de la arquitectura