library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Calculadora4Bits_TB is
end entity;

architecture Testbench of Calculadora4Bits_TB is
	
		signal X_TB : std_logic_vector(3 downto 0);
		signal Y_TB:  std_logic_vector(3 downto 0);
		signal Selector_TB : std_logic_vector(1 downto 0);
		-- SALIDAS
		signal DisplayEntradaX_TB : std_logic_vector(6 downto 0);
		signal DisplayEntradaY_TB :  std_logic_vector(6 downto 0);
		signal DisplayUnidades_TB :  std_logic_vector(6 downto 0);
		signal DisplayDecenas_TB :   std_logic_vector(6 downto 0);
		signal DisplayCentenas_TB :  std_logic_vector(6 downto 0);
		
	begin
	
		DUT : entity work.Calculadora4Bits
			port map(
				X_Top => X_TB,
				Y_Top => Y_TB,
				Selector => Selector_TB,
				DisplayEntradax => DisplayEntradaX_TB,
				DisplayEntradaY => DisplayEntradaY_TB,
				DisplayUnidades => DisplayUnidades_TB,
				DisplayDecenas => DisplayDecenas_TB,
				DisplayCentenas => DisplayCentenas_TB
			);
		
		
		ESTIMULOS : process
		begin
				--CASOS DIRIGIDOS
				for sel in 0 to 2 loop
					Selector_TB <= std_logic_vector(to_unsigned(sel,2));
				
				 for i in 0 to 15 loop
						for j in 0 to 15 loop
							X_TB <= std_logic_vector(to_unsigned(i,4));
							Y_TB <= std_logic_vector(to_unsigned(j,4));
							
							wait for 20 ns;
						end loop;
				 end loop;
				end loop;
				report "Simulacion finalizada" severity note;
				wait;
		end process;
		
		
end Testbench;
