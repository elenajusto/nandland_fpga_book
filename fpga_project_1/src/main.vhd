library ieee;
use ieee.std_logic_1164.all;

entity button_to_led is
    port (
        in_button_1 : in std_logic;
        out_led_1   : out std_logic;
    );
end entity button_to_led;

architecture RTL of button_to_led is
begin
    out_led_1 <= in_button_1;
end RTL;