----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2020 04:31:57 PM
-- Design Name: 
-- Module Name: synchronizer - Behavioral
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

entity synchronizer is
    Port ( Reset : in STD_LOGIC;
           Reprogram : in STD_LOGIC;
           Sensor : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Walk_request : in STD_LOGIC;
           Prog_Sync : out STD_LOGIC;
           WR_Sync : out STD_LOGIC;
           Sensor_Sync : out STD_LOGIC;
           Reset_Sync : out STD_LOGIC);
end synchronizer;

architecture Behavioral of synchronizer is
    begin
        process(Clk) is
        begin
            if rising_edge(Clk) then
                if Reset='1'  then
                    Reset_Sync <= '1';
                else
                    Reset_Sync <= '0';
                end if;
                
                if Reprogram='1'  then
                    Prog_Sync <= '1';
                else
                    Prog_Sync <= '0';
                end if;
                    
                if Sensor='1'  then
                    Sensor_Sync <= '1';
                else
                    Sensor_Sync <= '0';
                end if;
                
                if Walk_request='1'  then
                    WR_Sync <= '1';
                else
                    WR_Sync <= '0';
                end if;
            end if;
          end process;
    
end Behavioral;
