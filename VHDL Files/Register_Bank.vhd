library ieee;
use ieee.std_logic_1164.all;

package my_pkg is
    type key_array is array (0 to 7) of std_logic_vector(3 downto 0);
end package my_pkg;

library ieee;
use ieee.std_logic_1164.all;
use work.my_pkg.all;

entity Register_Bank is
    port (
        EN  : in  std_logic_vector(2 downto 0);
        D   : in  std_logic_vector(3 downto 0);
        CLK : in  std_logic;
        RES : in std_logic;
        Q   : out key_array
    );
end Register_Bank;

architecture Behavioral of Register_Bank is

component Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           RES : in STD_LOGIC; 
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Y : STD_LOGIC_VECTOR (7 downto 0);

begin

Decoder_3_to_8_0 : Decoder_3_to_8
port map(
I => EN,
EN => '1',
Y => Y
);

    Reg_0 : Reg
        port map(
            D => "0000",
            En => '1',
            Clk => Clk,
            Q => Q(0),
            RES => RES);
            
    Reg_1 : Reg
        port map(
            D => D,
            En => Y(1),
            Clk => Clk,
            RES => RES,
            Q => Q(1)
            );
   
    Reg_2 : Reg
        port map(
            D => D,
            En => Y(2),
            Clk => Clk,
            RES => RES,
            Q => Q(2)
            );
   
    Reg_3 : Reg
        port map(
            D => D,
            En => Y(3),
            Clk => Clk,
            RES => RES,
            Q => Q(3)
            );
   
    Reg_4 : Reg
        port map(
            D => D,
            En => Y(4),
            Clk => Clk,
            RES => RES,
            Q => Q(4));
    
    Reg_5 : Reg
        port map(
            D => D,
            En => Y(5),
            Clk => Clk,
            RES => RES,
            Q => Q(5));
    
    Reg_6 : Reg
        port map(
            D => D,
            En => Y(6),
            Clk => Clk,
            RES => RES,
            Q => Q(6));
    
    Reg_7 : Reg
        port map(
            D => D,
            En => Y(7),
            Clk => Clk,
            RES => RES,
            Q => Q(7));  
  
end Behavioral;