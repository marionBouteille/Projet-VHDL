----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.06.2018 17:11:18
-- Design Name: 
-- Module Name: cpt_0_3 - Behavioral
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

entity cpt_0_3 is
    Port ( clk : in STD_LOGIC;
           nreset : in STD_LOGIC;
           cpt : out STD_LOGIC_VECTOR (1 downto 0));
end cpt_0_3;

architecture Behavioral of cpt_0_3 is

signal cpt_int : STD_LOGIC_VECTOR (1 downto 0) := "00";
begin
process(clk,nreset)
begin

if(nreset='1') then
    cpt_int <= (others => '0');
elsif(clk'event and clk='1')  then 
    if(cpt_int = "11") then
        cpt_int <= (others => '0');
    else
    cpt_int <= cpt_int + 1;
    end if;
end if;
end process;
cpt <= cpt_int; 

end Behavioral;
