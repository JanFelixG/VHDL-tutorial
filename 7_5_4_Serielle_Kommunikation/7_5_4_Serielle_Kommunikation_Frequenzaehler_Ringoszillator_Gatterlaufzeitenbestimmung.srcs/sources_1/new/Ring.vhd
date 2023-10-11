library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity ring is
    Port (uhr_ring : out std_logic);
end ring;

architecture Behavioral of ring is

component Inverter is
    Port ( ein : in STD_LOGIC;
           aus : out STD_LOGIC);
end component;

Signal a,b : std_logic_vector (4 downto 0);

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

uhr_ring<=b(0);

end Behavioral;