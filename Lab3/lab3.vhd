Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lab3 is
port 
   (
   clk      :  IN std_logic;
   number   :  IN std_logic_vector(3 downto 0);
   out_for  : OUT std_logic_vector(2 downto 0);
   out_while: OUT std_logic_vector(2 downto 0);
   out_case : OUT std_logic_vector(2 downto 0);
   out_if   : OUT std_logic_vector(2 downto 0)
   );
end entity;

architecture lab3_arch of lab3 is
   signal count_if_0: unsigned(2 downto 0) := "000";
   signal count_if_1: unsigned(2 downto 0) := "000";
   signal count_if_2: unsigned(2 downto 0) := "000";
   signal count_if_3: unsigned(2 downto 0) := "000";

begin 
   out_if <= std_logic_vector(count_if_0 + count_if_1 + count_if_2 + count_if_3);

   process(clk)
      variable count: integer range 0 to 4 := 0;
   begin
      if rising_edge(clk) then
         count := 0;
         cloop: for k in 0 to number'length-1 loop
            if number(k) = '1' then
               count := count + 1;
            end if;
         end loop cloop;
         out_for <= std_logic_vector(to_unsigned(count, out_for'length));
      end if;
   end process;
   
   process(clk)
      variable count: integer range 0 to 4 := 0;
      variable k: integer range -1 to 3 := number'length-1;
   begin
      if rising_edge(clk) then
         count := 0;
         k := number'length-1;
         while k >= 0 loop
            if number(k) = '1' then
               count := count + 1;
            end if;
            k := k - 1;
         end loop;
         out_while <= std_logic_vector(to_unsigned(count, out_for'length));
      end if;
   end process;
   
   process(clk)

   begin
      if rising_edge(clk) then
         if number(0) = '1' then
            count_if_0 <= "001";
         else
            count_if_0 <= "000";
         end if;
         if number(1) = '1' then
            count_if_1 <= "001";
         else
            count_if_1 <= "000";
         end if;
         if number(2) = '1' then
            count_if_2 <= "001";
         else
            count_if_2 <= "000";
         end if;
         if number(3) = '1' then
            count_if_3 <= "001";
         else
            count_if_3 <= "000";
         end if;
         
      end if;
   end process;
   
   process(clk)

   begin
      if rising_edge(clk) then
         case number is
            when "0000" =>
               out_case <= "000";
            when "0001" =>
               out_case <= "001";
            when "0010" =>
               out_case <= "001";
            when "0011" =>
               out_case <= "010";
            when "0100" =>
               out_case <= "001";
            when "0101" =>
               out_case <= "010";
            when "0110" =>
               out_case <= "010";
            when "0111" =>
               out_case <= "011";
            when "1000" =>
               out_case <= "001";
            when "1001" =>
               out_case <= "010";
            when "1010" =>
               out_case <= "010";
            when "1011" =>
               out_case <= "011";
            when "1100" =>
               out_case <= "010";
            when "1101" =>
               out_case <= "011";
            when "1110" =>
               out_case <= "011";
            when "1111" =>
               out_case <= "100";
            when others =>
               out_case <= "000";
         end case;
      end if;
   end process;
   
end architecture;
