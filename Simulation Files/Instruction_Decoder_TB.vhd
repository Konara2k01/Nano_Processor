----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 06:10:40 PM
-- Design Name: 
-- Module Name: Instruction_Decoder_TB - Behavioral
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

entity Instruction_Decoder_TB is
--  Port ( );
end Instruction_Decoder_TB;

architecture Behavioral of Instruction_Decoder_TB is

component Instruction_Decoder is
    Port ( I : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_A_Sel : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_B_Sel : out STD_LOGIC_VECTOR (2 downto 0);
           Add_Sub_Sel : out STD_LOGIC;
           Imd_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Load_Sel : out STD_LOGIC;
           Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
           Jmp_Flag : out STD_LOGIC;
           Ad_Jmp : out STD_LOGIC_VECTOR (2 downto 0)
           );
           
end component;

signal Add_Sub_Sel,Load_Sel,Jmp_Flag : STD_LOGIC;
signal Reg_A_Sel,Reg_B_Sel,Reg_EN,Ad_Jmp : STD_LOGIC_VECTOR (2 downto 0);
signal Imd_Val,Reg_Check : STD_LOGIC_VECTOR (3 downto 0);
signal I : STD_LOGIC_VECTOR (11 downto 0);


begin

UUT : Instruction_Decoder
port map (
I => I ,
Reg_Check => Reg_Check,
Reg_A_Sel => Reg_A_Sel,
Reg_B_Sel => Reg_B_Sel,
Add_Sub_Sel => Add_Sub_Sel,
Imd_Val => Imd_Val,
Load_Sel => Load_Sel,
Reg_EN => Reg_EN,
Jmp_Flag => Jmp_Flag,
Ad_Jmp => Ad_Jmp
);

process begin

I <= "101110001010";
wait for 100ns;

Reg_Check <= "0000";
I <= "110010000010";

wait for 100ns;

I <= "011110000000";
wait;

end process;

end Behavioral;
