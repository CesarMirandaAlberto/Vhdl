-- ===============================================================================================
--						**** CONTADOR TIEMPO ****
--
--	El presente código implementa el diseño de un contador el cual se implementará en la máquina
--	de estados de 2 vias. El contador tendrá 2 limites de tiempo diferentes uno para verde y otro
--	para amarillo, por lo cual mediante un case el cual evaluará el estado en que se encuentra la
--	FSM determinará el límite de tiempo del contador. El conteo se realiza en el flanco de subida
--	de reloj.
-- ===============================================================================================

--Inclusión 
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Contador is
	port(
		clk : in std_logic;
		rst : in std_logic;
		Estado : in integer range 0 to 3;
		FlagTiempo : out std_logic
	);
end entity;

architecture simple of Contador is
	
	signal Cuenta : integer := 0;
	signal Limite : integer := 10;
	
	begin
		process (clk, rst) begin
			if rst = '1' then
				Cuenta <= 0;
				Limite <= 10;
				FlagTiempo <= '0';
				
			elsif rising_edge(clk) then
			
				case Estado is
					when 0 => Limite <= 10; --VERDE1
					when 1 => Limite <= 4; --AMARILLO1
					when 2 => Limite <= 10; --VERDE2
					when 3 => Limite <= 4; --AMARILLO1
					when others => Limite <= 10;
				end case;
				
				-- Contador
				if Cuenta = Limite - 1 then
					FlagTiempo <= '1';
					Cuenta <= 0; --Reinicio
				else
					FlagTiempo <= '0';
					Cuenta <= Cuenta + 1;
				end if;	
			end if;
		end process;
	
end simple;