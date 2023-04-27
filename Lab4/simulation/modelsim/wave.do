onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_lab4/DUT/clk
add wave -noupdate /tb_lab4/DUT/en
add wave -noupdate -divider {BRAM 0}
add wave -noupdate /tb_lab4/DUT/read_bram0
add wave -noupdate /tb_lab4/DUT/bram0_wren
add wave -noupdate /tb_lab4/DUT/bram0_clk_en
add wave -noupdate /tb_lab4/DUT/bram0_address
add wave -noupdate /tb_lab4/DUT/bram0_out
add wave -noupdate /tb_lab4/DUT/bram0_out_ready
add wave -noupdate /tb_lab4/DUT/bram0_out_ready_0
add wave -noupdate /tb_lab4/DUT/bram0_out_ready_1
add wave -noupdate -divider {BRAM 1}
add wave -noupdate /tb_lab4/DUT/bram1_wren
add wave -noupdate /tb_lab4/DUT/bram1_clk_en
add wave -noupdate /tb_lab4/DUT/bram1_address
add wave -noupdate /tb_lab4/DUT/bram1_out
add wave -noupdate -divider FIFO
add wave -noupdate /tb_lab4/DUT/fifo_rd_clk_en
add wave -noupdate /tb_lab4/DUT/fifo_wr_clk_en
add wave -noupdate /tb_lab4/DUT/fifo_in
add wave -noupdate /tb_lab4/DUT/fifo_out
add wave -noupdate /tb_lab4/DUT/fifo_out_ready
add wave -noupdate /tb_lab4/DUT/fifo_out_ready_0
add wave -noupdate /tb_lab4/DUT/fifo_read_en
add wave -noupdate /tb_lab4/DUT/fifo_write_en
add wave -noupdate /tb_lab4/DUT/fifo_full
add wave -noupdate /tb_lab4/DUT/fifo_empty
add wave -noupdate /tb_lab4/DUT/fifo_free_sp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {14836623 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 205
configure wave -valuecolwidth 61
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
WaveRestoreZoom {2807974 ps} {54589055 ps}
