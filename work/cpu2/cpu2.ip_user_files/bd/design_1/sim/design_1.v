//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
//Date        : Sun Nov 15 17:26:47 2020
//Host        : DJ00308 running 64-bit Ubuntu 18.04.5 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (cpu_resetn,
    sysclk,
    uart_tx);
  input cpu_resetn;
  input sysclk;
  output uart_tx;

  wire clk_wiz_0_clk_out1;
  wire cpu_0_uart_tx;
  wire cpu_resetn_1;
  wire sysclk_1;

  assign cpu_resetn_1 = cpu_resetn;
  assign sysclk_1 = sysclk;
  assign uart_tx = cpu_0_uart_tx;
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sysclk_1),
        .clk_out1(clk_wiz_0_clk_out1));
  design_1_cpu_0_0 cpu_0
       (.cpu_resetn(cpu_resetn_1),
        .sysclk(clk_wiz_0_clk_out1),
        .uart_tx(cpu_0_uart_tx));
endmodule
