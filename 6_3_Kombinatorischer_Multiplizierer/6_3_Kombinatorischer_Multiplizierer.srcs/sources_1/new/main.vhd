library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity main is
    Port ( sw : in STD_LOGIC_vector(15 downto 0);
           ld :out STD_LOGIC_vector(15 downto 0));
end main;

architecture Behavioral of main is

Signal temp: std_logic_vector (15 downto 0):="0000000000000000";
signal e,d : unsigned (15 downto 0);
signal i : natural:=7;
signal f : unsigned(7 downto 0);

type zahlvek is array (7 downto 0) of unsigned(15 downto 0); 
signal gg : zahlvek;

begin

temp<= X"00" & sw(15 downto 8);
e<=unsigned(temp);
f<=unsigned(sw(7 downto 0));

process
begin

for i in 0 to 7 loop
if(f(i)='1') then
gg(i)<=shift_left(e,i);
else
gg(i)<=d;
end if;
end loop;
end process;

ld<= std_logic_vector(gg(0)+gg(1)+gg(2)+gg(3)+gg(4)+gg(5)+gg(6)+gg(7));

end Behavioral;