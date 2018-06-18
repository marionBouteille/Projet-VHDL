----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.06.2018 11:26:33
-- Design Name: 
-- Module Name: div_horl - Behavioral
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

entity div_horl is
    Port ( clk : in STD_LOGIC;
            nreset : in STD_LOGIC;
           s : out STD_LOGIC );
end div_horl;

architecture Behavioral of div_horl is

    signal cpt_int : STD_LOGIC_VECTOR(26 downto 0) := (others => '0');
    signal etat : STD_LOGIC := '0'; 

begin
process(clk, nreset)
begin
--reset actif
if(nreset='1') then
     cpt_int <= (others => '0');
elsif(clk'event and clk='1') then
      --représente 1 seconde
     if(cpt_int ="10") then
         if(etat='0') then
             s <= '1';
             etat <='1';
         elsif(etat='1') then
             s <='0';
             etat <='0';
         end if;
         cpt_int <= (others => '0');
     else
     cpt_int <= cpt_int + 1;
      end if;   
end if; 
end process;


end Behavioral;
