----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2020 04:59:36 PM
-- Design Name: 
-- Module Name: Time_Parameters - Behavioral
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

entity Time_Parameters is
  Port (Time_Parameter_Selector : in std_logic_vector(0 to 1);
        Time_Value : in std_logic_vector(0 to 3);
        interval : in std_logic_vector(0 to 1);
        Clk : in std_logic;
        Reset_Sync : in std_logic;
        Prog_Sync : in std_logic;
        value : out std_logic_vector(0 to 3));
end Time_Parameters;

architecture Behavioral of Time_Parameters is

signal tBASE : STD_LOGIC_VECTOR(0 to 3);
signal tEX : STD_LOGIC_VECTOR(0 to 3);
signal tYEL : STD_LOGIC_VECTOR(0 to 3); 

begin
    process(Clk, Reset_Sync) is
    begin
    if (Reset_Sync = '1') then
        tBASE <= "0110";
        tEX <= "0011";
        tYEL <= "0010";
    else
        if rising_edge(clk) then
            if (Prog_Sync='1') then
                case Time_Parameter_Selector is
                    when "00" =>
                        tBASE <= Time_Value;
                    when "01" =>
                        tEX <= Time_Value;
                    when "10" =>
                        tYEL <= Time_Value;
                 end case;
            else
                case interval is
                    when "00" =>
                        value <= tBASE;
                    when "01" =>
                        value <= tEX;
                    when "10" =>
                        value <= tYEL;
                end case;
             end if;
        end if;
    end if;
    end process;

end Behavioral;
