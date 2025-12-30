-- ===============================================================================================
--						**** FLIP FLOP CON REGISTRO PARALELO	****
--
--	El presente código implementa el diseño de un módulo que implementa el registro de datos 
--	en paralelo implementando un flip flop D.
--	El registro de datos se realiza en el flanco de subida de la señal de reloj, se implementa
-- 	QAX como señal auxiliar para almacernar los datos y donde posteriormente mediante asignamiento
--	continuo es asignada a la salida Q.
--	El diseño consta de 3 entradas clk= reloj, rst = reset, D = Datos y una salida Q.
-- ===============================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

--Entidad y lista de puertos
entity FF_RegistroParalelo is
	port(
		clk : in std_logic;
		rst : in std_logic;
		D : in std_logic_vector(7 downto 0);
		Q : out std_logic_vector(7 downto 0)
	);
end entity;

--Arquitectura
architecture FF_RegistroPL of FF_RegistroParalelo is
	-- Señal auxiliar
	signal QAX : std_logic_vector(7 downto 0);
	
	begin
		process(rst, clk) begin --lista sensitiva con señal de reloj y reset
			if(rst = '1') then
				QAX <= (others => '0'); --reseteo
			elsif rising_edge(clk) then
				QAX <= D; -- registro
			end if;
		end process; -- fin de la lista sensitiva

	Q <= QAX; -- Asingamiento de señal a salida
	
end FF_RegistroPL; -- Fin del diseño