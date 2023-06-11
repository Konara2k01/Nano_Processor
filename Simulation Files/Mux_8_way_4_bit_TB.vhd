----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 06:01:32 PM
-- Design Name: 
-- Module Name: Mux_8_way_4_bit_TB - Behavioral
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

entity Mux_8_way_4_bit_TB is
--  Port ( );
end Mux_8_way_4_bit_TB;

architecture Behavioral of Mux_8_way_4_bit_TB is

component Mux_8_way_4_bit is

    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
           
end component;

signal Y,I0,I1,I2,I3,I4,I5,I6,I7 : STD_LOGIC_VECTOR (3 downto 0);
signal S : STD_LOGIC_VECTOR (2 downto 0) ;

begin

UUT : Mux_8_way_4_bit
port map(
I0 => I0,
I1 => I1,
I2 => I2,
I3 => I3,
I4 => I4,
I5 => I5,
I6 => I6,
I7 => I7,
Y => Y,
S => S
);

process begin

I0 <= "1111";
I7 <= "1011";

S <= "000";
wait for 100 ns;

S <= "111";
wait;

end process;

end Behavioral;
