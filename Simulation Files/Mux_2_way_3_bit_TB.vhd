----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 05:31:36 PM
-- Design Name: 
-- Module Name: Mux_2_way_3_bit_TB - Behavioral
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

entity Mux_2_way_3_bit_TB is
--  Port ( );
end Mux_2_way_3_bit_TB;

architecture Behavioral of Mux_2_way_3_bit_TB is

component Mux_2_way_3_bit is
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal I0, I1,Y : std_logic_vector(2 downto 0);
signal S : std_logic;

begin
  UUT: Mux_2_way_3_bit 
  PORT MAP(
    I0 =>I0,
    I1 =>I1,
    S => S,
    Y => Y
  );

 process
    begin
      
      I0 <= "101";
      I1 <= "110";
      
      S <= '1';
      wait for 100ns;
      
      S <= '0';
      wait;
      
end process;


end Behavioral;
