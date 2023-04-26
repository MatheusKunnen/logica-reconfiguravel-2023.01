Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_lab4 is

end entity;

architecture tb_lab4_arch of tb_lab4 is
   COMPONENT lab4 IS
      PORT
      (
         clk		: IN STD_LOGIC;
         en:  IN std_logic
      );
   END COMPONENT;
      
    -- Clock period
    constant period_time : time := 10 ns;
    signal finished : std_logic := '0';
    signal clk : std_logic;
    -- Test signals
    signal en: std_logic := '1';
begin

    DUT: lab4
    port map
    (
      clk   => clk,
      en    => en
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

--    process
--    begin
--      wait for period_time/3;
--      wrreq <= '1';
--      data <= "00000001";
--      wait for 2 * period_time;
--      data <= "00000010";
--      wait for 2 * period_time;
--      data <= "00000100";
--      wait for 2 * period_time;
--      wrreq <= '0';
--      rdreq <= '1';
--      wait for 10*period_time;
--      wait;
--    end process;
end architecture;