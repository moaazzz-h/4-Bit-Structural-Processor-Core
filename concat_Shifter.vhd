library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity concat_Shifter is
    Port (
        clk        : in  STD_LOGIC;
        A          : in  STD_LOGIC_VECTOR(3 downto 0);
        B          : in  STD_LOGIC_VECTOR(3 downto 0);
        Output_Bus : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Concat_Shifter;

architecture Behavioral of concat_Shifter is
    signal concat_vector : STD_LOGIC_VECTOR(7 downto 0);
begin
    concat_vector <= A & B;

    process(clk)
    begin
        if rising_edge(clk) then
            Output_Bus(7) <= concat_vector(6);
            Output_Bus(6) <= concat_vector(5);
            Output_Bus(5) <= concat_vector(4);
            Output_Bus(4) <= concat_vector(3);
            Output_Bus(3) <= concat_vector(2);
            Output_Bus(2) <= concat_vector(1);
            Output_Bus(1) <= concat_vector(0);
            Output_Bus(0) <= '0';
            
        end if;
    end process;

end Behavioral;