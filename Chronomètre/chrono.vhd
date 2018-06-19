----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.06.2018 14:59:17
-- Design Name: 
-- Module Name: chrono - Behavioral
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

entity chrono is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           stop : in STD_LOGIC;
           segment : out STD_LOGIC_VECTOR (6 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0));
end chrono;

architecture Behavioral of chrono is

component div_horl is
    Port ( clk : in STD_LOGIC;
           nreset : in STD_LOGIC;
           stop : in STD_LOGIC;
           s : out STD_LOGIC);
end component;

component div_horl2 is
    Port ( clk : in STD_LOGIC;
           nreset : in STD_LOGIC;
           s : out STD_LOGIC);
end component;

component cpt_unite_sec is
    Port ( clk : in STD_LOGIC;
           nreset : in STD_LOGIC;
           unite : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component cpt_dizaine_sec is
    Port ( clk : in STD_LOGIC;
           nreset : in STD_LOGIC;
           dizaine : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component cpt_unite_min is
    Port ( clk : in STD_LOGIC;
           nreset : in STD_LOGIC;
           unite : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component cpt_dizaine_min is
    Port ( clk : in STD_LOGIC;
           nreset : in STD_LOGIC;
           dizaine : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component cpt_0_3 is
    Port ( clk : in STD_LOGIC;
           nreset : in STD_LOGIC;
           cpt : out STD_LOGIC_VECTOR (1 downto 0));
end component;

component multiplexeur is 
    Port ( E0 : in STD_LOGIC_VECTOR (3 downto 0);
           E1 : in STD_LOGIC_VECTOR (3 downto 0);
           E2 : in STD_LOGIC_VECTOR (3 downto 0);
           E3 : in STD_LOGIC_VECTOR (3 downto 0);
           SEL0 : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component convert_cpt_segment is 
    Port ( cpt : in STD_LOGIC_VECTOR (3 downto 0);
           segment : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component convert_cpt_pin is 
    Port ( cpt : in STD_LOGIC_VECTOR (1 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0));
end component;



signal horl_sec, horl_ms : std_logic := '0';
signal unite_sec, dizaine_sec, unite_min, dizaine_min, multiplex : std_logic_vector(3 downto 0);
signal cpt_int: std_logic_vector(1 downto 0);

begin
i0 : div_horl
port map(clk=>clk, nreset=>reset,stop=>stop, s=>horl_sec);

i1 : cpt_unite_sec
port map(clk=>horl_sec, nreset=>reset, unite=>unite_sec);

i2 : cpt_dizaine_sec
port map(clk=>horl_sec, nreset=>reset, dizaine=>dizaine_sec);

i3 : cpt_unite_min
port map(clk=>horl_sec, nreset=>reset, unite=>unite_min);

i4 : cpt_dizaine_min
port map(clk=>horl_sec, nreset=>reset, dizaine=>dizaine_min);

i5 : cpt_0_3
port map(clk=>horl_ms, nreset=>reset, cpt=>cpt_int);

i6 : multiplexeur
port map(E0=>unite_sec, E1=>dizaine_sec, E2=>unite_min, E3=>dizaine_min, SEL0=>cpt_int, S=>multiplex);

i7 : convert_cpt_segment
port map(cpt=>multiplex,segment=>segment);

i8 : convert_cpt_pin
port map(cpt=>cpt_int,anode=>anode);

i9 : div_horl2
port map(clk=>clk, nreset=>reset, s=>horl_ms);

end Behavioral;
