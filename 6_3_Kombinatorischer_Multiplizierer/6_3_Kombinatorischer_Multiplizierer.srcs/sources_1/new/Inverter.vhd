library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Inverter is
    Port ( ein : in STD_LOGIC;
           aus : out STD_LOGIC);
end Inverter;

architecture Behavioral of Inverter is

begin

aus <= not ein;

end Behavioral;
