library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.numeric_std.ALL;

entity main is
    Port ( sw : in STD_LOGIC_vector(15 downto 0);
           uhr : in std_logic;
           btnd : in std_logic;
           ld :out STD_LOGIC_vector(15 downto 0));
end main;

architecture Behavioral of main is

Signal zustand : std_logic_vector (2 downto 0):="000";
Signal teiler : std_logic_vector (32 downto 0);

begin

process(zustand,sw,uhr,teiler)
begin
if(rising_edge(uhr)) then
if(btnd='1') then
zustand<="000";
else
case zustand is
when "000" =>
if (sw="000001") then
zustand<="001";
end if;

when "001" =>
if (sw="000010") then
zustand<="010";
end if;

when "010" =>
if (sw="000100") then
zustand<="011";
end if;

when "011" =>
if (sw="001000") then
zustand<="100";
end if;

when "100" =>
if (sw="010000") then
zustand<="101";
end if;

when "101" =>
if (sw="100000") then
zustand<="000";
end if;
when others=>
zustand<="000";
end case;
end if;
end if;
end process;

process(zustand)
begin
case zustand is
when "000" =>
ld(0)<='1';
ld(1)<='1';
ld(2)<='0';
ld(3)<='0';
ld(4)<='0';
ld(5)<='0';
ld(6)<='0';
ld(7)<='0';
ld(8)<='0';
ld(9)<='0';
ld(10)<='0';
ld(11)<='0';
when "001" =>
ld(0)<='0';
ld(1)<='0';
ld(2)<='1';
ld(3)<='1';
ld(4)<='0';
ld(5)<='0';
ld(6)<='0';
ld(7)<='0';
ld(8)<='0';
ld(9)<='0';
ld(10)<='0';
ld(11)<='0';
when "010" =>
ld(0)<='0';
ld(1)<='0';
ld(2)<='0';
ld(3)<='0';
ld(4)<='1';
ld(5)<='1';
ld(6)<='0';
ld(7)<='0';
ld(8)<='0';
ld(9)<='0';
ld(10)<='0';
ld(11)<='0';
when "011" =>
ld(0)<='0';
ld(1)<='0';
ld(2)<='0';
ld(3)<='0';
ld(4)<='0';
ld(5)<='0';
ld(6)<='1';
ld(7)<='1';
ld(8)<='0';
ld(9)<='0';
ld(10)<='0';
ld(11)<='0';
when "100" =>
ld(0)<='0';
ld(1)<='0';
ld(2)<='0';
ld(3)<='0';
ld(4)<='0';
ld(5)<='0';
ld(6)<='0';
ld(7)<='0';
ld(8)<='1';
ld(9)<='1';
ld(10)<='0';
ld(11)<='0';
when "101" =>
ld(0)<='0';
ld(1)<='0';
ld(2)<='0';
ld(3)<='0';
ld(4)<='0';
ld(5)<='0';
ld(6)<='0';
ld(7)<='0';
ld(8)<='0';
ld(9)<='0';
ld(10)<='1';
ld(11)<='1';
when others=>
ld(0)<='1';
ld(1)<='0';
ld(2)<='1';
ld(3)<='0';
ld(4)<='1';
ld(5)<='0';
ld(6)<='1';
ld(7)<='0';
ld(8)<='1';
ld(9)<='0';
ld(10)<='1';
ld(11)<='0';
end case;
end process;
end Behavioral;