Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bcd_2_ssd is
PORT
   (
      bcd   : IN std_logic_vector(3 downto 0);
      point : IN std_logic;
      ssd   : OUT std_logic_vector(7 downto 0)
   );
end entity;

architecture bcd_2_ssd_arch of bcd_2_ssd is 
  
  signal in_ssd: std_logic_vector(6 downto 0);

  begin

   in_ssd <= "0000001" when bcd = "0000" else 
            "1001111" when bcd = "0001" else 
            "0010010" when bcd = "0010" else 
            "0000110" when bcd = "0011" else 
            "1001100" when bcd = "0100" else 
            "0100100" when bcd = "0101" else 
            "0100000" when bcd = "0110" else 
            "0001111" when bcd = "0111" else 
            "0000000" when bcd = "1000" else 
            "0000100" when bcd = "1001" else 
            "1111111";

    ssd(7 downto 1) <= in_ssd;
    ssd(0) <= point;
end architecture;