----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2020 12:11:57 PM
-- Design Name: 
-- Module Name: FSM_tb - Behavioral
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

entity FSM_tb is
end FSM_tb;

architecture tb of FSM_tb is

    component FSM
        port (Sensor_Sync : in std_logic;
              WR          : in std_logic;
              Prog_Sync   : in std_logic;
              expired     : in std_logic;
              Reset_Sync  : in std_logic;
              Clk         : in std_logic;
              LEDs        : out std_logic_vector (0 to 6);
              interval    : out std_logic_vector (0 to 1);
              start_timer : out std_logic;
              WR_Reset    : out std_logic);
    end component;

    signal Sensor_Sync : std_logic;
    signal WR          : std_logic;
    signal Prog_Sync   : std_logic;
    signal expired     : std_logic;
    signal Reset_Sync  : std_logic;
    signal Clk         : std_logic;
    signal LEDs        : std_logic_vector (0 to 6);
    signal interval    : std_logic_vector (0 to 1);
    signal start_timer : std_logic;
    signal WR_Reset    : std_logic;

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : FSM
    port map (Sensor_Sync => Sensor_Sync,
              WR          => WR,
              Prog_Sync   => Prog_Sync,
              expired     => expired,
              Reset_Sync  => Reset_Sync,
              Clk         => Clk,
              LEDs        => LEDs,
              interval    => interval,
              start_timer => start_timer,
              WR_Reset    => WR_Reset);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that Clk is really your main clock signal
    Clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        Sensor_Sync <= '0';
        WR <= '0';
        Prog_Sync <= '0';
        expired <= '0';
        Reset_Sync <= '0';

        -- tb for normal routine
--        wait until rising_edge(Clk);
--        expired <= '1';
--        Sensor_Sync <= '0';
--        wait until rising_edge(Clk);
--        expired <= '0';
--        wait until rising_edge(Clk);
--        wait until rising_edge(Clk);
--        wait until rising_edge(Clk);
--        wait until rising_edge(Clk);
--        expired <= '1';
--        wait until rising_edge(Clk);
--        expired <= '0';
--        wait until rising_edge(Clk);
--        wait until rising_edge(Clk);
--        wait until rising_edge(Clk);
--        wait until rising_edge(Clk);
        
--        expired <= '1';
--        wait until rising_edge(Clk);
--        expired <= '0';
--        wait until rising_edge(Clk);
--        wait until rising_edge(Clk);
--        wait until rising_edge(Clk);
--        wait until rising_edge(Clk);
        
--        expired <= '1';
--        Sensor_Sync <= '0';
--        wait until rising_edge(Clk);
--        expired <= '0';
--        wait until rising_edge(Clk);
--        wait until rising_edge(Clk);
--        wait until rising_edge(Clk);
--        wait until rising_edge(Clk);
        
--        expired <= '1';
--        wait until rising_edge(Clk);
--        expired <= '0';
--        wait until rising_edge(Clk);
--        wait until rising_edge(Clk);
--        wait until rising_edge(Clk);
--        wait until rising_edge(Clk);
        
        -- tb for Walk request
        wait until rising_edge(Clk);
        expired <= '1';
        Sensor_Sync <= '0';
        wait until rising_edge(Clk);
        expired <= '0';
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        expired <= '1';
        WR <= '1';
        wait until rising_edge(Clk);
        expired <= '0';
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        
        expired <= '1';
        wait until rising_edge(Clk);
        expired <= '0';
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        
        expired <= '1';
        Sensor_Sync <= '0';
        wait until rising_edge(Clk);
        expired <= '0';
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        
        expired <= '1';
        wait until rising_edge(Clk);
        expired <= '0';
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        
        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_FSM of FSM_tb is
    for tb
    end for;
end cfg_tb_FSM;
