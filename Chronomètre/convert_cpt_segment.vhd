----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.06.2018 12:11:35
-- Design Name: 
-- Module Name: convert_cpt_segment - Behavioral
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

entity convert_cpt_segment is
    Port ( cpt : in STD_LOGIC_VECTOR (3 downto 0);
           segment : out STD_LOGIC_VECTOR (6 downto 0));
end convert_cpt_segment;

architecture Behavioral of convert_cpt_segment is

begin
process(cpt)
begin 

case cpt is
    when "0000" => segment <= "1000000"; 
    when "0001" => segment <= "1111001";
    when "0010" => segment <= "0100100";
    when "0011" => segment <= "0110000";
    when "0100" => segment <= "0011001";
    when "0101" => segment <= "0010010";
    when "0110" => segment <= "0000010";
    when "0111" => segment <= "1111000";
    when "1000" => segment <= "0000000";
    when "1001" => segment <= "0010000";
    when others => segment <= "1111111";
end case;

end process;
end Behavioral;
