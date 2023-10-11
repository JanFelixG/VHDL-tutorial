----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2019 20:25:45
-- Design Name: 
-- Module Name: main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( sw : in STD_LOGIC_vector(15 downto 0);
           ld :out STD_LOGIC_vector(15 downto 0));
end main;

architecture Behavioral of main is

component halbaddierer is
port(A1 : in STD_LOGIC;
     A2 : in STD_LOGIC;
     Ubertrag : out STD_LOGIC;
     Summe : out STD_LOGIC);
end component;

component volladdierer is
port(A1 : in STD_LOGIC;
     A2 : in STD_LOGIC;
     cin : in std_logic;
     Ubertrag : out STD_LOGIC;
     Summe : out STD_LOGIC);
end component;

Signal a,b,cin,u,s : std_logic_vector (3 downto 0);

begin

a(0)<=sw(1);
a(1)<=sw(2);
a(2)<=sw(3);
a(3)<=sw(4);
b(0)<=sw(5);
b(1)<=sw(6);
b(2)<=sw(7);
b(3)<=sw(8);

GENs_voll:
for i in 0 to 3 generate
vollex : volladdierer port map
(A1=>a(i),A2=>b(i),cin=>cin(i),Ubertrag=>u(i),Summe=>s(i));
end generate GENs_voll;

cin(3)<=u(2);
cin(2)<=u(1);
cin(1)<=u(0);
cin(0)<=sw(0);


ld(1)<=s(0);
ld(2)<=s(1);
ld(3)<=s(2);
ld(4)<=s(3);
ld(5)<=u(3);

end Behavioral;
