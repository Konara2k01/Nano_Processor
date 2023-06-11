----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 10:32:49 AM
-- Design Name: 
-- Module Name: Nano_Processor - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Nano_Processor is
    Port ( CLK : in STD_LOGIC;
           RES : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Seg_out : out STD_LOGIC_VECTOR (6 downto 0);
           Reg_out : out std_logic_vector(3 downto 0));
end Nano_Processor;

architecture Behavioral of Nano_Processor is

component Slow_Clk is
    Port ( Clk_In : in STD_LOGIC;
           Clk_Out : out STD_LOGIC);
end component;

component Register_Bank is
    port (
        EN  : in  std_logic_vector(2 downto 0);
        D   : in  std_logic_vector(3 downto 0);
        CLK : in  std_logic;
        RES : in std_logic;
        Q   : out key_array
    );
end component;

component ADD_SUB_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : inout STD_LOGIC_VECTOR (3 downto 0);
           C : inout STD_LOGIC;
           Z : out STD_LOGIC;
           V : out STD_LOGIC);
end component;

component ADD_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           C : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Program_Counter is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0);
           CLK : in STD_LOGIC;
           RES : in STD_LOGIC);
end component;

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

component Mux_2_way_3_bit is
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Mux_2_way_4_bit is
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

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

component Rom is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           D : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Seg_7 is
    Port (I : in STD_LOGIC_VECTOR (3 downto 0);
    O : out STD_LOGIC_VECTOR (6 downto 0));
end component; 

signal Jmp_Flag,Load_Sel,Add_Sub_Sel,S_CLK : STD_LOGIC;
signal RegBank_Mux : key_array;
signal InsBus : STD_LOGIC_VECTOR (11 downto 0);
signal MemSel,Mux_PC,ADD_3_Mux,AD_Jmp,Reg_En,Reg_A_Sel,Reg_B_Sel : STD_LOGIC_VECTOR (2 downto 0);
signal Mux_Reg,Imd_Val,AddSub_Mux,MuxA_AddSub,MuxB_AddSub : STD_LOGIC_VECTOR (3 downto 0);


begin

Slow_Clk_0 : Slow_Clk 
    Port map (
         Clk_In => CLk,
         Clk_Out => S_CLK);

Instruction_Decoder_0 : Instruction_Decoder 
    Port map( I => InsBus,
           Reg_Check => MuxA_AddSub,
           Reg_A_Sel => Reg_A_Sel,
           Reg_B_Sel => Reg_B_Sel,
           Add_Sub_Sel =>  Add_Sub_Sel,
           Imd_Val => Imd_Val,
           Load_Sel =>Load_Sel,
           Reg_EN => Reg_En,
           Jmp_Flag => Jmp_Flag,
           Ad_Jmp => AD_Jmp
           );  

Rom_0 : Rom 
    Port map (
         A => MemSel,
         D => InsBus);

Program_Counter_0 : Program_Counter 
    Port map(
           D => Mux_PC, 
           Q => MemSel,
           CLK => S_CLK,
           RES => RES );
           
ADD_3_0 : ADD_3 
     Port map(
         A => MemSel,
         B => "001",
         C_in => '0',
         S => ADD_3_Mux );

Mux_2_way_3_bit_0 : Mux_2_way_3_bit 
     Port map ( 
        I0 => ADD_3_Mux,
        I1 => AD_Jmp,
        S => Jmp_Flag,
        Y => Mux_PC);
     
Register_Bank_0 : Register_Bank 
        port map (
            EN => Reg_En,
            D  => Mux_Reg,
            CLK => S_CLK,
            RES => RES,
            Q => RegBank_Mux );
            
Mux_2_way_4_bit_0 : Mux_2_way_4_bit
         Port map ( 
            I0 => Imd_Val,
            I1 => AddSub_Mux,
            S => Load_Sel,
            Y => Mux_Reg);       

ADD_SUB_4_0 : ADD_SUB_4
    Port map (
         A => MuxB_AddSub,
         B => MuxA_AddSub,
         M => Add_Sub_Sel,
         S => AddSub_Mux,
         Z => Zero,
         V => Overflow );
                      
Mux_8_way_4_bit_A : Mux_8_way_4_bit 
      Port map (
         I0 => RegBank_Mux(0),
         I1 => RegBank_Mux(1),
         I2 => RegBank_Mux(2),
         I3 => RegBank_Mux(3),
         I4 => RegBank_Mux(4),
         I5 => RegBank_Mux(5),
         I6 => RegBank_Mux(6),
         I7 => RegBank_Mux(7),
         S  => Reg_A_Sel,
         Y  =>MuxA_AddSub );                 

Mux_8_way_4_bit_B : Mux_8_way_4_bit 
      Port map (
         I0 => RegBank_Mux(0),
         I1 => RegBank_Mux(1),
         I2 => RegBank_Mux(2),
         I3 => RegBank_Mux(3),
         I4 => RegBank_Mux(4),
         I5 => RegBank_Mux(5),
         I6 => RegBank_Mux(6),
         I7 => RegBank_Mux(7),
         S  => Reg_B_Sel,
         Y  =>MuxB_AddSub );  
         
Seg_7_0 : Seg_7
    Port map(I=>RegBank_Mux(7),
         O=>Seg_out); 

Reg_out <= RegBank_Mux(7);


end Behavioral;
