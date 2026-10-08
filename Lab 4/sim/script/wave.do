onerror {resume}
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
	"7'b0001000" "A" -color "yellow",
	"7'b0000011" "b" -color "yellow",
	"7'b1000110" "C" -color "yellow",
	"7'b0100001" "d" -color "yellow",
	"7'b0000110" "E" -color "yellow",
	"7'b0001110" "F" -color "yellow",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/uut/a
add wave -noupdate /top_tb/uut/b
add wave -noupdate /top_tb/uut/add_btn
add wave -noupdate /top_tb/uut/sub_btn
add wave -noupdate /top_tb/uut/clk
add wave -noupdate /top_tb/uut/reset
add wave -noupdate /top_tb/uut/seven_seg1
add wave -noupdate /top_tb/uut/seven_seg2
add wave -noupdate /top_tb/uut/seven_seg3
add wave -noupdate /top_tb/uut/a_sync
add wave -noupdate /top_tb/uut/b_sync
add wave -noupdate /top_tb/uut/a_pad
add wave -noupdate /top_tb/uut/b_pad
add wave -noupdate /top_tb/uut/result
add wave -noupdate /top_tb/uut/flag
add wave -noupdate /top_tb/uut/add_en
add wave -noupdate /top_tb/uut/sub_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5346 ps} 0}
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
WaveRestoreZoom {0 ps} {10254 ps}
