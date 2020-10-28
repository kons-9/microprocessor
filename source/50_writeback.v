`timescale 1ns / 1ps
`include "sequencer.v"

module writeback(
    input wire clk,
    input wire [31:0]branch,

    input wire w_reg,
    input wire rd_data[31:0],
    input wire [4:0]dst_addr,
    input wire [31:0]next_pcD,

    output reg [31:0]next_pc,

    output reg [4:0]dstreg_addr,
    output reg write_reg,
    output reg [31:0]dstreg_data
    );

    always@(posedge clk)begin
        next_pc <= next_pcD;

        write_reg <= w_reg;
        dstreg_data <= rd_data;
        dstreg_addr <= dst_addr;
    end