-- ===============================================================================================
--						**** ALGORITMO DOUBBLE DABBLE ****
--
--	El presente código implementa el diseño del algoritmo doubble dabble el cual consta de 
--	Entrada binaria de 8 bits 
--	3 salidas de 4 bits (Centenas, Decenas y Unidades)
-- ===============================================================================================

-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad y lista de puertos
entity DoubleDabble is
	port(
		X : in std_logic_vector(7 downto 0);
		Centenas : out std_logic_vector(3 downto 0);
		Decenas : out std_logic_vector(3 downto 0);
		Unidades : out std_logic_vector(3 downto 0)
	);
end entity;

-- Arquitectura
architecture ADD of DoubleDabble is
	
	begin	
	
		process(X) -- Lista sensitiva
			variable Desplazamiento : std_logic_vector(19 downto 0);
			-- 8 bits de entrada + 4 bits para cada unidad "Centenas, Decenas, Unidades" = 20 bits
			begin
				
				Desplazamiento := (others => '0'); --Inicializacion en 0
				Desplazamiento(7 downto 0) := X; -- Asingación de los primeros 8 bits (entrada)
				
				for i in 0 to 7 loop
					
					--Para corregir los bits si hay necesidad de
					if unsigned(Desplazamiento(11 downto 8)) >= 5 then --Si es mayor a 5
						Desplazamiento(11 downto 8) := std_logic_vector(unsigned(Desplazamiento(11 downto 8)) + 3);-- 
					end if;
					
					if unsigned(Desplazamiento(15 downto 12)) >= 5 then
						Desplazamiento(15 downto 12) := std_logic_vector(unsigned(Desplazamiento(15 downto 12)) + 3);
					end if;
					
					if unsigned(Desplazamiento(19 downto 16)) >= 5 then
						Desplazamiento(19 downto 16 ) := std_logic_vector(unsigned(Desplazamiento (19 downto 16)) + 3);
					end if;
					
					--Desplazamiento de los bits
					Desplazamiento := Desplazamiento(18 downto 0) & '0';
				end loop;
				--Asignación de bits correspondientes
				-- 7 a 0 valor original
				-- 8 a 11 Unidades
				-- 12 a 15 Decenas
				-- 16 a 19 Centenas
				Centenas <= Desplazamiento(19 downto 16);
				Decenas <= Desplazamiento(15 downto 12);
				Unidades <= Desplazamiento(11 downto 8);
				
		end process; -- Fin de la lista sensitiva
end ADD; -- Fin del algoritmo