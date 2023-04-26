Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_fifo is

end entity;

architecture tb_fifo_arch of tb_fifo is
   COMPONENT fifo IS
      PORT
      (
         clock		: IN STD_LOGIC ;
         data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
         rdreq		: IN STD_LOGIC ;
         wrreq		: IN STD_LOGIC ;
         empty		: OUT STD_LOGIC ;
         full		: OUT STD_LOGIC ;
         q		   : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
         usedw		: OUT STD_LOGIC_VECTOR (8 DOWNTO 0)
      );
   END COMPONENT;
      
    -- Clock period
    constant period_time : time := 10 ns;
    signal finished : std_logic := '0';
    signal clk : std_logic;
    -- Test signals
    signal data: std_logic_vector(7 downto 0) := "00000000";
    signal rdreq: std_logic := '0';
    signal wrreq: std_logic := '0';
    signal empty: std_logic := '0';
    signal full: std_logic := '0';
    signal fifo_out: std_logic_vector(7 downto 0);
    signal usedw: std_logic_vector(8 downto 0);
    
begin

    DUT: fifo
    port map
    (
      clock   => clk,
      data    => data,
      rdreq   => rdreq,
      wrreq   => wrreq,
      empty   => empty,
      full    => full,
      q       => fifo_out,
      usedw   => usedw
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
      wrreq <= '1';
      data <= "00000001";
      wait for 2 * period_time;
      data <= "00000010";
      wait for 2 * period_time;
      data <= "00000100";
      wait for 2 * period_time;
      wrreq <= '0';
      rdreq <= '1';
      wait for 10*period_time;
      wait;
    end process;
end architecture;