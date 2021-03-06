// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Tue Nov 17 02:39:05 2020
// Host        : DJ00308 running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/denjo/risc/work/cpu_single/cpu_single.srcs/sources_1/bd/design_1/ip/design_1_cpu_0_1/design_1_cpu_0_1_stub.v
// Design      : design_1_cpu_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "cpu,Vivado 2020.1" *)
module design_1_cpu_0_1(sysclk, cpu_resetn, uart_tx)
/* synthesis syn_black_box black_box_pad_pin="sysclk,cpu_resetn,uart_tx" */;
  input sysclk;
  input cpu_resetn;
  output uart_tx;
endmodule
