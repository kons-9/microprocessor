//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
//Date        : Tue Nov 17 01:57:49 2020
//Host        : DJ00308 running 64-bit Ubuntu 18.04.5 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (cpu_resetn,
    sysclk,
    uart_tx);
  input cpu_resetn;
  input sysclk;
  output uart_tx;

  wire cpu_resetn;
  wire sysclk;
  wire uart_tx;

  design_1 design_1_i
       (.cpu_resetn(cpu_resetn),
        .sysclk(sysclk),
        .uart_tx(uart_tx));
endmodule
