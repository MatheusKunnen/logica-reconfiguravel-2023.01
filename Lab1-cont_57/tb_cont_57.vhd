Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_cont_57 is
end entity;

architecture tb_cont_57_arch of tb_cont_57 is 
   component cont_57 is 
   port 
   (
      rst: IN std_logic;
      clk: IN std_logic;
      en:  IN std_logic;
      out_un: OUT std_logic_vector(3 downto 0);
      out_de: OUT std_logic_vector(3 downto 0)
   );
   end component;
   
    -- Clock period
    constant period_time : time := 10 ns;
    signal finished : std_logic := '0';
    signal clk : std_logic;
    -- Test signals
    signal rst: std_logic := '0';
    signal en: std_logic := '1';
    signal out_un: std_logic_vector(3 downto 0);
    signal out_de: std_logic_vector(3 downto 0);
begin

    DUT: cont_57
    port map
    (
      rst => rst,
      clk => clk,
      en  => en,
      out_un => out_un,
      out_de => out_de
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