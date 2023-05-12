onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /hostsystem/reset_reset_n
add wave -noupdate /hostsystem/clk_clk
add wave -noupdate /hostsystem/bram_0/RST
add wave -noupdate /hostsystem/bram_0/CLK
add wave -noupdate -radix ascii /hostsystem/bram_0/READDATA
add wave -noupdate -radix ascii /hostsystem/bram_0/WRITEDATA
add wave -noupdate -radix unsigned /hostsystem/bram_0/ADD
add wave -noupdate /hostsystem/bram_0/WR_EN
add wave -noupdate /hostsystem/bram_0/RD_EN
add wave -noupdate /hostsystem/bram_0/CS
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {22320000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 199
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {105 us}
