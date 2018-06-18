----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.06.2018 17:14:30
-- Design Name: 
-- Module Name: tb_cpt_0_3 - Behavioral
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

entity tb_cpt_0_3 is
--  Port ( );
end tb_cpt_0_3;

architecture Behavioral of tb_cpt_0_3 is

component cpt_0_3 is
    Port ( clk : in STD_LOGIC;
           nreset : in STD_LOGIC;
           cpt : out STD_LOGIC_VECTOR (1 downto 0));
end component;

signal clk,nreset : std_logic := '0';
signal cpt : STD_LOGIC_VECTOR (1 downto 0) := "00";

begin
uut:cpt_0_3
port map(clk =>clk, nreset=>nreset,cpt=>cpt);
process
begin
clk <='0';
wait for 10ns;
clk<='1';
wait for 10ns;
end process;
process
begin
nreset <='0';
wait for 2000ns;
nreset<='1';
wait;
end process;


end Behavioral;
