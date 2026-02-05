-- ===========================================================================================================
--						**** FSM MÁQUINA EXPENDEDORA ****
--
--	El presente código implementa el desarrollo de una máquina de estados de 
--	tipo MELAY la cual tiene como finalidad la implementación de una máquina
--	expendedora.
--	
--	** !!ACERCA DEL CÓDIGO !! **
--
--	DEFINICIÓN DE ESTADOS:	Los estados de la FSM se defininen de tipo entero.
--
--	FLIP FLOP: Mediante un flip flop D sensible al flanco de subida de reloj
--			   se actualizan los estados de la FSM al mismo tiempo que se 
--			   resetean los mismos.
--
--	TRANSICIONES : Mediante una lista sensitiva y lógica combinacional se actualizan
--				   las trancisiones entre los estados, las señales que habilitan las
--				   trancisiones son acorde a la tabla y diagrama de estados.
--
--	SALIDAS : A través de una lista sensitiva se determina el estado de las salidas
--			  los elementos de la lista es el estado de la FSM y el boton de comprar
--			  por parte del usuario.
--
--	CONTEO DE DINERO : Mediante los estados de la FSM se lleva un control de la Moneda
--					   que se ingreso  y del dinero ingresado para posteriormente este valor 
--					   enviarlo al módulo del algoritmo double dabble.
--
-- ===========================================================================================================


--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Entidad y lista de puertos
entity FSM_Expendedora is
	port(
		clk : in std_logic;
		rst : in std_logic;
		Enable : in std_logic;
		Moneda : in std_logic_vector(1 downto 0);
		BComprar : in std_logic;
		Entrega : out std_logic;
		Cambio : out std_logic;
		DAcumulado : out std_logic_vector(7 downto 0)
	);
end entity;

-- Arquitectura de la FSM
architecture FSM of FSM_Expendedora is

	--DEFINICIÓN DE ESTADOS DE TIPO ENTERO
	type Estado is (S0, S5, S10, S15, S20);	
	
	signal EActual, ESiguiente : Estado;
	
	-- VALORES DE LAS MONEDAS
	constant CINCO : std_logic_vector(1 downto 0) := "01";
	constant DIEZ : std_logic_vector(1 downto 0) := "10";
	
	begin
	-- FLIP FLOP PARA ACTUALIZAR LOS ESTADOS
		process(clk, rst) begin
			if(rst = '1') then
				EActual <= S0;
			elsif rising_edge(clk) then
				EActual <= ESiguiente;
			end if;
		end process;
		
	-- TRANCISIONES
	process(EActual, Moneda, BComprar, Enable) begin
			ESiguiente <= EActual;
			
			if Enable = '0' then
				ESiguiente <= S0;
			else
				case EActual is 
					when S0 =>
						if Moneda = CINCO then
							ESiguiente <= S5;
						elsif Moneda = DIEZ then
							ESiguiente <= S10;
						else 
							ESiguiente <= S0;
						end if;
					when S5 =>
						if Moneda = CINCO then
							ESiguiente <= S10;
						elsif Moneda = DIEZ then
							ESiguiente <= S15;
						else 
							ESiguiente <= S5;
						end if;
					when S10 =>	
						if Moneda = CINCO then
							ESiguiente <= S15;
						elsif Moneda = DIEZ then
							ESiguiente <= S20;
						else 
							ESiguiente <= S10;
						end if;
					when S15 =>
						if BComprar = '1' then
							ESiguiente <= S0;
						else 
							ESiguiente <= S15;
						end if;
					when S20 =>
						if BComprar = '1' then
							ESiguiente <= S0;
						else 
							ESiguiente <= S20;
						end if;
					when others =>
						ESiguiente <= S0;
				end case;
			end if;
	end process;
	
	--SALIDAS
	process(EActual, BComprar) begin
		Cambio <= '0'; 
		Entrega <= '0';
		
		case EActual is
			when S15 =>
				if BComprar = '1' then
					Entrega <= '0'; --ENTREGA EL PRODUCTO
				else
					Entrega <= '1'; -- SE MANTIENE EN ESPERA DE ENTREGAR EL PRODUCTO
				end if;
				
			when S20 =>
				if BComprar = '1' then
					Entrega <= '1';	
					Cambio <= '0';
				else 
					Cambio <= '1'; --ENTREGA CAMBIO
				end if;
				
			when others =>
				null;
		end case;
	end process;
	
	--CONTEO DE DINERO
	process(EActual) begin
		case EActual is
			when S0 => DAcumulado <= "00000000";
			when S5 => DAcumulado <= "00000101";
			when S10 => DAcumulado <= "00001010";
			when S15 => DAcumulado <= "00001111";
			when S20 => DAcumulado <= "00010100";
			when others => DAcumulado <= "00000000";
		end case;
	end process;
	
end FSM;	-- Fin de la FSM