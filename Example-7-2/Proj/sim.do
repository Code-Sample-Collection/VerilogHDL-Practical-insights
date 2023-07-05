quit -sim 

vlib altera_mf
vmap altera_mf altera_mf
vlog -work altera_mf altera_mf.v

# create a project
vlib work
vmap work work


# compile design file
vlog SPRAM.v
vlog STM.v
vlog MPI.v

# testbench
vlog NorTestBench.v

vsim -L altera_mf NorTestBench
do wave.do
run -all