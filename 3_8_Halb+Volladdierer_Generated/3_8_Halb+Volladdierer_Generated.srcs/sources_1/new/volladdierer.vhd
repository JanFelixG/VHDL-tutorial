----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2019 09:31:00
-- Design Name: 
-- Module Name: volladdierer - Behavioral
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

entity volladdierer is
    Port ( A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           cin : in STD_LOGIC;
           Ubertrag : out STD_LOGIC;
           Summe : out STD_LOGIC);
end volladdierer;

architecture Behavioral of volladdierer is

signal wire1,wire2,wire3 : std_logic;

begin

wire1 <= A1 xor A2;
wire2 <= wire1 and cin;
wire3 <= A1 and A2;
 
Summe <= wire1 xor cin;
Ubertrag <= wire2 or wire3;

end Behavioral;
