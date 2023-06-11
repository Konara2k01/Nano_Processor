----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 03:04:34 PM
-- Design Name: 
-- Module Name: ADD_3 - Behavioral
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

entity ADD_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           C : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0));
end ADD_3;

architecture Behavioral of ADD_3 is

component FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal B_in : std_logic_vector(2 downto 0);
signal C_out : std_logic_vector(1 downto 0);

begin


    FA_0 : FA
        port map (
            A => A(0),
            B => B(0),
            C_in => C_in,
            S => S(0),
            C_out => C_out(0)
            );

    FA_1 : FA
        port map (
            A => A(1),
            B => B(1),
            C_in => C_out(0),
            S => S(1),
            C_out => C_out(1)
            );

    FA_2 : FA
        port map (
            A => A(2),
            B => B(2),
            C_in => C_out(1),
            S => S(2),
            C_out => C
            );
            

end Behavioral;
