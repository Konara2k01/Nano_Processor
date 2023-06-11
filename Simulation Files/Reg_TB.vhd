----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 06:58:36 AM
-- Design Name: 
-- Module Name: Reg_TB - Behavioral
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

entity Reg_TB is
--  Port ( );
end Reg_TB;

architecture Behavioral of Reg_TB is

component Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           RES : in STD_LOGIC; 
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal D,Q : STD_LOGIC_VECTOR (3 downto 0);
signal EN, RES : STD_LOGIC;
signal CLK : STD_LOGIC := '0'; 

begin

UUT : Reg
port map (
D => D,
EN => EN,
CLK => CLK,
Q => Q,
RES =>RES
);

CLK <= not CLK after 10ns;

process begin
RES <= '0';
EN <= '1';
D <= "1111";

wait for 100ns;

D <= "0001";

wait for 100ns;

RES <= '1';
wait for 100ns;

RES <= '0';
D <="1011";

wait; 

end process;


end Behavioral;
