radix define States {
    "7'b1000000" "0" -color "yellow",
    "7'b1111001" "1" -color "yellow",
    "7'b0100100" "2" -color "yellow",
    "7'b0110000" "3" -color "yellow",
    "7'b0011001" "4" -color "yellow",
    "7'b0010010" "5" -color "yellow",
    "7'b0000010" "6" -color "yellow",
    "7'b1111000" "7" -color "yellow",
    "7'b0000000" "8" -color "yellow",
    "7'b0011000" "9" -color "yellow",
    -default default
}
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group uut /top_tb/uut/a
add wave -noupdate -group uut /top_tb/uut/b
add wave -noupdate -group uut /top_tb/uut/clk
add wave -noupdate -group uut /top_tb/uut/reset
add wave -noupdate -group uut /top_tb/uut/seven_seg1
add wave -noupdate -group uut /top_tb/uut/seven_seg2
add wave -noupdate -group uut /top_tb/uut/seven_seg3
add wave -noupdate -group uut /top_tb/uut/a_sync
add wave -noupdate -group uut /top_tb/uut/b_sync
add wave -noupdate -group uut /top_tb/uut/a_pad
add wave -noupdate -group uut /top_tb/uut/b_pad
add wave -noupdate -expand -group tb /top_tb/a
add wave -noupdate -expand -group tb /top_tb/b
add wave -noupdate -expand -group tb /top_tb/clk
add wave -noupdate -expand -group tb /top_tb/reset
add wave -noupdate -expand -group tb /top_tb/seven_seg1
add wave -noupdate -expand -group tb /top_tb/seven_seg2
add wave -noupdate -expand -group tb /top_tb/seven_seg3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {220620 ps} 0}
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
