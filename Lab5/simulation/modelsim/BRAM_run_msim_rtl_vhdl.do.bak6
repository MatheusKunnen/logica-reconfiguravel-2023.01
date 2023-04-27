transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/mathe/Projects/universidade/logica-reconfiguravel-2023.01/Lab5/BRAM.vhd}
vcom -93 -work work {C:/Users/mathe/Projects/universidade/logica-reconfiguravel-2023.01/Lab5/qbram.vhd}

vcom -93 -work work {C:/Users/mathe/Projects/universidade/logica-reconfiguravel-2023.01/Lab5/BRAM_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L rtl_work -L work -voptargs="+acc"  bram_tb

add wave *
view structure
view signals
run -all
