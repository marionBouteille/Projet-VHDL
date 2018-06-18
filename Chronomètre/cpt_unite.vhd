----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.06.2018 16:37:58
-- Design Name: 
-- Module Name: cpt_unite - Behavioral
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

entity cpt_unite is
    Port ( clk : in STD_LOGIC;
           nreset : in STD_LOGIC;
           unite : out STD_LOGIC_VECTOR (3 downto 0));
end cpt_unite;

architecture Behavioral of cpt_unite is
signal cpt_int : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin
process(clk)
begin

if(nreset='1') then
    cpt_int <= (others => '0');
elsif(clk'event and clk='1')  then 
    if(cpt_int = "1001") then
        cpt_int <= (others => '0');
    else
    cpt_int <= cpt_int + 1;
    end if;
end if;
end process;
unite <= cpt_int; 


end Behavioral;
