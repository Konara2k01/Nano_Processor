----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 12:01:33 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
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
           
   
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

component Decoder_2_to_4 
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
          EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal R_EN,MOVI,ADD,NEG,JZR : std_logic;

begin

 Decoder_2_to_4_0 : Decoder_2_to_4 
     port map(
     I(0) => I(10),
     I(1) => I(11),
     EN => '1',
     Y(0)=> ADD,
     Y(1) => NEG,
     Y(2) => MOVI,
     Y(3) => JZR);


-- register signals  
 
R_EN <= MOVI or ADD or NEG ;
 
Reg_EN(0) <=  R_EN AND I(7);
Reg_EN(1) <=  R_EN AND I(8);
Reg_EN(2) <=  R_EN AND I(9);
                  
-- ADD/SUB signals

Reg_A_Sel <= I(9 downto 7);
Reg_B_Sel <= I(6 downto 4);
Load_Sel <= ADD or NEG;
Add_Sub_Sel <= NEG;

-- jump signals

Jmp_Flag <= JZR and (NOT (Reg_Check(0) OR Reg_Check(1) OR Reg_Check(2) OR  Reg_Check(3) ));
Ad_Jmp <= I(2 downto 0);

-- other

Imd_Val <= I(3 downto 0);

end Behavioral;
