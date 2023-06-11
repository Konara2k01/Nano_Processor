----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 10:53:30 AM
-- Design Name: 
-- Module Name: Rom - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Rom is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           D : out STD_LOGIC_VECTOR (11 downto 0));
end Rom;

architecture Behavioral of Rom is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

signal data : rom_type := (
"101110000001",
"100010000010",
"001110010000",
"100010000011",
"001110010000",
"000000000000",
"000000000000",
"000000000000"
);


begin

D <= data(to_integer(unsigned(A)));

end Behavioral;
