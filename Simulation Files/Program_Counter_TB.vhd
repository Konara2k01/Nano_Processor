----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 04:01:20 PM
-- Design Name: 
-- Module Name: Program_Counter_TB - Behavioral
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

entity Program_Counter_TB is
--  Port ( );
end Program_Counter_TB;

architecture Behavioral of Program_Counter_TB is

component Program_Counter is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0);
           CLK : in STD_LOGIC;
           RES : in STD_LOGIC);
end component;

signal Clk : std_logic := '0';
signal Q,D : std_logic_vector(2 downto 0);
signal RES : std_logic;

begin

UUT: Program_Counter 
    port map(
        Q => Q,
        D => D,
        RES => RES,
        Clk => Clk 
        );

CLK <= not CLK after 10ns;


process begin

    RES <= '0';
    
    D <= "111";
    wait for 50ns;
    
     D <= "001";
     wait for 50ns;

    RES <= '1';
    wait for 50ns;
     
     RES <= '0';  
       
     D <= "101";
     wait for 50ns;
    
     D <= "011";
     wait for 50ns;
    
    wait;


end process;

end Behavioral;
