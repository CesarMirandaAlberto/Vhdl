-- ===============================================================================================
--								**** MODULO TOP PWM (RTL) ****
--
--	El presente código implementa el desarrollo del módulo top a nivel rtl del generador de PWM,
--	en este módulo se instancian y conectan todos los módulos necesarios para que funcione
--	el proyecto.
--	** NOTAS **
--		* Instanciación directa
--		IDF : Instanciación divisor de frecuencia
--		IPWM : Instanciación módulo PWM
--		IBA :  Instanciación presionar boton Aumentar
--		IBD :  Instanciación presionar boton Disminuir
--		IADD : Instanciación Algoritmo Double Dabble
--		IDDS1 : Instanciación Decoder a display siete segmentos 1
--
--	* ESPERA PARA EL RESET *
--	A través de un contador de 1hz se activa una flag la cual al activarse indica que puede iniciar
--	a funcionar el sistema, esto con el objetivo que si se activa el reset tenga un tiempo de espera 
--	para volver a detectar si el reset ha sido activado.
--	
--	* DUTY *
--	Partiendo del estado de la flga de inicio de sistema incrementa o decrementa el valor del duty 
--	acorde al boton presionado, al mismo tiempo que se reseta el valor del duty.
-- ===============================================================================================

-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad y Lista de puertos
entity Modulo_Top is
    port(
        clk_top      : in  std_logic;
        rst_top      : in  std_logic;
        Aumentar_top : in  std_logic;
        Disminuir_top: in  std_logic;
        Salida_PWMTop: out std_logic;
        CentenasPwm  : out std_logic_vector(6 downto 0);
        DecenasPwm   : out std_logic_vector(6 downto 0);
        UnidadesPwm  : out std_logic_vector(6 downto 0)
    );
end entity;

architecture rtl of Modulo_Top is

	-- SEÑALES INTERNAS PARA INSTANCIAR LOS MÓDULOS EXTERNOS
	
    -- DUTY
    signal DUTY : integer range 0 to 100 := 50;

    -- Double Dabble
    signal DutyBin : std_logic_vector(7 downto 0);
    signal BufferCentenas, BufferDecenas, BufferUnidades : std_logic_vector(3 downto 0);

    -- Tick del divisor
    signal PulsoDivisor : std_logic;

    -- Pulso de botones
    signal BAumentar, BDisminuir : std_logic;

	-- PARA ESPERA DE RESET
	signal Contador_Arranque : integer range 0 to 50_000_000 := 0;
	signal Flag_Sistema : std_logic := '0';

begin
	
		-- ESPERA PARA EL RESET
		process(clk_TOP, rst_TOP) begin
			
			if rst_TOP = '1' then
				Contador_Arranque <= 0;
				Flag_Sistema <= '0';
			elsif rising_edge(clk_TOP) then
				
				if Contador_Arranque < 1_000_000 then
					Contador_Arranque <= Contador_Arranque + 1;
					Flag_Sistema <= '0';
				else
					Flag_Sistema <= '1';
				end if;
			end if;
		end process;
		
    DutyBin <= std_logic_vector(to_unsigned(DUTY, 8));

    -- Divisor de frecuencia 1Hz
    IDF: entity work.Divisor_Frecuencia
        generic map(VMAXIMO => 50_000_000)
        port map(clk => clk_top, rst => rst_top, pulso => PulsoDivisor);

    -- PWM
    IPWM: entity work.Pwm
        generic map(RESOLUCION => 100)
        port map(clk => clk_top, rst => rst_top, dutyCy => DUTY, SalidaPwm => Salida_PWMTop);

    -- Presionar Botones
		-- Aumentar
    IBA: entity work.PresionarBoton
        generic map(FREQUENCIA_CLK => 50_000_000, TIEMPO_ESPERA => 10)
        port map(clk => clk_top, rst => rst_top, Boton => Aumentar_top, PulsoEstable => BAumentar);

		-- Disminuir
    IBD: entity work.PresionarBoton
        generic map(FREQUENCIA_CLK => 50_000_000, TIEMPO_ESPERA => 10)
        port map(clk => clk_top, rst => rst_top, Boton => Disminuir_top, PulsoEstable => BDisminuir);

    -- Double Dabble
    IADD: entity work.DoubleDabble
        port map(X => DutyBin, Centenas => BufferCentenas, Decenas => BufferDecenas, Unidades => BufferUnidades);

    -- DECODERS A DISPLAYS 7 SEGMENTOS CENTENAS, DECENAS Y UNIDADES
    IDDS1: entity work.DecoderBCD_7Seg port map(Binario => BufferCentenas, Decimal => CentenasPwm);
    IDDS2: entity work.DecoderBCD_7Seg port map(Binario => BufferDecenas, Decimal => DecenasPwm);
    IDDS3: entity work.DecoderBCD_7Seg port map(Binario => BufferUnidades, Decimal => UnidadesPwm);

    -- DUTY
    process(clk_top)
	begin
		if rising_edge(clk_top) then
			if rst_top = '1' then
				DUTY <= 0;

			elsif Flag_Sistema = '1' then
				if BAumentar = '1' then
					DUTY <= DUTY + 10; -- AUMENTA EL DUTY DE 10 EN 10 
				elsif BDisminuir = '1' then
					DUTY <= DUTY - 10; -- DISMINUYE EL DUTY DE 10 EN 10
				end if;
			end if;
		end if;
	end process; -- FIN DEL DUTY

	
end rtl; -- FIN DEL MÓDULO TOP

