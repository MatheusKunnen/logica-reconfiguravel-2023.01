onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_cronometro/clk
add wave -noupdate /tb_cronometro/rst
add wave -noupdate /tb_cronometro/en
add wave -noupdate /tb_cronometro/stst
add wave -noupdate -radix binary /tb_cronometro/out_3
add wave -noupdate -radix binary /tb_cronometro/out_2
add wave -noupdate -radix binary /tb_cronometro/out_1
add wave -noupdate -radix binary /tb_cronometro/out_0
add wave -noupdate -divider Counters
add wave -noupdate /tb_cronometro/DUT/cont_out_3
add wave -noupdate /tb_cronometro/DUT/cont_out_2
add wave -noupdate /tb_cronometro/DUT/cont_out_1
add wave -noupdate /tb_cronometro/DUT/cont_out_0
add wave -noupdate /tb_cronometro/DUT/en_cont_3
add wave -noupdate /tb_cronometro/DUT/en_cont_2
add wave -noupdate /tb_cronometro/DUT/en_cont_1
add wave -noupdate /tb_cronometro/DUT/en_cont_0
add wave -noupdate /tb_cronometro/DUT/running
add wave -noupdate /tb_cronometro/DUT/max_reached
add wave -noupdate /tb_cronometro/DUT/internal_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 227
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {105 ns}
