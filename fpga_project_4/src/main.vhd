library ieee;
use ieee.std_logic_1164.all;

entity main is
    port (
        i_clk       :   in std_logic;
        i_switch_1  :   in std_logic;
        o_led_1     :   out std_logic
    );
end entity main;

architecture RTL of main is
    signal w_debounced_switch   :   std_logic;
begin

    debounce_inst   :   entity work.debounce_filter
    generic map(
        DEBOUNCE_LIMIT => 250000
    )
    port map (
        i_clk       =>  i_clk,
        i_bouncy    =>  i_switch_1,
        o_debounced =>  w_debounced_switch
    );
    
    led_inst :   entity work.led_toggle
    port map (
        i_clk       =>  i_clk,
        i_switch_1  =>  w_debounced_switch,
        o_led_1     =>  o_led_1
    );

end architecture RTL;