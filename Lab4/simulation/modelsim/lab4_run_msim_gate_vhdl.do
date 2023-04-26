transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {lab4.vho}

vcom -93 -work work {C:/Users/mathe/Projects/universidade/logica-reconfiguravel-2023.01/Lab4/tb_lab4.vhd}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /NA=lab4_vhd.sdo -L cycloneii -L gate_work -L work -voptargs="+acc"  lab4

add wave *
view structure
view signals
run -all
