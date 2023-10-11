library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity frequenzmessung is
    Port ( uhr_ref,uhr_mess : in std_logic;
           frequenz : out std_logic_vector(63 downto 0));
end frequenzmessung;

architecture Behavioral of frequenzmessung is

signal zahler : std_logic_vector (63 downto 0);

begin

process(uhr_mess)
begin
if(rising_edge(uhr_mess)) then
zahler<=zahler+1;
end if;
end process;

process(uhr_ref)
variable zahltemp0,zahltemp1,zahltemp2: std_logic_vector (63 downto 0);
variable teiler : std_logic_vector(26 downto 0) :="101111101011110000011111111";
begin
if(falling_edge(uhr_ref)) then
if(teiler ="000000000000000000000000000") then
zahltemp1:=zahler;
zahltemp0:=zahltemp1-zahltemp2;
zahltemp2:=zahltemp1;
teiler:="101111101011110000011111111";
else
teiler:=teiler-1;
end if;
end if;
frequenz<=zahltemp0;
end process;

end Behavioral;