onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/uut/a
add wave -noupdate /top_tb/uut/b
add wave -noupdate /top_tb/uut/clk
add wave -noupdate /top_tb/uut/reset
add wave -noupdate /top_tb/uut/seven_seg1
add wave -noupdate /top_tb/uut/seven_seg2
add wave -noupdate /top_tb/uut/seven_seg3
add wave -noupdate /top_tb/uut/a_sync
add wave -noupdate /top_tb/uut/b_sync
add wave -noupdate /top_tb/uut/a_pad
add wave -noupdate /top_tb/uut/b_pad
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {78526 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 177
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {525 ns}
