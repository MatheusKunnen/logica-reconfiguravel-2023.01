Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Entity BRAM is
   PORT(RST       : in  std_logic;        
        CLK       : in  std_logic;        
        READDATA  : out std_logic_vector(7 downto 0);
        WRITEDATA : in  std_logic_vector(7 downto 0);
        WR_EN     : in std_logic;           
        RD_EN     : in std_logic;            
        CS        : in std_logic;           
        ADD       : in std_logic_vector (9 downto 0)
		  );
end entity;


Architecture X of BRAM is
   COMPONENT qbram IS
      PORT
      (
         address		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
         clock		: IN STD_LOGIC  := '1';
         data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
         wren		: IN STD_LOGIC ;
         q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
      );
   END COMPONENT;
   
   signal VDD, GND : std_logic;
   
   signal wren_internal: std_logic := '0';
   signal out_qbram: std_logic_vector(7 downto 0);
   
Begin

   VDD <= '1';
   GND <= '0';
   
   wren_internal <= '1' when CS = '1' AND WR_EN = '1' else '0';
   
   READDATA <= out_qbram when CS = '1' AND RD_EN = '1' else "ZZZZZZZZ";
   
bram0: qbram
   port map
   (
      address => ADD,
      clock   => CLK,
      data    => WRITEDATA,
      wren    => wren_internal,
      q       => out_qbram
   );


End architecture;
