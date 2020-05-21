----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2020 04:57:47 PM
-- Design Name: 
-- Module Name: Divider - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Divider is
  Port (Clk : in std_logic;
        Reset_Sync : in std_logic;
        Enable_1Hz : out std_logic);
end Divider;

architecture Behavioral of Divider is
signal wrap : std_logic:= '0';
signal count : integer := 0;
constant clk_period : integer := 50000000 ;

begin
    process (Clk, Reset_Sync)
    begin
    if (Reset_Sync = '1') then
        count <= 0;
        wrap <= '0';
    else if rising_edge(clk) then
        if (count = clk_period) then
            wrap <= '1';
            count <= 0;
        else
            wrap <= '0';
            count <= count+1;
        end if;
    end if;
    end if;
    end process;

    Enable_1Hz <= wrap;

end Behavioral;
