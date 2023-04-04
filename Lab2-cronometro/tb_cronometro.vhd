Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_cronometro is

end entity;

architecture tb_cronometro_arch of tb_cronometro is
   component cronometro is
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
   end component;
      
    -- Clock period
    constant period_time : time := 10 ns;
    signal finished : std_logic := '0';
    signal clk : std_logic;
    -- Test signals
    signal rst: std_logic := '0';
    signal en: std_logic := '1';
    signal stst: std_logic := '1';
    signal out_3: std_logic_vector(7 downto 0);
    signal out_2: std_logic_vector(7 downto 0);
    signal out_1: std_logic_vector(7 downto 0);
    signal out_0: std_logic_vector(7 downto 0);
    
begin

    DUT: cronometro
    port map
    (
      clk => clk,
      rst => rst,
      stst => stst,
      en  => en,
      out_3 => out_3,
      out_2 => out_2,
      out_1 => out_1,
      out_0 => out_0
    );

    --Total simulation time
    sim_time_proc: process
    begin
        wait for 1.0 us;
        --finished <= '1';
        wait;
    end process sim_time_proc;
    
    -- Clock generation
    clk_proc: process
    begin
        while finished /= '1' loop
            clk <= '0';
            wait for period_time/2;
            clk <= '1';
            wait for period_time/2;
        end loop;
        wait;
    end process clk_proc;
    
    process
    begin
      rst <= '1';
      wait for 13 ns;
      rst <= '0';
      wait;
    end process;
end architecture;