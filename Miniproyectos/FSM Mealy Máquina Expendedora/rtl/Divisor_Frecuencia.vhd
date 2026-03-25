-- ===============================================================================================
--								**** DIVISOR DE FRECUENCIA ****
--
--	El presente código implementa del diseño de un módulo divisor de frecuencia 
--	el cual genera un pulso de 1hz partiendo de un reloj de 50 Mhz.
--	El divisor tiene un reset el cual reinicial el contador y el pulso en estado bajo al ser accionado
--	en caso contrario en el flanco de subida de reloj incrementa el contador si este llego a su limite
--	se reinicia el mismo y se genera el pulso de 1hz en caso contrario el pulso se mantiene en 0 y 
--	continua incrementando el contador.
-- ===============================================================================================


-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad y Lista de puertos
entity Divisor_Frecuencia is
	generic(
		VMAXIMO : integer := 50_000_000 -- 5 PARA SIMULAR EN TESTBENCH
	);
	port(
		clk : in std_logic;
		rst : in std_logic;
		pulso : out std_logic
	);
end entity;

-- Arquitectrura 
architecture Divisor of  Divisor_Frecuencia is

	-- Entero para realizar el conteo
	signal Contador : integer range 0 to VMAXIMO-1 := 0;	
	
	begin
		process(clk, rst)
		begin
			if(rst = '1') then --Reset de señales
				Contador <= 0;
				pulso <= '0';
			elsif rising_edge(clk) then -- Genera pulso positivo
				if(Contador = VMAXIMO-1 ) then
					Contador <= 0;
					pulso <= '1';
				else
					Contador <= Contador + 1; --Incrementa el contador
					pulso <= '0';
				end if;
			end if;
		end process;

end Divisor; -- Fin del divisor.
