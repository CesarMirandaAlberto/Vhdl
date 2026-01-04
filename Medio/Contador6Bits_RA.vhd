-- ===============================================================================================
--						**** CONTADOR 6 bits CON RESET ASINCRÓNICO ****
--
--	El presente código implementa el diseño de un contador de 6 bits el cual en cada flanco de 
--	subida incrementa la cuenta mientras que si el reset es en estado alto se resetea el contador,
--	se implementa una señal auxiliar QAX para realizar los registros de la señal y posteriormente
--	mediante asignamiento continuo esta señal auxiliar es asignada a la salida del diseño.
-- ===============================================================================================

-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad y lista de puertos
entity Contador6Bits_RA is
	port(
		clk : in std_logic;
		rst : in std_logic;
		Q : out std_logic_vector(5 downto 0)
	);	
end entity;

-- Arquitectura
architecture Contador of Contador6Bits_RA is 
	--Señal auxiliar
	signal QAX : unsigned (5 downto 0);
	
 begin
 
	process(rst, clk) begin	-- Lista sensitiva
		if(rst='1') then
			QAX <= (others => '0'); -- Reseteo de señales
		elsif rising_edge(clk) then
			QAX <= QAX +1; -- Incrementa el contador
		end if;
	end process; -- Fin de la lista sensitiva
	
	Q <= std_logic_vector(QAX); 
	
end Contador; -- Fin del contador