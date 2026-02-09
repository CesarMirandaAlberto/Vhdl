library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Divisor_Frecuencia is
	generic(
		VMAXIMO : integer := 50_000_000 -- 5 PARA SIMULAR EN TESTBENCH
	);
	port(
		clk : in std_logic;
		rst : in std_logic;
		pulso : out std_logic
	);
end entity;

architecture Divisor of  Divisor_Frecuencia is

	signal Contador : integer range 0 to VMAXIMO-1 := 0;	
	
	begin
		process(clk, rst)
		begin
			if(rst = '1') then
				Contador <= 0;
				pulso <= '0';
			elsif rising_edge(clk) then
				if(Contador = VMAXIMO-1 ) then
					Contador <= 0;
					pulso <= '1';
				else
					Contador <= Contador + 1;
					pulso <= '0';
				end if;
			end if;
		end process;

end Divisor;
