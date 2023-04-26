Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_ram is

end entity;

architecture tb_bram_arch of tb_ram is
   COMPONENT bram IS
      PORT
      (
         address  : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
         clock		: IN STD_LOGIC;
         data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
         wren		: IN STD_LOGIC ;
         q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
      );
   END COMPONENT;
      
    -- Clock period
    constant period_time : time := 10 ns;
    signal finished : std_logic := '0';
    signal clk : std_logic;
    -- Test signals
    signal address: std_logic_vector(9 downto 0) := "0000000000";
    signal data: std_logic_vector(7 downto 0) := "00000000";
    signal wren: std_logic := '0';
    signal ram_out: std_logic_vector(7 downto 0);
    
begin

    DUT: bram
    port map
    (
      address => address,
      clock   => clk,
      data    => data,
      wren    => wren,
      q       => ram_out
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
      wait for period_time/3;
      wait for period_time;
      address <= "0000000001";
      wait for period_time;
      address <= "0000000010";
      wait for period_time;
      address <= "0000000011";
      wait for period_time;
      address <= "0000000100";
      wait;
    end process;
end architecture;