vlib work
vcom -93 -work work ../../src/seven_seg.vhd
vcom -93 -work work ../src/seven_seg_tb.vhd
vcom -93 -work work ../src/generic_counter.vhd
vsim -voptargs=+acc seven_seg_tb
do wave.do
run 500 ns
