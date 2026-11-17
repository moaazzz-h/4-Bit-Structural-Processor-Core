library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1 is
port (
in0     : in  std_logic;
in1     : in  std_logic;
sel     : in  std_logic;
mux_out : out std_logic
);
end mux_2to1;

architecture gates of mux_2to1 is
signal sel_not   : std_logic;
signal in0_gated : std_logic;
signal in1_gated : std_logic;
begin
sel_not   <= not sel;
in0_gated <= in0 and sel_not;
in1_gated <= in1 and sel;
mux_out   <= in0_gated or in1_gated;
end gates;