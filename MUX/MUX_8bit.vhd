library ieee;
use ieee.std_logic_1164.all;

entity MUX_8bit is
port (
opcode_sel     : in  std_logic_vector(3 downto 0);
add_result     : in  std_logic_vector(3 downto 0);
sub_result     : in  std_logic_vector(3 downto 0);
inc_result     : in  std_logic_vector(3 downto 0);
dec_result     : in  std_logic_vector(3 downto 0);
rotr_result    : in  std_logic_vector(3 downto 0);
rotl_result    : in  std_logic_vector(3 downto 0);
merge_result   : in  std_logic_vector(7 downto 0);
shiftl_result  : in  std_logic_vector(7 downto 0);
selected_value : out std_logic_vector(7 downto 0)
);
end MUX_8bit;

architecture structural of MUX_8bit is

component mux_2to1_8bit is
    port (
        in0     : in  std_logic_vector(7 downto 0);
        in1     : in  std_logic_vector(7 downto 0);
        sel     : in  std_logic;
        mux_out : out std_logic_vector(7 downto 0)
    );
end component;

signal zeros_4bit : std_logic_vector(3 downto 0);
signal zeros_8bit : std_logic_vector(7 downto 0);

signal add_8bit  : std_logic_vector(7 downto 0);
signal sub_8bit  : std_logic_vector(7 downto 0);
signal inc_8bit  : std_logic_vector(7 downto 0);
signal dec_8bit  : std_logic_vector(7 downto 0);
signal rotr_8bit : std_logic_vector(7 downto 0);
signal rotl_8bit : std_logic_vector(7 downto 0);

signal add_or_sub     : std_logic_vector(7 downto 0);
signal inc_or_dec     : std_logic_vector(7 downto 0);
signal rotr_or_rotl   : std_logic_vector(7 downto 0);
signal merge_or_clear : std_logic_vector(7 downto 0);
signal shiftl_or_zero : std_logic_vector(7 downto 0);

signal arithmetic_ops : std_logic_vector(7 downto 0);
signal rotate_merge   : std_logic_vector(7 downto 0);
signal upper_codes    : std_logic_vector(7 downto 0);

signal lower_half : std_logic_vector(7 downto 0);
signal upper_half : std_logic_vector(7 downto 0);

begin

zeros_4bit <= "0000";
zeros_8bit <= "00000000";

add_8bit  <= zeros_4bit & add_result;
sub_8bit  <= zeros_4bit & sub_result;
inc_8bit  <= zeros_4bit & inc_result;
dec_8bit  <= zeros_4bit & dec_result;
rotr_8bit <= zeros_4bit & rotr_result;
rotl_8bit <= zeros_4bit & rotl_result;

mux_add_sub : mux_2to1_8bit
    port map (
        in0     => add_8bit,
        in1     => sub_8bit,
        sel     => opcode_sel(0),
        mux_out => add_or_sub
    );

mux_inc_dec : mux_2to1_8bit
    port map (
        in0     => inc_8bit,
        in1     => dec_8bit,
        sel     => opcode_sel(0),
        mux_out => inc_or_dec
    );

mux_rotr_rotl : mux_2to1_8bit
    port map (
        in0     => rotr_8bit,
        in1     => rotl_8bit,
        sel     => opcode_sel(0),
        mux_out => rotr_or_rotl
    );

mux_merge_clear : mux_2to1_8bit
    port map (
        in0     => merge_result,
        in1     => zeros_8bit,
        sel     => opcode_sel(0),
        mux_out => merge_or_clear
    );

mux_shiftl_unused : mux_2to1_8bit
    port map (
        in0     => shiftl_result,
        in1     => zeros_8bit,
        sel     => opcode_sel(0),
        mux_out => shiftl_or_zero
    );

mux_arithmetic : mux_2to1_8bit
    port map (
        in0     => add_or_sub,
        in1     => inc_or_dec,
        sel     => opcode_sel(1),
        mux_out => arithmetic_ops
    );

mux_rotate_merge : mux_2to1_8bit
    port map (
        in0     => rotr_or_rotl,
        in1     => merge_or_clear,
        sel     => opcode_sel(1),
        mux_out => rotate_merge
    );

mux_upper_codes : mux_2to1_8bit
    port map (
        in0     => shiftl_or_zero,
        in1     => zeros_8bit,
        sel     => opcode_sel(1),
        mux_out => upper_codes
    );

mux_lower_half : mux_2to1_8bit
    port map (
        in0     => arithmetic_ops,
        in1     => rotate_merge,
        sel     => opcode_sel(2),
        mux_out => lower_half
    );

mux_upper_half : mux_2to1_8bit
    port map (
        in0     => upper_codes,
        in1     => zeros_8bit,
        sel     => opcode_sel(2),
        mux_out => upper_half
    );

mux_final : mux_2to1_8bit
    port map (
        in0     => lower_half,
        in1     => upper_half,
        sel     => opcode_sel(3),
        mux_out => selected_value
    );


end structural;