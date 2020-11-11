//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
//Date        : Tue Nov 10 21:44:02 2020
//Host        : DJ00308 running 64-bit Ubuntu 18.04.5 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (input wire sysclk,
    input wire cpu_resetn,
    output wire uart_tx);
    
  wire cpu_clk;

  design_1 design_1_i
       (.cpu_clk(cpu_clk),
        .sys_clk(sys_clk));
        
  cpu cpu_0(
        .sysclk(cpu_clk),
        .cpu_resetn(cpu_resetn),
        .uart_tx(uart_tx)
  );
endmodule
