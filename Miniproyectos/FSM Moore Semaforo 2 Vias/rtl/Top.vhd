-- ===============================================================================================
--								**** FSM SEMAFORO 2 VIAS MODULO TOP HARDWARE ****
--
--	El presente código vhdl implementa el diseño del módulo top para nivel hardware el cual genera
--	la conexión entre los puertos del diseño del módulo top a nivel rtl y los pines físicos del
--	FPGA.
--	Se instancia unicamente el módulo top a nivel rtl.
--	** NOTAS **
--		Instanciación : directa.
--		IMTRTL : Instanciación  módulo top a nivel RTL.
-- ===============================================================================================


--Inclusión de librerias
library IEEE;
use ieee.std_logic_1164.all;

-- Entidad y lista de puertos
entity Top is 
	port(
		CLK_50MHZ : in std_logic;
		BRST : in std_logic;
		S1 : out std_logic_vector(2 downto 0);
		S2 : out std_logic_vector(2 downto 0)
		);
end entity;

--Arquitectura
architecture simple of Top is
	
 begin
	-- Instanciación
	IMTRTL : entity work.Modulo_Top
		port map(
			clk_top => CLK_50MHZ,
			rst => BRST,
			SEMAFORO1 => S1,
			SEMAFORO2 => S2
		);
		
		
end simple; -- Fin del módulo