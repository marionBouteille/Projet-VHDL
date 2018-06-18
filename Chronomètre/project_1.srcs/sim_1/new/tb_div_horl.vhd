----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.06.2018 12:14:20
-- Design Name: 
-- Module Name: tb_div_horl - Behavioral
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

entity tb_div_horl is
--  Port ( );
end tb_div_horl;

architecture Behavioral of tb_div_horl is
component div_horl is
    Port ( clk : in STD_LOGIC;
           nreset : in STD_LOGIC;
           s : out STD_LOGIC);
end component;

signal clk,nreset,s : std_logic := '0';
begin
uut:div_horl
--meme ordre que dans la declaration du component 
--component => signal
port map(clk =>clk, nreset=>nreset,s=>s);
process
    begin   
        clk<='0';
        wait for 10ns;
        clk<='1';
        wait for 10ns; 
end process;

process
    begin
        nreset <='0';
        wait for 1000ns;
        nreset <='1';
        wait; 
end process;
end Behavioral;
