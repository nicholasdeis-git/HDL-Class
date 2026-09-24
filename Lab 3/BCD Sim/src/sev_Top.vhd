library ieee;
use ieee.std_logic_1164.all;

entity sev_top is
  port (
    clk             : in std_logic; 
	reset           : in std_logic;
    seven_seg_out   : out std_logic_vector(6 downto 0)
  );
end sev_top;

architecture beh of sev_top is

component seven_seg is
  port (
    clk             : in std_logic;
	reset           : in std_logic;
    bcd             : in std_logic_vector(3 downto 0);
    seven_seg_out   : out std_logic_vector(6 downto 0)
  );  
end component; 

component generic_counter is
  generic (
    max_count       : integer
  );
  port (
    clk             : in  std_logic; 
    reset           : in  std_logic;
    output          : out std_logic
  );  
end component;  

signal enable : std_logic; 
signal sum_sig : std_logic_vector(3 downto 0);
signal sum : std_logic_vector(3 downto 0);

begin

uut: seven_seg
port map(  
    clk            => clk,
    bcd            => sum_sig, -- hard code "0001" to verify output
    reset          => reset,
    seven_seg_out  => seven_seg_out
  );
  
uut2: generic_counter  
  generic map (
    max_count => 50000000
  )
  port map(
    clk       => clk,
    reset     => reset,
    output    => enable
  );
  
  -- uut3 adder
  
  process(clk,reset)
  begin
    if (reset = '1') then 
      sum_sig <= "0000";
    elsif (clk'event and clk = '1') then
        sum_sig <= sum; 
    end if;
  end process;
end beh;