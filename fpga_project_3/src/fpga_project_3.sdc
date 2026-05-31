//Copyright (C)2014-2026 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.11.03 Education 
//Created Time: 2026-05-31 11:32:56
create_clock -name clk -period 40 -waveform {0 20} [get_ports {i_clk}]
