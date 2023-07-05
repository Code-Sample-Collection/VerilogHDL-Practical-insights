onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -radix hexadecimal /NorTestBench/u_MPI/Clock
add wave -noupdate -format Logic -radix hexadecimal /NorTestBench/u_MPI/Rst_n
add wave -noupdate -format Literal -radix hexadecimal /NorTestBench/u_MPI/Mpi_addr
add wave -noupdate -format Logic -radix hexadecimal /NorTestBench/u_MPI/Mpi_rw
add wave -noupdate -format Logic -radix hexadecimal /NorTestBench/u_MPI/Mpi_cs_n
add wave -noupdate -format Literal -radix hexadecimal /NorTestBench/u_MPI/Mpi_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {329260 ps} 0}
configure wave -namecolwidth 280
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
update
WaveRestoreZoom {235182 ps} {356654 ps}
