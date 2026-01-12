library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Divisor_Frecuencia is
	port(
		clk_Entrada : in std_logic;
		rst : in std_logic;
		clk_Salida : out std_logic
	);
end entity;

architecture Divisor of  Divisor_Frecuencia is

	constant VMaximo : integer := 25_000_000;
	--constant VMaximo : integer := 10; -- VALOR PARA LA SIMULACION EN EL TESTBENCH
	signal Contador : unsigned(24 downto 0) := (others => '0');
	signal AuxSalida : std_logic := '0';
	
begin
	process(clk_Entrada, rst)
	begin
		if(rst = '1') then
			Contador <= (others => '0');
			AuxSalida <= '0';
		elsif rising_edge(clk_Entrada) then
			if(Contador = VMaximo-1 ) then
				Contador <= (others => '0');
				AuxSalida <= not AuxSalida;
			else
				Contador <= Contador + 1;
			end if;
		end if;
	end process;

	clk_Salida <= not AuxSalida;
	
end Divisor;
