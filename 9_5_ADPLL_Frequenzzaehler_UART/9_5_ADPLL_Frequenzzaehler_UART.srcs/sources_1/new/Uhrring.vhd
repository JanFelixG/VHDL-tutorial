library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity ringuhr is
    Port (freqout : out STD_LOGIC);
end ringuhr;

architecture Behavioral of ringuhr is

component Inverter is
    Port ( ein : in STD_LOGIC;
           aus : out STD_LOGIC);
end component;

signal a1,a2,a3 : std_logic;

begin


Inv1: Inverter port map(ein=>a1,aus=>a2);
Inv2: Inverter port map(ein=>a2,aus=>a3);
Inv3: Inverter port map(ein=>a3,aus=>a1);

freqout<=a1;

end Behavioral;