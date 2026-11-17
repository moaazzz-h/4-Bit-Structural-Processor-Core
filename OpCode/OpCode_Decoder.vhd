library ieee;
use ieee.std_logic_1164.all;
use work.Opcode.all;

entity Opcode_Decoder is
    Port (
        opcode_in  : in  std_logic_vector(3 downto 0);
        alu_select : out std_logic_vector(3 downto 0)
         );
end entity;

architecture Behavioral of Opcode_Decoder is
begin
    process(opcode_in)
    begin
        case opcode_in is
            when OP_ADD                       => alu_select <= "0000";
            when OP_SUB                       => alu_select <= "0001";
            when OP_INC_A                     => alu_select <= "0010";
				when OP_DEC_A                     => alu_select <= "0011";
            when OP_Circular_Shift_Right_B    => alu_select <= "0100";
            when OP_Circular_Shift_Left_B     => alu_select <= "0101";
            when OP_MERGING                   => alu_select <= "0110";
            when OP_CLEAR                     => alu_select <= "0111";
            when OP_Concatenated_Shift_Left   => alu_select <= "1000";
            when others                       => alu_select <= "1001";
        end case;
    end process;
end architecture;