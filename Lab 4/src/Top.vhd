library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Top is
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

component add_sub_beh is 
  port(
    a       : in  std_logic_vector(3 downto 0);
    b       : in  std_logic_vector(3 downto 0);
    flag    : in  std_logic;
    result  : out std_logic_vector(3 downto 0)
  );
end component;

component flag_set is
  port(
    clk       : in  std_logic;
    reset     : in  std_logic;
    add_en    : in  std_logic;   
    sub_en    : in  std_logic;   
    flag      : out std_logic
  );
end component;

component rising_edge_synchronizer is
  port(
    clk               : in std_logic;
    reset             : in std_logic;
    input             : in std_logic;
    edge              : out std_logic
  );
end component;

signal a_sync     : std_logic_vector(2 downto 0);
signal b_sync     : std_logic_vector(2 downto 0);
signal a_pad      : std_logic_vector(3 downto 0);
signal b_pad      : std_logic_vector(3 downto 0);
signal result     : std_logic_vector(3 downto 0);
signal flag       : std_logic := '0';
signal add_en     : std_logic;
signal sub_en     : std_logic;

begin

uutRA : rising_edge_synchronizer
port map(
  clk          => clk,               
  reset        => reset,
  input        => add_btn,
  edge         => add_en
);

uutRS : rising_edge_synchronizer
port map(
  clk          => clk,               
  reset        => reset,
  input        => sub_btn,
  edge         => sub_en
);

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

uutArth : add_sub_beh
port map(
  a            => a_pad,
  b            => b_pad,
  flag         => flag,
  result       => result
  );

uutFlag : flag_set
port map(  
  clk            => clk,
  reset          => reset,
  add_en         => add_en,
  sub_en         => sub_en,
  flag           => flag
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
  
uut3 : seven_seg
port map(  
    clk            => clk,
    bcd            => result,
    reset          => reset,
    seven_seg_out  => seven_seg3
  );
  
process(clk,reset)
  begin  
  end process;
  
a_pad <= "0" & a_sync;
b_pad <= "0" & b_sync;

end beh;