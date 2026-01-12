-- ===============================================================================================
--						**** MINIMEMORIA 16 LOCALIDADES ****
--
--	El presente código implementa el diseño de una minimemoria de 16 localidades con una 
--	longitud de 2 bits cada una.
--	El diseño consta de 5 entradas, clk = reloj, rst = reset, wre= habilitar escritura,
--	DEentrada = Dato de entrada, Direcion = Direcion del dato, y 1 salida DSalida = Dato
--	de salida. El diseño actua bajo el flanco de subida de reloj al igual que el reset de 
--	los datos que se hace en estado alto "1".
-- ===============================================================================================

-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad y lista de puertos
entity Mini_Memoria is
	port(
		clk : in std_logic;
		rst : in std_logic;
		wre : in std_logic;
		DEentrada : in  std_logic_vector (1 downto 0);
		Direcion : in std_logic_vector(3 downto 0);
		DSalida : out std_logic_vector (1 downto 0)
	);
end Mini_Memoria;

-- Arquitectura
architecture MMemoria of Mini_Memoria is
	
	-- Definición de señales auxiliares
	type LocalidadMemoria is array (0 to 15) of std_logic_vector(1 downto 0); --tipo de dato para almacenar 2 bits
	signal memoria : LocalidadMemoria := (others => (others => '0')); --localidades de memoria
	 
	begin
		process(rst, clk) -- Lista sensitiva
		begin
			if(rst = '1') then
				memoria <= (others => (others => '0')); --llena el arreglo de 0
				DSalida <= (others => '0'); --asigna 0 a la salida
			
			elsif rising_edge(clk) then
			
				--Habilitacion de escritura
				if (wre = '1') then
					memoria(to_integer(unsigned(Direcion))) <= DEentrada; --Castear a entero la direccion del dato de entrada		
				end if;
		end if;	
				DSalida <= memoria(to_integer(unsigned(Direcion))); -- Castear la direccion de memoria a entero al dato de salida le pasa su direccion de memoria
		end process;
end MMemoria;-- Fin de la Arquitectura