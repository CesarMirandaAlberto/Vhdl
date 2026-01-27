library IEEE;
use ieee.std_logic_1164.all;

entity Modulo_Top is
	port(
		clk : in std_logic;
		rst : in std_logic;
		SEMAFORO1 : out std_logic_vector(2 downto 0);
		SEMAFORO2 : out std_logic_vector(2 downto 0)
	);	
end entity;

architecture ModuloTFSM of Modulo_Top is
	
	--SEÑALES INTERNAS 
	signal clk_divisor : std_logic;
	signal FlagTime : std_logic;
	signal EstadosFSM : integer range 0 to 3;
	
	begin
		
		-- DIVISOR DE FRECUENCIA
		IDF : entity work.Divisor_Frecuencia
			port map(
				clk_entrada => clk,
				rst => rst,
				clk_salida => clk_divisor
			);
		
		--CONTADOR
		ICNT : entity work.Contador
			port map(
				clk => clk_divisor,
				rst => rst,
				Estado => EstadosFSM,
				FlagTiempo => FlagTime
			);
			
		-- MAQUINA DE ESTADOS
		IFSM : entity work.FSM_Semaforo2V
			port map(
				clk => clk_divisor,
				rst => rst,
				FlagTiempo => FlagTime,
				EstadoSal => EstadosFSM,
				SEMAFORO1 => SEMAFORO1,
				SEMAFORO2 => SEMAFORO2
			);
end ModuloTFSM;