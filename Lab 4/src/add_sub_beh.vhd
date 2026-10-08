-------------------------------------------------------------------------------
-- Dr. Kaputa
-- generic adder [behavioral]
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add_sub_beh is
  generic (
    bits    : integer := 4
  );
  port (
    a       : in  std_logic_vector(bits-1 downto 0) := "0000";
    b       : in  std_logic_vector(bits-1 downto 0) := "0000";
    flag    : in  std_logic := '0';
    result  : out std_logic_vector(bits-1 downto 0) := "0000"
  );
end entity add_sub_beh;

architecture beh of add_sub_beh is

signal result_temp : std_logic_vector(bits downto 0);
 
begin
  process(a, b, flag)
  begin
    if flag = '0' then
      result <= std_logic_vector(unsigned(a) + unsigned(b));
    elsif flag = '1' then
      result <= std_logic_vector(unsigned(a) - unsigned(b));
    end if;
  end process;
end beh;