----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.06.2018 11:22:51
-- Design Name: 
-- Module Name: cpt_dizaine_min - Behavioral
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

entity cpt_dizaine_min is
    Port ( clk : in STD_LOGIC;
           nreset : in STD_LOGIC;
           dizaine : out STD_LOGIC_VECTOR (3 downto 0));
end cpt_dizaine_min;

architecture Behavioral of cpt_dizaine_min is
signal cpt_int : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
signal resu : STD_LOGIC_VECTOR(3 downto 0) :="0000";
begin

process(clk,nreset)
begin

if(nreset='1') then
    cpt_int <= (others => '0');
    resu <= (others =>'0');
elsif(clk'event and clk='1')  then 
 if(cpt_int ="1001011000") then
    if(resu = "0101") then
        resu <= (others => '0');
        cpt_int <= (others => '0');
    else
        cpt_int <= (others => '0');
        resu <= resu +1;
    end if;
  else
    cpt_int <= cpt_int + 1;
  end if;
end if;
end process;
dizaine <= resu; 

end Behavioral;
