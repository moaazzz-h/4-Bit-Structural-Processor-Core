library ieee;
use ieee.std_logic_1164.all;

entity circularshiftBleft is
port(clk: in std_logic;
b: in std_logic_vector (3 downto 0);
Output_Bus : out std_logic_vector (7 downto 0));
end circularshiftBleft;


architecture Behavioral of circularshiftBleft is
begin 
Output_Bus(4)<='0';
Output_Bus(5)<='0';
Output_Bus(6)<='0';
Output_Bus(7)<='0';

process(clk) is
begin
if rising_edge(clk) then
Output_Bus(0)<=b(3);
Output_Bus(1)<=b(0);
Output_Bus(2)<=b(1);
Output_Bus(3)<=b(2);
end if;
end process;

end Behavioral;