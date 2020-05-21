----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2020 08:00:05 PM
-- Design Name: 
-- Module Name: Devider_tb - Behavioral
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


entity Divider_tb is
end Divider_tb;

architecture tb of Divider_tb is

    component Divider
        port (Clk        : in std_logic;
              Reset_Sync : in std_logic;
              Enable_1Hz : out std_logic);
    end component;

    signal Clk        : std_logic;
    signal Reset_Sync : std_logic;
    signal Enable_1Hz : std_logic;

    constant TbPeriod : time := 0.01 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : Divider
    port map (Clk        => Clk,
              Reset_Sync => Reset_Sync,
              Enable_1Hz => Enable_1Hz);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that Clk is really your main clock signal
    Clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        Reset_Sync <= '0';

        -- EDIT Add stimuli here
        wait for 100000 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_Divider of Divider_tb is
    for tb
    end for;
end cfg_tb_Divider;