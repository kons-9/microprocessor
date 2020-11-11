//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
//Date        : Wed Nov 11 12:28:19 2020
//Host        : DJ00308 running 64-bit Ubuntu 18.04.5 LTS
//Command     : generate_target gen_clk.bd
//Design      : gen_clk
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "gen_clk,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=gen_clk,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "gen_clk.hwdef" *) 
module gen_clk
   (cpuclk,
    sysclk);
  output cpuclk;
  input sysclk;

  wire clk_wiz_0_clk_out1;
  wire sysclk_1;

  assign cpuclk = clk_wiz_0_clk_out1;
  assign sysclk_1 = sysclk;
  gen_clk_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sysclk_1),
        .clk_out1(clk_wiz_0_clk_out1));
endmodule
