----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2019 20:25:45
-- Design Name: 
-- Module Name: main - Behavioral
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

entity main is
    Port ( sw0 : in STD_LOGIC;
           sw1 : in STD_LOGIC;
           sw2 : in STD_LOGIC;
           sw3 : in STD_LOGIC;
           sw4 : in STD_LOGIC;
           sw5 : in STD_LOGIC;
           sw6 : in STD_LOGIC;
           sw7 : in STD_LOGIC;
           sw8 : in STD_LOGIC;
           sw9 : in STD_LOGIC;
           sw10 : in STD_LOGIC;
           sw11 : in STD_LOGIC;
           sw12 : in STD_LOGIC;
           sw13 : in STD_LOGIC;
           sw14 : in STD_LOGIC;
           sw15 : in STD_LOGIC;
           
           ld0 : out STD_LOGIC;
           ld1 : out STD_LOGIC;
           ld2 : out STD_LOGIC;
           ld3 : out STD_LOGIC;
           ld4 : out STD_LOGIC;
           ld5 : out STD_LOGIC;
           ld6 : out STD_LOGIC;
           ld7 : out STD_LOGIC;
           ld8 : out STD_LOGIC;
           ld9 : out STD_LOGIC;
           ld10 : out STD_LOGIC;
           ld11 : out STD_LOGIC;
           ld12 : out STD_LOGIC;
           ld13 : out STD_LOGIC;
           ld14 : out STD_LOGIC);
end main;



architecture Behavioral of main is

component halbaddierer is
port(A1 : in STD_LOGIC;
     A2 : in STD_LOGIC;
     Ubertrag : out STD_LOGIC;
     Summe : out STD_LOGIC);
end component;

component volladdierer is
port(A1 : in STD_LOGIC;
     A2 : in STD_LOGIC;
     cin : in std_logic;
     Ubertrag : out STD_LOGIC;
     Summe : out STD_LOGIC);
end component;

signal a1,b1,carry,u1,s1 : std_logic;
signal a2,b2,u2,s2 : std_logic;
signal a3,b3,u3,s3 : std_logic;
signal a4,b4,u4,s4 : std_logic;

begin

carry<=sw0;
a1<=sw1;
a2<=sw2;
a3<=sw3;
a4<=sw4;
b1<=sw5;
b2<=sw6;
b3<=sw7;
b4<=sw8;

voll1:volladdierer port map(A1=>a1,A2=>b1,cin=>carry,Ubertrag=>u1,Summe=>s1);
voll2:volladdierer port map(A1=>a2,A2=>b2,cin=>u1,Ubertrag=>u2,Summe=>s2);
voll3:volladdierer port map(A1=>a3,A2=>b3,cin=>u2,Ubertrag=>u3,Summe=>s3);
voll4:volladdierer port map(A1=>a4,A2=>b4,cin=>u3,Ubertrag=>u4,Summe=>s4);

ld1<=s1;
ld2<=s2;
ld3<=s3;
ld4<=s4;
ld5<=u4;

end Behavioral;
