library ieee;
use ieee.std_logic_1164.all;

entity Output_Register is
    Port (
        clk      : in  std_logic;
        data_in  : in  std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0)
    );
end entity Output_Register;

architecture Behavioral of Output_Register is

    signal register_data : std_logic_vector(7 downto 0);

begin

    process(clk)
    begin
	  if rising_edge(clk) then
	  
                register_data <= data_in;

     end if;
    end process;
        
    data_out <= register_data;

end architecture Behavioral;
