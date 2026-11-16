library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Increment_A is
    Port ( 
        A      : in  STD_LOGIC_VECTOR (3 downto 0);
        Result : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Increment_A;

architecture Structural of Increment_A is
    component Full_Adder is
        Port ( 
            A, B, Cin : in  STD_LOGIC;
            Sum, Cout : out STD_LOGIC
        );
    end component;
    signal C1, C2, C3, C4 : STD_LOGIC;
begin
    FA0: Full_Adder port map (A => A(0), B => '0', Cin => '1', Sum => Result(0), Cout => C1);
    FA1: Full_Adder port map (A => A(1), B => '0', Cin => C1,  Sum => Result(1), Cout => C2);
    FA2: Full_Adder port map (A => A(2), B => '0', Cin => C2,  Sum => Result(2), Cout => C3);
    FA3: Full_Adder port map (A => A(3), B => '0', Cin => C3,  Sum => Result(3), Cout => C4);
end Structural;