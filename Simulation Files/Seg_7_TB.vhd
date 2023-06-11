----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 06:06:45 PM
-- Design Name: 
-- Module Name: Seg_7_TB - Behavioral
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

entity Seg_7_TB is
--  Port ( );
end Seg_7_TB;

architecture Behavioral of Seg_7_TB is

component Seg_7 is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (6 downto 0));
end component;

 SIGNAL I : std_logic_vector(3 downto 0);
 SIGNAL O : std_logic_vector(6 downto 0);

begin

UUT :Seg_7 PORT MAP(
     I=>I,
     O=>O
  );

process
    begin
    I <= "0000";
    WAIT for 10ns;
    I <= "0010";
    WAIT for 10ns;
    I <= "0100";
    WAIT for 10ns;
    I <= "0110";
    WAIT;
    end process;

end Behavioral;
