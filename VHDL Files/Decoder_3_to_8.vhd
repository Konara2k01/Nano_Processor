

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is

component Decoder_2_to_4 

 port(
 I: in STD_LOGIC_VECTOR;
 EN: in STD_LOGIC;
 Y: out STD_LOGIC_VECTOR );
 end component;
 
 signal I0,I1 : STD_LOGIC_VECTOR (1 downto 0);
 signal Y0,Y1 : STD_LOGIC_VECTOR (3 downto 0);
 signal en0,en1, I2 : STD_LOGIC;

begin

Decode_2_to_4_0 : Decoder_2_to_4

 port map(
 I=> I(1 downto 0),
 EN => en0,
 Y => Y(3 downto 0) );
 
 Decode_2_to_4_1 : Decoder_2_to_4
 port map(
 I => I(1 downto 0),
 EN => en1,
 Y => Y(7 downto 4) );
 
  en0 <= NOT(I(2)) AND EN;
  en1 <= I(2) AND EN;



end Behavioral;