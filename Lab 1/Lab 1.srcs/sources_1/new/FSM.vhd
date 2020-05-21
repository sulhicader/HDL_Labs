----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2020 10:00:05 PM
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM is
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
end FSM;

architecture Behavioral of FSM is
    constant tB : STD_LOGIC_VECTOR(0 to 1) := "00";
    constant tE : STD_LOGIC_VECTOR(0 to 1) := "01";
    constant tY : STD_LOGIC_VECTOR(0 to 1) := "10";
    -- Mr My Mg Sr Sy Sg W
    constant P1 : STD_LOGIC_VECTOR(0 to 6) := "0011000";
    constant P2 : STD_LOGIC_VECTOR(0 to 6) := "0101000";
    constant P3 : STD_LOGIC_VECTOR(0 to 6) := "1000010";
    constant P4 : STD_LOGIC_VECTOR(0 to 6) := "1000100";
    constant P5 : STD_LOGIC_VECTOR(0 to 6) := "1001001";
    
    type t_state is (A, B, C, D, E, F, G, H);
    signal State : t_state;

begin
    process(Clk) is
    begin
        if rising_edge(Clk) then
            if Prog_Sync='1' or Reset_Sync='1' then
                -- Reset values
                State <= A; 
                LEDs <= P1;
                interval <= tB;
                start_timer <= '0';
                WR_Reset <= '0';
            
            else
                -- Default values
--                State <= A; 
--                LEDs <= P1;
--                interval <= tB;
                start_timer <= '0';
--                WR_Reset <= '0';
                
                case State is
                    -- Main Green for tBASE secs
                    when A =>
                        LEDs <= P1;
                        interval <= tB;
                        start_timer <= '1';
                        if expired='1' and Sensor_Sync='0' then
                            State <= B;
                        elsif expired='1' and Sensor_Sync='1' then
                            State <= C; 
                        end if;
                    
                    -- Main green for another tBase secs
                    when B =>
                        LEDs <= P1;
                        interval <= tB;
                        start_timer <= '1';
                        if expired='1' then
                            State <= D; 
                        end if;
                    
                    -- Main green for another tExt secs
                    when C =>
                        LEDs <= P1;
                        interval <= tE;
                        start_timer <= '1';
                        if expired='1' then
                            State <= D;
                        end if;
                    
                    -- Main yellow for tYel secs
                    when D =>
                        LEDs <= P2;
                        interval <= tY;
                        start_timer <= '1';
                        if expired='1' and WR='1' then
                            State <= E;
                        elsif expired='1' and WR='0' then
                            State <= F;
                        end if;
                    
                    -- Walk cycle for tEXT secs
                    when E =>
                        LEDs <= P5;
                        interval <= tE;
                        start_timer <= '1';
                        if expired='1' then
                            State <= F;
                            WR_Reset <= '1';
                        end if;
                    
                    -- Side Green for tBASE secs
                    when F =>
                        LEDs <= P3;
                        interval <= tB;
                        start_timer <= '1';
                        WR_Reset <= '0';
                        if expired='1' and Sensor_Sync='0' then
                            State <= H;
                        elsif expired='1' and Sensor_Sync='1' then
                            State <= G; 
                        end if;
                
                    -- Side Green for another tEXT secs
                    when G =>
                        LEDs <= P3;
                        interval <= tE;
                        start_timer <= '1';
                        if expired='1' then
                            State <= H;
                        end if;
                    
                    -- Main Green for tBASE secs
                    when H =>
                        LEDs <= P4;
                        interval <= tY;
                        start_timer <= '1';
                        if expired='1' then
                            State <= A;
                        end if;
                end case;
            end if;
            
        end if;
    end process;

end Behavioral;
