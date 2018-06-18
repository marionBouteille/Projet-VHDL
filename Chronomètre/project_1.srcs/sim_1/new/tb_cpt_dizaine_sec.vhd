----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.06.2018 11:13:03
-- Design Name: 
-- Module Name: tb_cpt_dizaine_sec - Behavioral
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

entity tb_cpt_dizaine_sec is
--  Port ( );
end tb_cpt_dizaine_sec;

architecture Behavioral of tb_cpt_dizaine_sec is
component cpt_dizaine_sec is
    Port ( clk : in STD_LOGIC;
           nreset : in STD_LOGIC;
           dizaine : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal clk,nreset : std_logic := '0';
signal dizaine : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin
uut:cpt_dizaine_sec
port map(clk =>clk, nreset=>nreset,dizaine=>dizaine);
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
