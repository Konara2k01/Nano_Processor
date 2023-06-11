----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 12:26:54 PM
-- Design Name: 
-- Module Name: NanoProcessor_TB - Behavioral
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

entity NanoProcessor_TB is
--  Port ( );
end NanoProcessor_TB;

architecture Behavioral of NanoProcessor_TB is

component Nano_Processor is
    Port ( CLK : in STD_LOGIC;
           RES : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Seg_out : out STD_LOGIC_VECTOR (6 downto 0);
           Reg_out : out std_logic_vector(3 downto 0));
end component;

SIGNAL Res,Overflow,Zero : std_logic;
SIGNAL Reg_out :STD_LOGIC_VECTOR(3 downto 0);
signal Clk : std_logic :='0';

   
begin

   UUT: Nano_Processor PORT MAP(
       Res=>Res,
       Clk=>Clk,
       Overflow => Overflow,
       Zero => Zero,
       Reg_out => Reg_out
 );
 
Clk <= not Clk after 1ns; 

process begin 

Res <= '1';
wait for 50ns;

Res <= '0';
wait;


end process;


end Behavioral;
