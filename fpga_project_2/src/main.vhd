library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
    port (
        i_switch_1 : in std_logic;
        i_switch_2 : in std_logic;
        o_led_1    : out std_logic
    );
end entity and_gate;

architecture RTL of and_gate is
begin
    o_led_1 <= (i_switch_1 and i_switch_2);
end RTL;