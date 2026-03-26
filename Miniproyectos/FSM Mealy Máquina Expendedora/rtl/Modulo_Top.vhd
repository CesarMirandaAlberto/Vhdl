-- ===========================================================================================================
--						**** MODULO TOP RTL FSM MÁQUINA EXPENDEDORA ****
--
--	El presente código implementa el desarrollo del módulo top a nivel rtl de la máquina de estados expendedora 
--	por lo que este módulo instancia y conecta los múltiples módulos requeridos.
--
--	** ESTRUCTURA DEL MÓDULO **
--		* Divisor_Frecuencia.vhd
--		* DecoderBCD_7Seg.vhd
--		* DoubleDabble.vhd
--		* PresionarBoton.vhd
--		* FSM_Expendedora.vhd
--
--	!! NOTA !! Deben de ser compilados todos los módulos de la estrucuta.
--
--	COMBINACIONES DE BOTONES :  A partir de los estados de los botones(monedas) se determina que moneda fue
--								la que ha sido ingresada.
--
--	ESPERA PARA EL RESET : Se genera un retardo de 1 seg para que se tome lectura del reset del FPGA.
--
-- ===========================================================================================================

-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad y lista de puertos
entity Modulo_Top is
	port(
		clk_TOP : in std_logic;
		rst_TOP : in std_logic;
		Moneda_TOP : in std_logic_vector(1 downto 0);
		BComprar_TOP : in std_logic;
		Entrega_TOP : out std_logic;
		Cambio_TOP : out std_logic;
		Display_Unidades : out std_logic_vector(6 downto 0);
		Display_Decenas : out std_logic_vector(6 downto 0)
	);
end entity;

--
architecture simple of Modulo_Top is 
	
	-- VARIABLES AUXILIARES PARA ALGORITMO DOUBLE DABBLE
	signal BinarioUnidades : std_logic_vector(3 downto 0);
	signal BinarioDecenas : std_logic_vector(3 downto 0);
	signal DineroAcum : std_logic_vector(7 downto 0);
	
	-- ELIMINAR REBOTES Y DETECTAR FLANCOS
	signal Moneda5 : std_logic;
	signal Moneda10 : std_logic;
	signal BComprar : std_logic;
	signal MONEDAS_SINREBOTE : std_logic_vector(1 downto 0);
	

	-- PARÁMETROS PARA EL CONTADOR FRECUENCIA DE RELOJ DEL FPGA
	signal FSM_Flag : std_logic := '0';
	signal Contador_Arranque : integer range 0 to 50_000_000 := 0;
	
	begin
	
		-- COMBINACIONES DE BOTONES
		MONEDAS_SINREBOTE <= "01" when Moneda5 = '1' else
						 "10" when Moneda10 = '1' else
						 "00";
		
		-- ESPERA PARA EL RESET
		process(clk_TOP, rst_TOP) begin
			
			if rst_TOP = '1' then
				Contador_Arranque <= 0;
				FSM_Flag <= '0';
			elsif rising_edge(clk_TOP) then
				
				if Contador_Arranque < 1_000_000 then
					Contador_Arranque <= Contador_Arranque + 1;
					FSM_Flag <= '0';
				else
					FSM_Flag <= '1';
				end if;
			end if;
		end process;
		
		-- PRESIONAR BOTON PARA LOS BOTONES DE LAS MONEDAS 
		
		-- MONEDA DE 5
		IPB5 : entity work.PresionarBoton
			generic map(FREQUENCIA_CLK => 50_000_000, TIEMPO_ESPERA => 10)
			port map(
				clk => clk_TOP,
				rst => rst_TOP,
				Boton => Moneda_TOP(0),
				PulsoEstable => Moneda5
			);
		
		-- MONEDA DE 10
		IPB10 : entity work.PresionarBoton
			generic map(FREQUENCIA_CLK => 50_000_000, TIEMPO_ESPERA => 10)
			port map(
				clk => clk_TOP,
				rst => rst_TOP,
				Boton => Moneda_TOP(1),
				PulsoEstable => Moneda10
			);
		
		-- PresionarBoton.vhd
		IPBC : entity work.PresionarBoton
			generic map(FREQUENCIA_CLK => 50_000_000, TIEMPO_ESPERA => 10)
			port map(
				clk => clk_TOP,
				rst => rst_TOP,
				Boton => BComprar_TOP,
				PulsoEstable => BComprar
			);
		-- MÁQUINA DE ESTADOS
		IFSM : entity work.FSM_Expendedora
			port map(
				clk => clk_TOP,
				rst => rst_TOP,
				Enable => FSM_Flag,
				Moneda => MONEDAS_SINREBOTE, 
				BComprar => BComprar,
				Entrega => Entrega_TOP,
				Cambio => Cambio_TOP,
				DAcumulado => DineroAcum
			);
		-- ALGORITMO DOUBLE DABBLE
		IDD : entity work.DoubleDabble
			port map(
			X => DineroAcum,
			Decenas => 	BinarioDecenas,
			Unidades => BinarioUnidades
			);

		-- DECODIFICADOR 1 Y 2
		IDBCD : entity work.DecoderBCD_7Seg
			port map(
				Binario => BinarioDecenas,
				Decimal => Display_Decenas
			);
			
		IDBCD2 : entity work.DecoderBCD_7Seg
			port map(
				Binario => BinarioUnidades,
				Decimal => Display_Unidades
			);
			
end simple; -- Fin de la FSM