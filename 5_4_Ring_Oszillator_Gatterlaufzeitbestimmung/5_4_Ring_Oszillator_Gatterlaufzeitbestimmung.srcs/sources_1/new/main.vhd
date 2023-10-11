library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity main is
    Port ( sw : in STD_LOGIC_vector(15 downto 0);
           ld :out STD_LOGIC_vector(15 downto 0));
end main;

architecture Behavioral of main is

component Inverter is
    Port ( ein : in STD_LOGIC;
           aus : out STD_LOGIC);
end component;

Signal a,b : std_logic_vector (4 downto 0);
signal teiler : std_logic_vector (31 downto 0);

begin

GEN_INV:
for i in 0 to 4 generate
inve0:
if (i=0) generate
inv1 : Inverter port map
(ein=>b(4),aus=>b(i));
end generate;
inve1:
if(i/=0) generate
inv1 : Inverter port map
(ein=>b(i-1),aus=>b(i));
end generate;
end generate;

process(b,teiler)
begin

if(rising_edge(b(0))) then
teiler<=teiler+1;
end if;
--ld(0)<=teiler(18);
--ld(1)<=teiler(19);
--ld(2)<=teiler(20);
--ld(3)<=teiler(21);
--ld(4)<=teiler(22);
--ld(5)<=teiler(23);
--ld(6)<=teiler(24);
--ld(7)<=teiler(25);
--ld(9)<=teiler(26);
--ld(10)<=teiler(27);
--ld(11)<=teiler(28);
ld(12)<=teiler(29);
--ld(13)<=teiler(30);
--ld(14)<=teiler(31);
--ld(15)<=teiler(12);


end process;

end Behavioral;