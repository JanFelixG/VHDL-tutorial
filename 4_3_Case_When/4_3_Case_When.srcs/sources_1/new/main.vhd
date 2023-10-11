----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2019 21:09:16
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
    Port ( sw : in STD_LOGIC_vector(15 downto 0);
           btnd : in std_logic;
           ld :out STD_LOGIC_vector(15 downto 0));
end main;

architecture Behavioral of main is

Signal zustand : std_logic_vector (1 downto 0);

begin

zustand<="00";

process(zustand,sw,btnd)
begin

if(rising_edge(btnd)) then
case zustand is
when "00" =>
if(sw(3 downto 0)="1000") then
zustand<="01";
end if;
when "01" =>
if(sw(3 downto 0)="0100") then
zustand<="10";
end if;
when "10" =>
if(sw(3 downto 0)="0010") then
zustand<="11";
end if;
when "11" =>
if(sw(3 downto 0)="0001") then
zustand<="00";
end if;
end case;
end if;

end process;

process(zustand)
begin

case zustand is
when "00" =>
ld<=(others=>'0');
ld(0)<='1';
ld(1)<='1';
when "01" =>
ld<=(others=>'0');
ld(2)<='1';
ld(3)<='1';
ld(4)<='1';
when "10" =>
ld<=(others=>'0');
ld(5)<='1';
ld(7)<='1';
when "11" =>
ld<=(others=>'0');
ld(10)<='1';
ld(11)<='1';
ld(12)<='1';
end case;

end process;

end Behavioral;
