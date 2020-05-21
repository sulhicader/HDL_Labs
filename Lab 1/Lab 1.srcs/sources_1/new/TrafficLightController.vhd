----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2020 10:43:48 PM
-- Design Name: 
-- Module Name: TrafficLightController - Behavioral
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

entity TrafficLightController is
  Port (   Reset : in STD_LOGIC;
           Reprogram : in STD_LOGIC;
           Sensor : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Walk_request : in STD_LOGIC;
           Time_Parameter_Selector : in std_logic_vector(0 to 1);
           Time_Value : in std_logic_vector(0 to 3);
           LEDs : out STD_LOGIC_VECTOR(0 to 6)  );
end TrafficLightController;

architecture Behavioral of TrafficLightController is

component synchronizer is
    Port ( Reset : in STD_LOGIC;
           Reprogram : in STD_LOGIC;
           Sensor : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Walk_request : in STD_LOGIC;
           Prog_Sync : out STD_LOGIC;
           WR_Sync : out STD_LOGIC;
           Sensor_Sync : out STD_LOGIC;
           Reset_Sync : out STD_LOGIC);
    end component;

component Walk_Register is
  Port ( WR_Sync : in STD_LOGIC;
         Clk : in STD_LOGIC;
         WR : out STD_LOGIC;
         WR_Reset : in STD_LOGIC);
    end component;
    
component FSM is
    Port ( Sensor_Sync : in STD_LOGIC;
           WR : in STD_LOGIC;
           Prog_Sync : in STD_LOGIC;
           expired : in STD_LOGIC;
           Reset_Sync : in STD_LOGIC;
           Clk : in STD_LOGIC;
           LEDs : out STD_LOGIC_VECTOR(0 to 6);
           interval : out STD_LOGIC_VECTOR(0 to 1);
           start_timer : out STD_LOGIC;
           WR_Reset : out STD_LOGIC );
    end component;

component Time_Parameters is
  Port (Time_Parameter_Selector : in std_logic_vector(0 to 1);
        Time_Value : in std_logic_vector(0 to 3);
        interval : in std_logic_vector(0 to 1);
        Clk : in std_logic;
        Reset_Sync : in std_logic;
        Prog_Sync : in std_logic;
        value : out std_logic_vector(0 to 3));
    end component;
    
component Timer is
  Port (Reset_Sync : in STD_LOGIC;
        hz_enable : in STD_LOGIC;
        Clk : in STD_LOGIC;
        start_timer : in STD_LOGIC;
        expired : out STD_LOGIC;
        value : in std_logic_vector(0 to 3));
    end component;
    
component Divider is
  Port (Clk : in std_logic;
        Reset_Sync : in std_logic;
        Enable_1Hz : out std_logic);
    end component;
    
signal Prog_Sync : std_logic;
signal WR_Sync : std_logic;
signal Reset_Sync : std_logic;
signal Sensor_Sync : std_logic;
signal hz_enable : std_logic;
signal start_timer : std_logic;
signal value : std_logic_vector(0 to 3);
signal expired : std_logic;
signal WR_Reset : std_logic;
signal WR : std_logic;
signal interval : STD_LOGIC_VECTOR(0 to 1);


begin

synchronizer_1 : synchronizer
    port map ( Reset => Reset,
           Reprogram => Reprogram,
           Sensor => Sensor,
           Clk => Clk,
           Walk_request =>Walk_request,
           Prog_Sync => Prog_Sync,
           WR_Sync => WR_Sync,
           Sensor_Sync => Sensor_Sync,
           Reset_Sync => Reset_Sync );

timer_1 : Timer
    port map ( Reset_Sync => Reset_Sync,
           hz_enable => hz_enable,
           Clk => Clk,
           start_timer =>start_timer,
           expired => expired,
           value => value);
           
walk_register_1 : Walk_Register
    port map ( WR_Sync => WR_Sync,
           WR => WR,
           Clk => Clk,
           WR_Reset =>WR_Reset);
           
fsm_1 : FSM
    port map ( 
           WR => WR,
           Sensor_Sync => Sensor_Sync,
           Clk => Clk,
           start_timer =>start_timer,
           expired => expired,
           interval => interval,
           LEDs => LEDs,
           WR_Reset => WR_Reset,
           Prog_Sync => Prog_Sync,
           Reset_Sync => Reset_Sync );
          
time_parameter_1 : Time_Parameters
    port map ( Time_Parameter_Selector => Time_Parameter_Selector,
           Time_Value => Time_Value,
           Clk => Clk,
           value => value,
           interval => interval,
           Prog_Sync => Prog_Sync,
           Reset_Sync => Reset_Sync );  

divider_1 : Divider
    port map ( 
           Enable_1Hz => hz_enable,
           Clk => Clk,
           Reset_Sync => Reset_Sync ); 

end Behavioral;
