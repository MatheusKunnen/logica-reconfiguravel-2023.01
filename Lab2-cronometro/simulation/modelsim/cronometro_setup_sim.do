vsim +altera -do cronometro_run_msim_rtl_vhdl.do -l msim_transcript -gui work.tb_cronometro
add wave -position insertpoint  \
sim:/tb_cronometro/clk
add wave -position insertpoint  \
sim:/tb_cronometro/rst
add wave -position insertpoint  \
sim:/tb_cronometro/en
add wave -position insertpoint  \
sim:/tb_cronometro/stst
add wave -position insertpoint  \
sim:/tb_cronometro/out_3 \
sim:/tb_cronometro/out_2 \
sim:/tb_cronometro/out_1 \
sim:/tb_cronometro/out_0