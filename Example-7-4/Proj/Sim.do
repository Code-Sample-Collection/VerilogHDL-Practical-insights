quit -sim 

vlib altera_mf
vmap altera_mf altera_mf
vlog -work altera_mf altera_mf.v

# create a project
vlib work
vmap work work


# design file
vlog SPRAM.v
vlog STM.v
vlog MPI.v

# testbench
vlog uP_BFM.v 
vlog harness.v
vlog testcase.v

vsim -L altera_mf testcase harness
do wave.do
run -all