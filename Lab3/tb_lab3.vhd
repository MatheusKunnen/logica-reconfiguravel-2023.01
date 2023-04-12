Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_lab3 is

end entity;

architecture tb_lab3_arch of tb_lab3 is

   component lab3 is
   port 
      (
      clk      :  IN std_logic;
      number   :  IN std_logic_vector(3 downto 0);
      out_for  : OUT std_logic_vector(2 downto 0);
      out_while: OUT std_logic_vector(2 downto 0);
      out_case : OUT std_logic_vector(2 downto 0);
      out_if   : OUT std_logic_vector(2 downto 0)
      );
   end component;

    -- Clock period
    constant period_time : time := 20 ns;
    signal finished : std_logic := '0';
    signal clk : std_logic;
    -- Test signals
    signal rst: std_logic := '0';
    signal en: std_logic := '1';
    signal stst: std_logic := '1';
    signal number: std_logic_vector(3 downto 0) := "0000";
    signal out_for: std_logic_vector(2 downto 0);
    signal out_while: std_logic_vector(2 downto 0);
    signal out_case: std_logic_vector(2 downto 0);
    signal out_if: std_logic_vector(2 downto 0);
begin

    DUT: lab3
    port map
    (
      clk       => clk,
      number    => number,
      out_for   => out_for,
      out_while => out_while,
      out_case  => out_case,
      out_if    => out_if
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
      wait for 45 ns;
      rst <= '0';
      wait for 20 ns;
      number <= "1000";
      wait for 20 ns;
      number <= "1010";
      wait for 20 ns;
      number <= "1110";
      wait for 20 ns;
      number <= "1111";
      wait for 20 ns;
      number <= "1001";
      wait;
    end process;
end architecture;