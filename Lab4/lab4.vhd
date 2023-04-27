Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lab4 is 
   port
   (
      clk_raw: IN std_logic;
      en:  IN std_logic
   );
end entity;

architecture lab4_arch of lab4 is 

   COMPONENT bram IS
      PORT
      (
         address  : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
         clock		: IN STD_LOGIC;
         data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
         wren		: IN STD_LOGIC ;
         q		   : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
      );
   END COMPONENT;
   
   COMPONENT bram_empty IS
      PORT
      (
         address  : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
         clock		: IN STD_LOGIC;
         data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
         wren		: IN STD_LOGIC ;
         q		   : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
      );
   END COMPONENT;

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
   
   COMPONENT DIVISOR is
   PORT
   (
      CLK: in std_logic;
		RST: in std_logic;
		DIV50: out std_logic
    );
	END COMPONENT;
   
   signal clk: std_logic := '0';
   signal read_bram0: std_logic := '1';

   signal bram0_wren: std_logic;
   signal bram0_clk_en: std_logic := '1' ;
   signal bram0_address: std_logic_vector(9 downto 0) := "0000000000";
   signal bram0_out: std_logic_vector(7 downto 0);
   signal bram0_out_ready: std_logic := '0';
   signal bram0_out_ready_0: std_logic := '0';
   signal bram0_out_ready_1: std_logic := '1';
   
   signal bram1_wren: std_logic := '0';
   signal bram1_clk_en: std_logic := '1';
   signal bram1_address: std_logic_vector(9 downto 0) := "0000000000";
   signal bram1_out: std_logic_vector(7 downto 0);
   
   signal fifo_rd_clk_en: std_logic;
   signal fifo_wr_clk_en: std_logic;
   signal fifo_in: std_logic_vector(7 downto 0);
   signal fifo_out: std_logic_vector(7 downto 0);
   signal fifo_out_ready: std_logic := '0';
   signal fifo_out_ready_0: std_logic := '0';
   signal fifo_read_en: std_logic := '0';
   signal fifo_write_en: std_logic := '0';
   signal fifo_full: std_logic := '0';
   signal fifo_empty: std_logic;
   signal fifo_free_sp: std_logic_vector(8 downto 0);
   
begin
   
   bram0_wren <= '1' when bram0_clk_en = '1' else '0';
   
   bram1_wren <= '1' when bram1_clk_en = '1' and fifo_out_ready = '1' else '0';
   
   fifo_wr_clk_en <= bram0_clk_en;
   fifo_rd_clk_en <= bram1_clk_en;
   
   fifo_in <= bram0_out;
   fifo_write_en <= '1' when en = '1' and bram0_out_ready = '1' else '0';
   fifo_read_en <= '1' when fifo_rd_clk_en = '1' and fifo_empty /= '1' else '0'; 
   
   div0: DIVISOR
   port map
      (
         CLK => clk_raw,
         RST => '0',
         DIV50 => clk
      );
      
   bram0: bram
   port map
      (
         address => bram0_address,
         clock   => clk,
         data    => "00000000",
         wren    => '0',
         q       => bram0_out
      );
      
   bram1: bram
   port map
      (
         address => bram1_address,
         clock   => clk,
         data    => fifo_out,
         wren    => bram1_wren,
         q       => bram1_out
      );
   
   fifo0: fifo
   port map
      (
         clock => clk,
         data  => fifo_in,
         rdreq => fifo_read_en,
         wrreq => fifo_write_en,
         empty => fifo_empty,
         --full  => fifo_full,
         q     => fifo_out,
         usedw => fifo_free_sp
      );

   process(clk)
   begin
      if rising_edge(clk) then
         if fifo_full = '0' and en = '1' and bram0_address /= "1111111111" then 
            read_bram0 <= '1';
            bram0_address <= std_logic_vector(unsigned(bram0_address) + 1);
         else
            read_bram0 <= '0';
         end if;
      end if;
   end process;
   
   process(clk)
   begin
      if rising_edge(clk) then         
         if fifo_free_sp = "110000000" then
            fifo_full <= '1';
         else 
            if fifo_free_sp = "100000000" then
               fifo_full <= '0';
            end if;
         end if;
         
      end if;
   end process;

-- Delays 2 clocks the bram-out-ready signal. To give time to the memory to get the data   
   process(clk)    
   begin
      if rising_edge(clk) then
         bram0_out_ready <= bram0_out_ready_0;
         bram0_out_ready_0 <= bram0_out_ready_1;
         bram0_out_ready_1 <= read_bram0;
      end if;
   end process;
   
    -- Clock divider for read bram
   process(clk)
      variable count: integer range 0 to 5 := 0;
   begin
      if rising_edge(clk) then
         if count = 4 then
            bram1_clk_en <= '1';
            count := 0;
         else 
            bram1_clk_en <= '0';
            count := count + 1;
         end if;
      end if;
   end process;
   
 -- Delay 1 clock fifo read.
   process(fifo_rd_clk_en)    
   begin
      if rising_edge(fifo_rd_clk_en) then
         fifo_out_ready <= fifo_out_ready_0;
         if fifo_empty = '0' then
            fifo_out_ready_0 <= '1';
         else 
            fifo_out_ready_0 <= '0';
         end if;         
      end if;
   end process;
   
-- Bram1 addres update.
   process(bram1_clk_en)    
   begin
      if rising_edge(bram1_clk_en) then
         if fifo_out_ready = '1' and bram1_address /= "1111111111" then
            bram1_address <= std_logic_vector(unsigned(bram1_address) + 1);
         end if;
      end if;
   end process;

end architecture;