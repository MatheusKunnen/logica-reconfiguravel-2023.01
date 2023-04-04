Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cronometro is
   port 
   (
        clk:  IN std_logic;
        rst:  IN std_logic;
       stst:  IN std_logic;
         en:  IN std_logic;
      out_3: OUT std_logic_vector(7 downto 0);
      out_2: OUT std_logic_vector(7 downto 0);
      out_1: OUT std_logic_vector(7 downto 0);
      out_0: OUT std_logic_vector(7 downto 0)
   );
end entity;

architecture cronometro_arch of cronometro is 

   component cont_10 is
      PORT
         (
           RST  : in std_logic;
           CLK  : in std_logic;
           Q    : out std_logic_vector(3 downto 0);
           EN   : in std_logic;
           CLR  : in std_logic
         );
   end component;
   
   component bcd_2_ssd is
      PORT
         (
            bcd   : IN std_logic_vector(3 downto 0);
            point : IN std_logic;
            ssd   : OUT std_logic_vector(7 downto 0)
         );
   end component;
   
   component DIVISOR is
      port	(
         CLK: in std_logic;
         RST: in std_logic;
         DIV50: out std_logic
      );	 
   end component;
   
   signal clr: std_logic := '0';
   signal running: std_logic := '1';
   signal max_reached: std_logic := '0';
   signal internal_en: std_logic := '0';
   signal clk_en: std_logic;
   
   signal cont_out_3: std_logic_vector(3 downto 0);
   signal cont_out_2: std_logic_vector(3 downto 0);
   signal cont_out_1: std_logic_vector(3 downto 0);
   signal cont_out_0: std_logic_vector(3 downto 0);
   
   signal ssd_out_3: std_logic_vector(7 downto 0);
   signal ssd_out_2: std_logic_vector(7 downto 0);
   signal ssd_out_1: std_logic_vector(7 downto 0);
   signal ssd_out_0: std_logic_vector(7 downto 0);
   
   signal en_cont_3: std_logic;
   signal en_cont_2: std_logic;
   signal en_cont_1: std_logic;
   signal en_cont_0: std_logic;
   
begin
   
   clr <= rst;
   max_reached <= '1' when cont_out_3 = x"5" and cont_out_2 = x"9" and cont_out_1 = x"9" and cont_out_0 = x"9" else '0';
   internal_en <= '1' when en = '1' and running = '1' and max_reached = '0' and clk_en = '1' else '0';
   
   en_cont_3 <= '1' when internal_en = '1' and (cont_out_2 = x"9") and (cont_out_1 = x"9") and (cont_out_0 = x"9") else '0';		
   en_cont_2 <= '1' when internal_en = '1' and (cont_out_1 = x"9") and (cont_out_0 = x"9") else '0';		
   en_cont_1 <= '1' when internal_en = '1' and (cont_out_0 = "1001") else '0';		
   en_cont_0 <= internal_en;
   
   out_3 <= ssd_out_3;
   out_2 <= ssd_out_2;
   out_1 <= ssd_out_1;
   out_0 <= ssd_out_0;
   
   div: DIVISOR
   port map
   (
      CLK => clk,
      RST => rst,
      DIV50 => clk_en
   );
   
   cont_3: cont_10
   port map
   (
      RST => rst,
      CLK => clk,
      Q   => cont_out_3,
      EN  => en_cont_3,
      CLR => clr
   );
   
   cont_2: cont_10
   port map
   (
      RST => rst,
      CLK => clk,
      Q   => cont_out_2,
      EN  => en_cont_2,
      CLR => clr
   );
   
   cont_1: cont_10
   port map
   (
      RST => rst,
      CLK => clk,
      Q   => cont_out_1,
      EN  => en_cont_1,
      CLR => clr
   );
   
   cont_0: cont_10
   port map
   (
      RST => rst,
      CLK => clk,
      Q   => cont_out_0,
      EN  => en_cont_0,
      CLR => clr
   );
   
   bcd2ssd_3: bcd_2_ssd
   port map
   (
      bcd => cont_out_3,
      ssd => ssd_out_3,
      point => '0'
   );
   
   bcd2ssd_2: bcd_2_ssd
   port map
   (
      bcd => cont_out_2,
      ssd => ssd_out_2,
      point => '1'
   );
   
   bcd2ssd_1: bcd_2_ssd
   port map
   (
      bcd => cont_out_1,
      ssd => ssd_out_1,
      point => '0'
   );
   
   bcd2ssd0: bcd_2_ssd
   port map
   (
      bcd => cont_out_0,
      ssd => ssd_out_0,
      point => '0'
   );
   
   process(stst)
   begin
      if rising_edge(stst) then
         if running = '1' then
            running <= '0';
         else
            running <= '1';
         end if;
      end if;
   end process;



end architecture;