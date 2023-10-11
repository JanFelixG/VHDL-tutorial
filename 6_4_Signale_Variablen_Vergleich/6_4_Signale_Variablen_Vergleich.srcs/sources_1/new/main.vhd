library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity main is
    Port ( sw : in STD_LOGIC_vector(15 downto 0);
           uhr,btnd : in std_logic;
           ld :out STD_LOGIC_vector(15 downto 0));
end main;

architecture Behavioral of main is

signal a,b,c : std_logic_vector(7 downto 0);

begin

process (btnd)
begin
if (rising_edge(btnd)) then
a <= sw(7 downto 0);
b <= a;
end if;
end process;

process (btnd)
variable var : std_logic_vector (7 downto 0);
begin
if (rising_edge(btnd)) then
var := sw(15 downto 8);
c <= var;
end if;
end process;

ld(15 downto 8)<=c;
ld(7 downto 0)<=b;

end Behavioral;