//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
//Date        : Tue Nov 10 21:44:02 2020
//Host        : DJ00308 running 64-bit Ubuntu 18.04.5 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (cpu_clk,
    sys_clk);
  output cpu_clk;
  input sys_clk;

  wire clk_wiz_0_clk_out1;
  wire sys_clk_1;

  assign cpu_clk = clk_wiz_0_clk_out1;
  assign sys_clk_1 = sys_clk;
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sys_clk_1),
        .clk_out1(clk_wiz_0_clk_out1));
endmodule
