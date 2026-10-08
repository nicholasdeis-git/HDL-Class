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
	-- add btn
	-- sub btn
    clk             : in std_logic; 
	reset           : in std_logic;
    seven_seg1      : out std_logic_vector(6 downto 0);
	seven_seg2      : out std_logic_vector(6 downto 0);
	seven_seg3      : out std_logic_vector(6 downto 0)
  );  
end component; 

signal a     : std_logic_vector(2 downto 0) := "000";
signal b     : std_logic_vector(2 downto 0) := "000";
signal clk          : std_logic := '0';
signal reset        : std_logic := '1';
signal seven_seg1: std_logic_vector(6 downto 0) := "1111111";
signal seven_seg2: std_logic_vector(6 downto 0) := "1111111";
signal seven_seg3: std_logic_vector(6 downto 0) := "1111111";

begin

-- a and b iteration (all 64 combinations)
sequential_tb : process
begin
  report "****************** sequential testbench start ****************";
  wait for 80 ns;   -- let all the initial conditions trickle through
  for i in 0 to 7 loop
    for j in 0 to 7 loop
      wait for 50 ns;   -- 3 clocks of latency, 5 to be safe
      b <= std_logic_vector(unsigned(b) + 1);   -- wraps 111 -> 000
    end loop;
    a <= std_logic_vector(unsigned(a) + 1);     -- wraps 111 -> 000
  end loop;
  wait for 50 ns;
  wait;
end process;

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

uut: Top
port map(
  a               => a,
  b               => b,
  -- add btn
  -- sub btn
  clk             => clk,
  reset           => reset,
  seven_seg1      => seven_seg1,
  seven_seg2      => seven_seg2,
  seven_seg3      => seven_seg3
  );
end arch;