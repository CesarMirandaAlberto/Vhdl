-- ===============================================================================================
--						**** MÓDULO TOP (HARDWARE) CALCULADORA 4 BITS ****
--
--	El presente código implementa el desarrollo del módulo top a nivel hardware para la calculadora 
--	de 4 bits.
--	El propósito del módulo es conectar los puertos con los pines físicos del FPGA.
--
--	** NOTAS **
--	Instanciación directa
--	ICC4 : Instanciación Calculadora Completa 4 bits
--
-- ===============================================================================================

--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad y Lista de puertos
entity Top is
	port(
		X_TOP : in std_logic_vector(3 downto 0);
		Y_TOP : in std_logic_vector(3 downto 0);
		SELECTOR_TOP : in std_logic_vector(1 downto 0);
		-- SALIDAS
		DISPLAYX : out std_logic_vector(6 downto 0);
		DISPLAYY : out std_logic_vector(6 downto 0);
		RESULTADO_UNIDADES : out std_logic_vector(6 downto 0);
		RESULTADO_DECENAS : out std_logic_vector(6 downto 0);
		RESULTADO_CENTENAS : out std_logic_vector(6 downto 0)
	);
end entity;

--Arquitecturra
architecture simple of Top is

	begin
	
		--Instanciación
		ICC4 : entity work.Calculadora4Bits
			port map(
				X_Top => X_TOP,
				Y_Top => Y_TOP,
				Selector => SELECTOR_TOP,
				DisplayEntradaX => DISPLAYX,
				DisplayEntradaY => DISPLAYY,
				DisplayUnidades => RESULTADO_UNIDADES,
				DisplayDecenas => RESULTADO_DECENAS,
				DisplayCentenas => RESULTADO_CENTENAS
			);
			
end simple; --Fin del módulo