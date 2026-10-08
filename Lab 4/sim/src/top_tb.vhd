library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb is
end top_tb;

architecture arch of top_tb is

component Top is
  port (
    a               : in std_logic_vector(2 downto 0);
	b               : in std_logic_vector(2 downto 0);
	add_btn         : in std_logic;
	sub_btn         : in std_logic;
    clk             : in std_logic; 
	reset           : in std_logic;
    seven_seg1      : out std_logic_vector(6 downto 0);
	seven_seg2      : out std_logic_vector(6 downto 0);
	seven_seg3      : out std_logic_vector(6 downto 0)
  );  
end component; 

signal a     : std_logic_vector(2 downto 0) := "000";
signal b     : std_logic_vector(2 downto 0) := "000";
signal add_btn      : std_logic;
signal sub_btn      : std_logic;
signal clk          : std_logic := '0';
signal reset        : std_logic := '1';
signal seven_seg1 : std_logic_vector(6 downto 0) := "1111111";
signal seven_seg2 : std_logic_vector(6 downto 0) := "1111111";
signal seven_seg3 : std_logic_vector(6 downto 0) := "1111111";

begin

-- clock process
clock: process
  begin
    clk <= not clk;
    wait for 10ns;
end process; 

-- reset process
async_reset: process
  begin
    wait for 20ns;
    reset <= '0';
    wait;
end process; 

add_btn_sync: process
  begin
    add_btn <= '0';
	wait for 200ns;
	add_btn <= '1';
    wait;
end process; 

sub_btn_sync: process
  begin
    sub_btn <= '0';
	wait for 400ns;
	sub_btn <= '1';
    wait;
end process; 

uut: Top
port map(
  a               => a,
  b               => b,
  add_btn         => add_btn,
  sub_btn         => sub_btn,
  clk             => clk,
  reset           => reset,
  seven_seg1      => seven_seg1,
  seven_seg2      => seven_seg2,
  seven_seg3      => seven_seg3
  );
  
sequential_tb : process
begin
  report "****************** sequential testbench start ****************";
  wait for 80 ns;
  for i in 0 to 7 loop
    for j in 0 to 7 loop
      wait for 50 ns;
      b <= std_logic_vector(unsigned(b) + 1);
    end loop;
    a <= std_logic_vector(unsigned(a) + 1);
  end loop;
  wait for 50 ns;
  report "****************** sequential testbench stop ****************";
  wait;
end process;
end arch;