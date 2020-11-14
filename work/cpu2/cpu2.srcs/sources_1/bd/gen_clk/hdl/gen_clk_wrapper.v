//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
//Date        : Sun Nov 15 08:12:20 2020
//Host        : DJ00308 running 64-bit Ubuntu 18.04.5 LTS
//Command     : generate_target gen_clk_wrapper.bd
//Design      : gen_clk_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module gen_clk_wrapper(
    input wire sysclk,
    input wire cpu_resetn,
    output wire uart_tx
    );
  wire cpuclk;

  gen_clk gen_clk_i
       (.cpuclk(cpuclk),
        .sysclk(sysclk));
        
  cpu cpu0(
        .sysclk(cpuclk),
        .cpu_resetn(cpu_resetn),
        .uart_tx(uart_tx)
    );
endmodule
