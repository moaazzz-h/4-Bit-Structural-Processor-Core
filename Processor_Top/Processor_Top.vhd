library ieee ; 
use IEEE.STD_LOGIC_1164.ALL;

entity Processor_Top is
	port(
			A : in STD_LOGIC_VECTOR(3 downto 0);
			B : in STD_LOGIC_VECTOR(3 downto 0);
			Opcode : in STD_LOGIC_VECTOR(3 downto 0);
			clk : in STD_LOGIC ;
			Output_Bus : out STD_LOGIC_VECTOR (7 downto 0)
	);
	end Processor_Top;
	
architecture Structural of Processor_Top is
	
	signal add_sum : STD_LOGIC_VECTOR(3 downto 0);
	signal add_carry : STD_LOGIC ;
	
	signal inc_result : STD_LOGIC_VECTOR(3 downto 0);
	signal dec_result : STD_LOGIC_VECTOR(3 downto 0);
	
	
		component ripple_carry_adder is 
		 Port (
		 A, B : in STD_LOGIC_VECTOR(3 downto 0);
		 Cin  : in std_logic;
       Sum  : out std_logic_vector (3 downto 0);
       Cout : out std_logic 
		 );
		 end component;
		 
		 component Increment_A is
		 Port (
			A : in STD_LOGIC_VECTOR(3 downto 0);
			Result : out STD_LOGIC_VECTOR(3 downto 0)
		 ); end component;
		 
		 component Decrement_A is
		 Port (
			A : in STD_LOGIC_VECTOR(3 downto 0);
			Result : out STD_LOGIC_VECTOR(3 downto 0)
		 ); end component;
	begin
		
		ADD1: ripple_carry_adder
		port map (
			A => A,
			B => B,
			Cin => '0',
			Sum => add_sum,
			Cout => add_carry );
	
		INC1: Increment_A
		port map ( 
		A => A,
		Result => inc_result );
		
		DEC1: Decrement_A
		port map ( 
		A => A,
		Result => dec_result );
	end Structural ;