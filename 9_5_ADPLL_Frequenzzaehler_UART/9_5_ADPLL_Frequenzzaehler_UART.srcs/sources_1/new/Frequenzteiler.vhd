library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity FD is
    Port ( freqin : in STD_LOGIC;
           teilfak: in std_logic_vector (15 downto 0);
           freqout : out STD_LOGIC);
end FD;

architecture Behavioral of FD is

signal teilzahl : std_logic_vector(15 downto 0);
signal freqintern : std_logic;

begin

process(freqin)
begin
if(rising_edge(freqin)) then
if(teilzahl="0000000000000000") then
teilzahl<=teilfak;
freqintern<=not freqintern;
else
teilzahl<=teilzahl-1;
end if;
end if;
end process;

freqout<=freqintern;

end Behavioral;