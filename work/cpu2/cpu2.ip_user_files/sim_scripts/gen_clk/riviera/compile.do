vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../../cpu2.srcs/sources_1/bd/gen_clk/ipshared/8b3d" \
"/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../cpu2.srcs/sources_1/bd/gen_clk/ipshared/8b3d" \
"../../../bd/gen_clk/ip/gen_clk_clk_wiz_0_0/gen_clk_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/gen_clk/ip/gen_clk_clk_wiz_0_0/gen_clk_clk_wiz_0_0.v" \
"../../../bd/gen_clk/sim/gen_clk.v" \

vlog -work xil_defaultlib \
"glbl.v"

