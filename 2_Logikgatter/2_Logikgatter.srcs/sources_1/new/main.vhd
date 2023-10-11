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
           ld0 : out STD_LOGIC;
           ld2 : out STD_LOGIC;
           ld4 : out STD_LOGIC;
           ld6 : out STD_LOGIC;
           ld8 : out STD_LOGIC;
           ld10 : out STD_LOGIC;
           ld12 : out STD_LOGIC;
           ld14 : out STD_LOGIC);
end main;

architecture Behavioral of main is
begin

ld0 <= sw0 and sw1;
ld2 <= sw2 or sw3;
ld4 <= sw4 nand sw5;
ld6 <= sw6 nor sw7;
ld8 <= sw8 xor sw9;
ld10 <= sw10 xnor sw11;
ld12 <= not sw12;

process (sw13)
begin

if sw13='0' then
ld14<='0';
else
ld14<='1';
end if;

end process;


end Behavioral;
