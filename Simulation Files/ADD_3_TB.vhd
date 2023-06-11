----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 03:09:47 PM
-- Design Name: 
-- Module Name: ADD_3_TB - Behavioral
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

entity ADD_3_TB is
--  Port ( );
end ADD_3_TB;

architecture Behavioral of ADD_3_TB is

component ADD_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           C : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

 SIGNAL A,B,S : std_logic_vector(2 downto 0);
 SIGNAL C : std_logic;
  
begin
  UUT: ADD_3 PORT MAP(
    C_in =>C,
    A => A,
    B => B,
    S => S
  );

 process
    begin
      C <= '0' ;
      A <= "100";
      B <= "010";
      wait for 100ns;
      
      A <= "010";
      B <= "001";
      
      wait for 100ns;
      wait;
      
end process;
end Behavioral;
