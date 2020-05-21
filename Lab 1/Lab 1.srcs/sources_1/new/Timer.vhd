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
  Port (Time_Parameter_Selector : in std_logic_vector(0 to 1);
        Time_Value : in std_logic_vector(0 to 3);
        Reset_Sync : in std_logic_vector;
        Prog_Sync : in std_logic_vector;
        interval : in std_logic_vector(0 to 1);
        value : out std_logic_vector(0 to 3));
        
end Timer;

architecture Behavioral of Timer is

begin


end Behavioral;
