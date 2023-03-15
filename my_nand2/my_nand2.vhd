library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity my_nand2 is 
   port(
      a: IN  std_logic;
      b: IN  std_logic;
      c: OUT std_logic
   );
end entity;

architecture my_nand2_arch of my_nand2 is
-- Regiao declarativa

begin
   c <= not (a and b);

end architecture;