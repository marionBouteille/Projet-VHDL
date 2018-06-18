----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.06.2018 11:59:29
-- Design Name: 
-- Module Name: convert_cpt_pin - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity convert_cpt_pin is
    Port ( cpt : in STD_LOGIC_VECTOR (1 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0));
end convert_cpt_pin;

architecture Behavioral of convert_cpt_pin is

begin
process(cpt)
begin
if(cpt = "00") then 
    anode <= "1110";-- on allume AN0 : les unités secondes
elsif(cpt = "01") then 
    anode <= "1101";-- on allume AN1 : les dixaines secondes
elsif(cpt = "10") then 
   anode <= "1011";-- on allume AN2 : les unités minutes
elsif(cpt = "11") then 
    anode <= "0111";-- on allume AN3 : les dixaines minutes
end if;
end process;
end Behavioral;
