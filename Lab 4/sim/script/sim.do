vlib work
vcom -93 -work work ../../src/Top.vhd
vcom -93 -work work ../src/top_tb.vhd
vcom -93 -work work ../../src/seven_seg.vhd
vcom -93 -work work ../../src/synchronizer_3bit.vhd
vcom -93 -work work ../../src/rising_edge_synchronizer.vhd
vcom -93 -work work ../../src/add_sub_beh.vhd
vcom -93 -work work ../../src/flag_set.vhd
vsim -voptargs=+acc top_tb
do wave.do
run 5000 ns
