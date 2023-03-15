library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_my_nand2 is 
end entity;



architecture tb_my_nand2_arch of tb_my_nand2 is
   
   component my_nand2 is 
      port(
         a: IN  std_logic;
         b: IN  std_logic;
         c: OUT std_logic
      );
   end component;

   signal a: std_logic;
   signal b1: std_logic;
   signal c: std_logic;
begin
   -- Instancia do DUT (Device Under Test) ou SUT (System Under Test)
   DUT: my_nand2
   port map
   (
      a => a,
      b => b1,
      c => c
   );
   
   process
   begin
      a  <= '0';
      b1 <= '0';
      wait for 10 ns;
      a  <= '0';
      b1 <= '1';
      wait for 10 ns;
      a  <= '1';
      b1 <= '0';
      wait for 10 ns;
      a  <= '1';
      b1 <= '1';
      wait for 10 ns;
   end process;

end architecture;