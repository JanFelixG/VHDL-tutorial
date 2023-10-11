library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PFD is
    Port ( freqref,freqdiv : in STD_LOGIC;
           up,down : out STD_LOGIC);
end PFD;

architecture Behavioral of PFD is

signal upintern,downintern : std_logic;

begin

process(upintern,downintern,freqref,freqdiv)
begin
if((upintern and downintern)='1') then
upintern<='0';
downintern<='0';
else
if(rising_edge(freqref)) then
upintern<='1';
end if;
if(rising_edge(freqdiv)) then
downintern<='1';
end if;
end if;
end process;

up<=upintern;
down<=downintern;

end Behavioral;