library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity debounce_filter_testbench is
end entity debounce_filter_testbench;

architecture test of debounce_filter_testbench is
    signal r_clk, r_bouncy, w_debounced : std_logic := '0';
begin

    r_clk <= not r_clk after 2 ns;

    uuid : entity work.debounce_filter 
        generic map (DEBOUNCE_LIMIT => 4)
        port map (
            i_clk       =>  r_clk,
            i_bouncy    =>  r_bouncy,
            o_debounced => w_debounced
        );

    process is
        begin
            wait for 10 ns;
            r_bouncy <= '1';    -- toggle state of input pin
        
            wait until rising_edge(r_clk);
            r_bouncy <= '0';    -- simmulate a glitch/bounce

            wait until rising_edge(r_clk);
            r_bouncy <= '1';    -- bounce goes away

            wait for 24 ns;
        finish;
    end process;
end test;