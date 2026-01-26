-- ORDEN DE LOS FOCOS (LEDS) EN VECTORES
-- 0 VERDE
-- 1 AMARILLO
-- 2 ROJO
--
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM_Semaforo2V is
	port(
		clk : in std_logic;
		rst : in std_logic;
		FlagTiempo : in std_logic;
		EstadoSal : out integer range 0 to 3;
		SEMAFORO1 : out std_logic_vector(2 downto 0);
		SEMAFORO2 : out std_logic_vector(2 downto 0)
	);
end entity;

architecture FSM of FSM_Semaforo2V is
	
	--Estados de la FSM
	type Estado is (VERDE1, AMARILLO1, VERDE2, AMARILLO2);
	
	signal EActual, ESiguiente : Estado;
	
	signal parpadeo : std_logic := '0';
	signal contadorP : unsigned(0 downto 0) := (others=>'0');
	
	begin
		-- FLIP FLOP PARA ACTUALIZAR ESTADOS
		process(clk, rst) begin
			if(rst = '1') then
				EActual <= VERDE1;
			elsif rising_edge(clk) then
				EActual <= ESiguiente;
			end if;
		end process;
		
		-- ACTUALIZAR ESTADOS
		process(clk, FlagTiempo) begin
			ESiguiente <= EActual;
			
			case EActual is
				when VERDE1 =>
					if FlagTiempo = '1' then
						ESiguiente <= AMARILLO1;
					end if;
				when AMARILLO1 =>
					if FlagTiempo = '1' then
						ESiguiente <= VERDE2;
					end if;
					
				when VERDE2 =>
					if FlagTiempo = '1' then
						ESiguiente <= AMARILLO2;
					end if;
				when AMARILLO2 =>
					if FlagTiempo = '1' then
						ESiguiente <= VERDE1;
					end if;
			end case;
			
		end process;
		
		process(EActual, parpadeo) begin
			
			SEMAFORO1 <= "000";
			SEMAFORO2 <= "000";
		
			case EActual is 
			
				when VERDE1 =>
					SEMAFORO1 <= "001"; --VERDE
					SEMAFORO2 <= "100"; --ROJO
					
				when AMARILLO1 =>
					SEMAFORO1 <= "010";--AMARILLO
					SEMAFORO2 <= "100";--ROJO
					
				when VERDE2 =>
					SEMAFORO1 <= "100";
					SEMAFORO2 <= "001";
				
				when AMARILLO2 =>
					SEMAFORO1 <= "100";
					SEMAFORO2 <= "010";
			end case;
		end process;
	
		EstadoSal <= 
		0 when EActual = VERDE1 else
		1 when EActual = AMARILLO1 else
		2 when EActual = VERDE2 else
		3;
		
end FSM;