----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2020 04:58:46 PM
-- Design Name: 
-- Module Name: Timer - Behavioral
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
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Timer is
  Port (Reset_Sync : in STD_LOGIC;
        hz_enable : in STD_LOGIC;
        Clk : in STD_LOGIC;
        start_timer : in STD_LOGIC;
        expired : out STD_LOGIC;
        value : in std_logic_vector(0 to 3));
        
end Timer;

architecture Behavioral of Timer is
signal wrap : std_logic := '0';
signal count : integer := 0;
signal int_value : integer := to_integer(signed(value));
    
begin
    process (Clk, Reset_Sync)
    begin
    if (Reset_Sync = '1') then
        count <= 0;
        wrap <= '0';
    else
        if (start_timer='1') then 
            if rising_edge(clk) then            
                if (count = int_value) then
                    wrap <= '1';
                    count <= 0;
                else
                    wrap <= '0';
                    if (hz_enable='1') then
                        count <= count + 1;
                    end if;
                end if;
            end if;
        end if;
    end if;
    end process;
    expired <= wrap;
end Behavioral;
