-- ===============================================================================================
--										**** FSM SEMAFORO 2 VIAS ****
--
--	El presente código implementa el desarrollo de una máquina de estados finitos aplicada a 
--	un semaforo de 2 vias. El diseño consta de 3 entradas clk, rst, FlagTiempo y 3 SALIDAS
--	1 salida con ancho de 4 bits y 2 salidas con ancho de 3 bits.
--	FlagTiempo : 
--		Determina si el tiempo del estado X se ha cumplido y puede avanzar al siguiente.
--	FLIP FLOP:
--		Se implementa un flip flop D sensible al flanco de subida de reloj para actualizar los
--		estados o para resetear los mismos.
--
--	ACTUALIZAR ESTADOS: 
--		Se implementa una lista sensitiva con el pulso de reloj y FlagTiempo el cual evalua el 
--		estado actual y si FlagTiempo esta activa se cambia al siguiente estado.
--
--	SALIDAS :
--		Asigna el "color" del semaforo (salidas) acorde al estado de la FSM mediante una lista 
--		sensitiva.
-- ===============================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--Entidad y Lista de puertos
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
--Arquitectura de la FSM
architecture FSM of FSM_Semaforo2V is
	
	--Estados de la FSM
	type Estado is (VERDE1, AMARILLO1, VERDE2, AMARILLO2);
	
	signal EActual, ESiguiente : Estado;
	
	begin
		-- FLIP FLOP PARA ACTUALIZAR ESTADOS
		process(clk, rst) begin
			if(rst = '1') then
				EActual <= VERDE1;
			elsif rising_edge(clk) then
				if FlagTiempo = '1' then
					EActual <= ESiguiente;
				end if;
			end if;
		end process;
		
		-- ACTUALIZAR ESTADOS
		process(EActual) begin
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
		
		process(EActual) begin
			
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
	
	-- Asignación de estados a las salidas.
		EstadoSal <= 
		0 when EActual = VERDE1 else
		1 when EActual = AMARILLO1 else
		2 when EActual = VERDE2 else
		3;
		
end FSM; -- Fin de la arquitectura