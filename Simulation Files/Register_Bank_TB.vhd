----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 08:00:48 AM
-- Design Name: 
-- Module Name: Register_Bank_TB - Behavioral
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

package my_pkg is
    type key_array is array (0 to 7) of std_logic_vector(3 downto 0);
end package my_pkg;

library ieee;
use ieee.std_logic_1164.all;
use work.my_pkg.all;


entity Register_Bank_TB is
--  Port ( );
end Register_Bank_TB;

architecture Behavioral of Register_Bank_TB is


component Register_Bank is
    port (
        EN  : in  std_logic_vector(2 downto 0);
        D   : in  std_logic_vector(3 downto 0);
        CLK : in  std_logic;
        RES : in std_logic;
        Q   : out key_array
    );
end component;

signal RES : std_logic;
signal EN : std_logic_vector(2 downto 0);
signal D   : std_logic_vector(3 downto 0);
signal Q   : key_array;
signal CLK : std_logic := '0';

begin

UUT : Register_Bank
port map(

EN => EN,
D => D,
CLK => CLK,
RES => RES,
Q => Q
);

CLK <= not CLK after 10ns;


process begin

RES <= '0';

EN <= "001";
D <= "1010";

wait for 100ns;

EN <= "010";
D <= "1000";

RES <= '1';

wait;


end process;

end Behavioral;
