library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity LowPassFilter is
    Port ( regin : in STD_LOGIC_vector (31 downto 0);
           uhr : std_logic;
           regout : out STD_LOGIC_vector (31 downto 0));
end LowPassFilter;

architecture Behavioral of LowPassFilter is

type regarr is array (0 to 29) of unsigned (31 downto 0);
signal inte : regarr;

--signal zahler : std_logic_vector (4 downto 0);

begin

process(uhr)
variable inte1 : regarr;
variable zahler : integer;
variable schnitt : unsigned (63 downto 0);
--variable schnitt1 : unsigned (63 downto 0);
variable regarrlen : integer :=30;
begin
if(rising_edge(uhr)) then
for i in 0 to regarrlen-2 loop
inte1(i) := inte1(i+1);
end loop;
inte1(regarrlen-1) := unsigned(regin);
for i in 0 to regarrlen-1 loop
schnitt := schnitt+(inte1(i));
end loop;
schnitt := schnitt/regarrlen;
end if;
regout<=std_logic_vector(schnitt(31 downto 0));
end process;

end Behavioral;