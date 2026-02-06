-- ===========================================================================================================
--						**** MODULO TOP HARDWARE FSM MÁQUINA EXPENDEDORA ****
--
--	El presente código implementa el desarrollo del módulo top Hardware de la máquina expendedora, este 
--	módulo es el encargado de enlazar los puertos del módulo top (rtl) con los pines físicos del FPGA.
--
--	Se hace instanciación directa del módulo top rtl.
-- ===========================================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad y lista de puertos
entity Top is
	port(
		CLK_50MHZ : in std_logic;
		RST : in std_logic;
		COMPRA : in std_logic;
		DINERO : in std_logic_vector(1 downto 0);
		ENTREGA : out std_logic;
		CAMBIO : out std_logic;
		HEX1 : out std_logic_vector(6 downto 0);
		HEX2 : out std_logic_vector(6 downto 0)
	);
end entity;

-- Arquitectura
architecture simple of Top is 

	begin
		-- INSTANCIACIÓN
		IMT : entity work.Modulo_Top
			port map( --MAPEO DE PUERTOS
				clk_TOP => CLK_50MHZ ,
				rst_TOP => RST,
				Moneda_TOP => DINERO,
				BComprar_TOP => COMPRA,
				Entrega_TOP => ENTREGA,
				Cambio_TOP => CAMBIO,
				Display_Unidades => HEX1,
				Display_Decenas => HEX2
			);
			
end simple; -- FIN DEL MÓDULO