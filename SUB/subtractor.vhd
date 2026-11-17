library ieee;
use ieee.std_logic_1164.all;

entity subtractor is
    Port (
        A, B : in  std_logic_vector (3 downto 0);
        Diff : out std_logic_vector (3 downto 0);
        Cout : out std_logic   -- '1' means A >= B (no borrow)
    );
end subtractor;

architecture Structural of subtractor is
    component ripple_carry_adder is
        Port (
            A, B : in  std_logic_vector (3 downto 0);
            Cin  : in  std_logic;
            Sum  : out std_logic_vector (3 downto 0);
            Cout : out std_logic
        );
    end component;

    signal nB : std_logic_vector (3 downto 0);
begin
    nB <= not B;

    RCA: ripple_carry_adder
        port map (A => A, B => nB, Cin => '1', Sum => Diff, Cout => Cout);
end Structural;
