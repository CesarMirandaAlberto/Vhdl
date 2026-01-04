-- ===============================================================================================
--						**** CONTADOR 0 a 10 CON ACARREO ****
--
--	El presente código implementa el diseño de un contador de 0 a 10 con acarreo, el diseño
--	consta de 2 entradas rst=  reset, clk = reloj, y 2 salidas = Carry, Q.
--	Se implementan señales auxiliares para generar los cambios en el contador y posteriormente
--	mediante asignamiento continuo estas señaes son asignadas a las salidas.
-- ===============================================================================================

-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad y lista de puertos
entity Contador10_Acarreo is
	port(
		rst : in std_logic;
		clk : in std_logic;
		Carry : out std_logic;
		Q : out std_logic_vector(3 downto 0)
	);
end entity;

-- Arquitectura
architecture Contador of Contador10_Acarreo is
		
		--Señales auxiliares
		signal Acarreo: std_logic := '0';
		signal QAX : unsigned (3 downto 0);
		
	begin
		process(rst, clk) begin -- Lista sensitiva
			if(rst = '1') then
				QAX <= (others => '0'); -- Reseteo de señales
				Acarreo <= '0';
			elsif rising_edge(clk) then
				
				if QAX = to_unsigned (9, QAX'length) then -- Si llego a 9 el contador
					QAX <= (others => '0'); -- Reinicio
					Acarreo <= '1'; -- Acarreo incrementa
				else
					QAX <= QAX + 1; -- Incrementa el contador
					Acarreo <= '0'; -- Acarreo es en cero
				end if;
			end if;
		end process; -- Fin de lista sensitiva
	
	Carry <= Acarreo; 
	Q <= std_logic_vector(QAX);
	
end Contador; -- Fin del contador
