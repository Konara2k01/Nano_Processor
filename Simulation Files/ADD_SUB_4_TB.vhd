----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 02:37:06 PM
-- Design Name: 
-- Module Name: ADD_SUB_4_TB - Behavioral
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

entity ADD_SUB_4_TB is
--  Port ( );
end ADD_SUB_4_TB;

architecture Behavioral of ADD_SUB_4_TB is

component ADD_SUB_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : inout STD_LOGIC_VECTOR (3 downto 0);
           C : inout STD_LOGIC;
           Z : out STD_LOGIC;
           V : out STD_LOGIC);
end component;

 SIGNAL A,B,S : std_logic_vector(3 downto 0);
 SIGNAL M,C,Z,V : std_logic;
  
begin

  UUT: ADD_SUB_4 PORT MAP(
    M => M,
    C =>C,
    A => A,
    B => B,
    S => S,
    Z => Z,
    V => V

  );

 process
    begin
      M <= '0';
      A <= "0100";
      B <= "0010";
      wait for 100ns;
      
      M <= '1';
      A <= "0000";
      B <= "0001";
      
      wait for 100ns;
      wait;
      
end process;


end Behavioral;
