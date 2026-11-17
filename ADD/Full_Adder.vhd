library Ieee;
use Ieee.std_Logic_1164.all;

entity Full_Adder is
    Port ( 
        A , B , Cin : in  STD_LOGIC;
        Sum , Cout : out STD_LOGIC
    );
end Full_Adder;

architecture Structural of Full_Adder is
begin
    Sum     <= A xor B xor Cin;
    Cout    <= ( Cin and ( A xor B )) or ( A and B );
end Structural;
