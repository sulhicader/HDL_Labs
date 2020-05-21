----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2020 04:56:54 PM
-- Design Name: 
-- Module Name: Walk_Register - Behavioral
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

entity Walk_Register is
  Port ( WR_Sync : in STD_LOGIC;
         Clk : in STD_LOGIC;
         WR : out STD_LOGIC;
         WR_Reset : in STD_LOGIC);
end Walk_Register;

architecture Behavioral of Walk_Register is

begin
    process(WR_Sync ,WR_Reset ) is
        begin
            if rising_edge(Clk) then
                if WR_Sync='1'  then
                    WR <= '1';
                end if;
                if  WR_Reset='1' then
                    WR <= '0';
                end if;
            end if;
        end process;


end Behavioral;
