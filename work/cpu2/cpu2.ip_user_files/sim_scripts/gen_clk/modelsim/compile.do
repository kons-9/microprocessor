vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -sv "+incdir+../../../../cpu2.srcs/sources_1/bd/gen_clk/ipshared/8b3d" \
"/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../cpu2.srcs/sources_1/bd/gen_clk/ipshared/8b3d" \
"../../../bd/gen_clk/ip/gen_clk_clk_wiz_0_0/gen_clk_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/gen_clk/ip/gen_clk_clk_wiz_0_0/gen_clk_clk_wiz_0_0.v" \
"../../../bd/gen_clk/sim/gen_clk.v" \

vlog -work xil_defaultlib \
"glbl.v"

