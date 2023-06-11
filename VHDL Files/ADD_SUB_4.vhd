----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 02:12:22 PM
-- Design Name: 
-- Module Name: ADD_SUB_4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADD_SUB_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : inout STD_LOGIC_VECTOR (3 downto 0);
           C : inout STD_LOGIC;
           Z : out STD_LOGIC;
           V : out STD_LOGIC);
end ADD_SUB_4;

architecture Behavioral of ADD_SUB_4 is

component FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal B_in : std_logic_vector(3 downto 0);
signal C_out : std_logic_vector(2 downto 0);

begin

    B_in(0) <= B(0) xor M;
    B_in(1) <= B(1) xor M;
    B_in(2) <= B(2) xor M;
    B_in(3) <= B(3) xor M;

    FA_0 : FA
        port map (
            A => A(0),
            B => B_in(0),
            C_in => M,
            S => S(0),
            C_out => C_out(0)
            );

    FA_1 : FA
        port map (
            A => A(1),
            B => B_in(1),
            C_in => C_out(0),
            S => S(1),
            C_out => C_out(1)
            );

    FA_2 : FA
        port map (
            A => A(2),
            B => B_in(2),
            C_in => C_out(1),
            S => S(2),
            C_out => C_out(2)
            );

    FA_3 : FA
        port map (
            A => A(3),
            B => B_in(3),
            C_in => C_out(2),
            S => S(3),
            C_out => C);


Z <= not (S(0) or S(1) or S(2) or S(3) or C);
V <= C_out(2) xor C;

end Behavioral;
