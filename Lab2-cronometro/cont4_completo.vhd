Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Entity cont4_completo is
   PORT(RST  : in std_logic;
        CLK  : in std_logic; 
        Q    : out std_logic_vector(3 downto 0); 
        Q_s  : out std_logic_vector(3 downto 0);
        EN   : in std_logic; 
        CLR  : in std_logic;
        LD   : in std_logic; 
        LOAD : in std_logic_vector (3 downto 0)
        );
end entity;

Architecture X of Cont4_completo is

   signal CONT: unsigned (3 downto 0);
   signal CLK_1cs_en : std_logic;
   
Begin

   Process (CLK, RST)
   Begin
      If RST = '1' then
         CONT <= "0000";
      Elsif CLK' event and rising_edge(CLK) then
         If CLR = '1' and EN = '1' then
            CONT <= "0000";
         Else
            If EN = '1' then
               If LD = '1' then
                  CONT <= unsigned(LOAD);
               Else
                  CONT <= CONT + 1;
                  Q_s  <= std_logic_vector(CONT);
               End IF;
            End If;
         End If;
      End if;
   End process;

   Q <= std_logic_vector(CONT);

End architecture;
