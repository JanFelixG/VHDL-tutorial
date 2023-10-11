library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity updowncounter is
    Port ( uhr : in STD_LOGIC;
           schnelleuhr : in std_logic;
           kontroll0 : in STD_LOGIC;
           kontroll1 : in STD_LOGIC;
           registerwert : out STD_LOGIC_VECTOR (31 downto 0));
end updowncounter;

architecture Behavioral of updowncounter is

signal kontroll : std_logic_vector (1 downto 0);
signal registerintern : std_logic_vector (31 downto 0):="10000000000000000000000000000000";

begin

process(uhr,schnelleuhr,kontroll,kontroll0,kontroll1)
begin
if(rising_edge(uhr)) then
if(kontroll0='1' and kontroll1 ='0' and registerintern<"11111111111111111111111111111111") then
registerintern<=registerintern+1;
end if;
if(kontroll0='0' and kontroll1 ='1' and registerintern>"00000000000000000000000000000000") then
registerintern<=registerintern-1;
end if;
end if;
end process;

registerwert<=registerintern;

end Behavioral;
