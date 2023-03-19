Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cont_57 is 
port 
(
   rst: IN std_logic;
   clk: IN std_logic;
   en:  IN std_logic;
   out_un: OUT std_logic_vector(3 downto 0);
   out_de: OUT std_logic_vector(3 downto 0)
);
end entity;

architecture cont57_arch of cont_57 is 
   component cont_10 is
   PORT
   (
      RST  : in std_logic;
      CLK  : in std_logic;
      Q    : out std_logic_vector(3 downto 0);
      EN   : in std_logic;
      CLR  : in std_logic;
      LD   : in std_logic;
      LOAD : in std_logic_vector(3 downto 0)
   );
   end component;
   
   signal rst_un, en_un, rst_de, en_de, ld: std_logic;
   signal out_un_internal: std_logic_vector(3 downto 0);
   signal out_de_internal: std_logic_vector(3 downto 0);
   
begin
   cont_un: cont_10
   port map
   (
      RST => '0',
      CLK => clk,
      Q   => out_un_internal,
      EN  => en_un,
      CLR => '0',
      LD  => ld,
      LOAD => "0010"
   );
   cont_de: cont_10
   port map
   (
      RST => '0',
      CLK => clk,
      Q   => out_de_internal,
      EN  => en_de,
      CLR => '0',
      LD  => ld,
      LOAD => "0001"
   );
   
   en_un <= '1' when en = '1' or ld = '1' else '0';
   en_de <= '1' when (en = '1' and (out_un_internal = "1001")) or (ld = '1') else '0';
   
   ld <= '1' when rst = '1' or (out_un_internal = "1001" and out_de_internal = "0110") else '0';
   
   out_un <= out_un_internal when ld /= '1' else "0010";
   out_de <= out_de_internal when ld /= '1' else "0001";

end architecture;