library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1_8bit is
port (
in0     : in  std_logic_vector(7 downto 0);
in1     : in  std_logic_vector(7 downto 0);
sel     : in  std_logic;
mux_out : out std_logic_vector(7 downto 0)
);
end mux_2to1_8bit;

architecture structural of mux_2to1_8bit is

component mux_2to1 is
    port (
        in0     : in  std_logic;
        in1     : in  std_logic;
        sel     : in  std_logic;
        mux_out : out std_logic
    );
end component;

begin

bit_slices : for i in 7 downto 0 generate
    bit_mux : mux_2to1
        port map (
            in0     => in0(i),
            in1     => in1(i),
            sel     => sel,
            mux_out => mux_out(i)
        );
end generate;

end structural;