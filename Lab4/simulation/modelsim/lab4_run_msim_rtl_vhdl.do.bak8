transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/mathe/Projects/universidade/logica-reconfiguravel-2023.01/Lab4/bram.vhd}
vcom -93 -work work {C:/Users/mathe/Projects/universidade/logica-reconfiguravel-2023.01/Lab4/fifo.vhd}
vcom -93 -work work {C:/Users/mathe/Projects/universidade/logica-reconfiguravel-2023.01/Lab4/lab4.vhd}

vcom -93 -work work {C:/Users/mathe/Projects/universidade/logica-reconfiguravel-2023.01/Lab4/tb_lab4.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  lab4

add wave *
view structure
view signals
run -all
