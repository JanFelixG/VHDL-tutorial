library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity NCO is
    Port ( freqin : in STD_LOGIC;
           kontrollzahler : in std_logic_vector(31 downto 0);
           freqoutnco : out STD_LOGIC);
end NCO;

architecture Behavioral of NCO is

signal kontrollregister : std_logic_vector(31 downto 0);
signal freqintern : std_logic;
--signal freqininvert : std_logic;

begin

--freqininvert<=not freqin;

process(freqin)
begin
if(rising_edge(freqin)) then
kontrollregister<=kontrollregister+kontrollzahler;
if((kontrollregister+kontrollzahler)<kontrollregister) then
freqintern <= not freqintern;
end if;
end if;
end process;

freqoutnco<=freqintern;

end Behavioral;