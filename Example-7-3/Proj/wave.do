onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal -radix hexadecimal /testcase/inst_harness/inst_BFM/uP_data
add wave -noupdate -format Literal -radix hexadecimal /testcase/inst_harness/inst_BFM/uP_addr
add wave -noupdate -format Logic -radix hexadecimal /testcase/inst_harness/inst_BFM/uP_cs_n
add wave -noupdate -format Logic -radix hexadecimal /testcase/inst_harness/inst_BFM/uP_rw
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {309001 ps} 0}
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
WaveRestoreZoom {64942 ps} {734270 ps}
