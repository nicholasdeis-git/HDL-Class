vlib work
vcom -93 -work work ../../src/Top.vhd
vcom -93 -work work ../src/top_tb.vhd
vcom -93 -work work ../../src/seven_seg.vhd
vcom -93 -work work ../../src/synchronizer_3bit.vhd
vsim -voptargs=+acc top_tb
do wave.do
run 500 ns
