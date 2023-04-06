transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {cronometro.vo}

vcom -93 -work work {C:/Users/mathe/Projects/universidade/logica-reconfiguravel-2023.01/Lab2-cronometro/tb_cronometro.vhd}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  Cronometro

add wave *
view structure
view signals
run -all
