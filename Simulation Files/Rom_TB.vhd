----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 11:07:12 AM
-- Design Name: 
-- Module Name: Rom_TB - Behavioral
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

entity Rom_TB is
--  Port ( );
end Rom_TB;

architecture Behavioral of Rom_TB is

component Rom is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           D : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal A : STD_LOGIC_VECTOR (2 downto 0);
signal D : STD_LOGIC_VECTOR (11 downto 0);

begin

UUT : Rom
port map(
A => A,
D => D
);

process begin

A <= "101";
wait for 100ns;

A <= "100";
wait for 100ns;

A <= "001";
wait;


end process;


end Behavioral;
