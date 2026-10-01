library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Top is
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
end Top;

architecture beh of Top is

component synchronizer_3bit is
  port (
    clk               : in std_logic;
    reset             : in std_logic;
    async_in          : in std_logic_vector(2 downto 0);
    sync_out          : out std_logic_vector(2 downto 0)
  );  
end component; 

component seven_seg is
  port (
    clk             : in std_logic;
	reset           : in std_logic;
    bcd             : in std_logic_vector(3 downto 0);
    seven_seg_out   : out std_logic_vector(6 downto 0)
  );  
end component; 

signal a_sync     : std_logic_vector(2 downto 0);
signal b_sync     : std_logic_vector(2 downto 0);
signal a_pad     : std_logic_vector(3 downto 0);
signal b_pad     : std_logic_vector(3 downto 0);

begin

uutA : synchronizer_3bit
port map(
  clk          => clk,               
  reset        => reset,     
  async_in     => a,     
  sync_out     => a_sync
);  

uutB : synchronizer_3bit
port map(
  clk          => clk,               
  reset        => reset,     
  async_in     => b,     
  sync_out     => b_sync
);  

uut1 : seven_seg
port map(  
    clk            => clk,
    bcd            => a_pad,
    reset          => reset,
    seven_seg_out  => seven_seg1
  );
  
uut2 : seven_seg
port map(  
    clk            => clk,
    bcd            => b_pad,
    reset          => reset,
    seven_seg_out  => seven_seg2
  );
process(clk,reset)
  begin
  
  end process;
  
a_pad <= "0" & a_sync;
b_pad <= "0" & b_sync;

end beh;