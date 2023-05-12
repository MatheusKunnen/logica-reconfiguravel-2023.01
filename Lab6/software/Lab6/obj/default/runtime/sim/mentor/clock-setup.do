force -drive sim:/hostsystem/reset_reset_n 1 1us
force -freeze sim:/hostsystem/clk_clk 1 0, 0 {10000 ps} -r 20000