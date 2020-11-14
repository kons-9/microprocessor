-makelib xcelium_lib/xpm -sv \
  "/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/gen_clk/ip/gen_clk_clk_wiz_0_0/gen_clk_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/gen_clk/ip/gen_clk_clk_wiz_0_0/gen_clk_clk_wiz_0_0.v" \
  "../../../bd/gen_clk/sim/gen_clk.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

