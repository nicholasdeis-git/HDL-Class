library ieee;
use ieee.std_logic_1164.all;

entity flag_set is
  port (
    clk       : in  std_logic;
    reset     : in  std_logic;
    add_en   : in  std_logic;   
    sub_en   : in  std_logic;   
    flag      : out std_logic
  );
end entity flag_set;

architecture beh of flag_set is
begin

  process(clk, reset)
  begin
    if reset = '1' then
      flag <= '0';              -- default to add
    elsif rising_edge(clk) then
      if add_en = '1' then
        flag <= '0';
      elsif sub_en = '1' then
        flag <= '1';
      end if;
    end if;
  end process;

end beh;