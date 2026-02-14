-- ===============================================================================================
--								**** MODULO TOP HARDWARE ****
--
--	El presente código implementa el desarrollo del módulo top a nivel hardware para conectar
--	los puertos del diseño del módulo top(rtl) con los pines físicos del FPGA.
--
-- ===============================================================================================

-- Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad y Lista de puertos	
entity Top is
	port(
		CLK_50MHZ : in std_logic;
		BTN_RST : in std_logic;
		BTN_AUMENTAR : in std_logic;
		BTN_DISMINUIR : in std_logic;
		SALIDA : out std_logic;
		DISPLAY_CENTENAS : out std_logic_vector (6 downto 0);
		DISPLAY_DECENAS : out std_logic_vector (6 downto 0);
		DISPLAY_UNIDADES : out std_logic_vector (6 downto 0)
	);
end entity;

-- Arquitectura
architecture simple of Top is

	begin
		
		-- Instanciaciones
		IMTRTL : entity work.Modulo_Top
			port map( -- Mapeo de señales
			 clk_top => CLK_50MHZ,
			 rst_top => BTN_RST,
			 Aumentar_top => BTN_AUMENTAR,
			 Disminuir_top => BTN_DISMINUIR,
			 Salida_PWMTop => SALIDA,
			 CentenasPwm => DISPLAY_CENTENAS,
			 DecenasPwm => DISPLAY_DECENAS,
			 UnidadesPwm => DISPLAY_UNIDADES
			);
end simple; -- Fin del diseño
