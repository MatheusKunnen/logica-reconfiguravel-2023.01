Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Entity cont_10 is
   PORT(RST  : in std_logic;
        CLK  : in std_logic;
        Q    : out std_logic_vector(3 downto 0);
        EN   : in std_logic;
        CLR  : in std_logic--;
        --LD   : in std_logic;
        --LOAD : in std_logic_vector (3 downto 0)
		  );
end entity;

Architecture cont_10_arch of cont_10 is

   component cont4_completo is
      PORT
      (
           RST  : in std_logic;
           CLK  : in std_logic;
           Q    : out std_logic_vector(3 downto 0);
           Q_s  : out std_logic_vector(3 downto 0);
           EN   : in std_logic;
           CLR  : in std_logic;
           LD   : in std_logic;
           LOAD : in std_logic_vector (3 downto 0)
      );
   end component;

   signal Q_aux : std_logic_vector (3 downto 0);
   signal clear_9 : std_logic;
   signal CLR_aux : std_logic;
   signal LD: std_logic := '0';
   signal LOAD: std_logic_vector(3 downto 0) := "0000";
   

Begin

   LD <= '0';
   LOAD <= "0000";

   cont16 : cont4_completo
      PORT map
      (
         RST  => RST ,
         CLK  => CLK ,
         Q    => Q_aux,
         EN   => EN,
         CLR  => CLR_aux,
         LD   => LD, 
         LOAD => LOAD
       );
            
                 
   clear_9 <= '1' when (Q_aux = x"9") else '0';				  
   CLR_aux <= clear_9 OR CLR;				  
   Q <= Q_aux;
   
End architecture;
