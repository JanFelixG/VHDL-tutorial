----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2019 00:01:36
-- Design Name: 
-- Module Name: halbaddierer - Behavioral
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

entity halbaddierer is
    Port ( A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           Ubertrag : out STD_LOGIC;
           Summe : out STD_LOGIC);
end halbaddierer;

architecture Behavioral of halbaddierer is

begin

Ubertrag <= A1 and A2;
Summe <= A1 xor A2;

end Behavioral;
