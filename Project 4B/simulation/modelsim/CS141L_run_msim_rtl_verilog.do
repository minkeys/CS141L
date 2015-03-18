transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Minh/Documents/GitHub/CS141L/Project3 {C:/Users/Minh/Documents/GitHub/CS141L/Project3/regfile32x8.sv}
vlog -sv -work work +incdir+C:/Users/Minh/Documents/GitHub/CS141L/Project3 {C:/Users/Minh/Documents/GitHub/CS141L/Project3/alu.sv}
vlog -sv -work work +incdir+C:/Users/Minh/Documents/GitHub/CS141L/Project3 {C:/Users/Minh/Documents/GitHub/CS141L/Project3/program_counter_logic.sv}
vlog -sv -work work +incdir+C:/Users/Minh/Documents/GitHub/CS141L/Project3 {C:/Users/Minh/Documents/GitHub/CS141L/Project3/testerROM.sv}
vlog -sv -work work +incdir+C:/Users/Minh/Documents/GitHub/CS141L/Project3 {C:/Users/Minh/Documents/GitHub/CS141L/Project3/instructionDecode.sv}

