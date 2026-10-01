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

signal a     : std_logic_vector(2 downto 0);
signal b     : std_logic_vector(2 downto 0);
signal clk          : std_logic := '0';
signal reset        : std_logic := '1';
signal seven_seg1: std_logic_vector(6 downto 0);
signal seven_seg2: std_logic_vector(6 downto 0);
signal seven_seg3: std_logic_vector(6 downto 0);

begin

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