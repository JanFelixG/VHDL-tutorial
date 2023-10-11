library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( sw : in STD_LOGIC_vector(15 downto 0);
           uhr,btnd : in std_logic;
           ld :out STD_LOGIC_vector(15 downto 0));
end main;

architecture Behavioral of main is

signal a,b,c : std_logic_vector(7 downto 0);
signal vergleich : std_logic;

function vergleicher(vec1,vec2 : std_logic_vector(7 downto 0))
return std_logic is
variable temp : std_logic;
begin
for i in 7 downto 0 loop
if(vec1(i)='1' and vec2(i)='0') then
temp := '1';
exit;
elsif(vec1(i)='0' and vec2(i)='1') then
temp := '0';
exit;
else
temp := '0';
end if;
end loop;
return temp;
end vergleicher;


begin

a<=sw(15 downto 8);
b<=sw(7 downto 0);

ld(0)<=vergleicher(b,a);

end Behavioral;