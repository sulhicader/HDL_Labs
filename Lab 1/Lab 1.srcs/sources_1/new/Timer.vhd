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
    signal time_left : STD_LOGIC_VECTOR(0 to 3) ;
    signal started : STD_LOGIC := '0' ;
    
begin
    process(Clk) is
        begin
            if rising_edge(Clk) then
                if Reset_Sync='1'  then
                    time_left <= value;
                end if;
                
                if (start_timer = '1' and and started ='0'):
                    
                end if;
                
                
                
            end if;
    end process;
end Behavioral;
