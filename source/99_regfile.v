`timescale 1ns / 1ps

`include "99_define.v"

module regfile(
    input wire clk,
    input wire [5:0] reg1_addr,
    input wire [5:0] reg2_addr,

    input wire [5:0] dstreg_addr,
    input wire write_reg,
    input wire [31:0] dstreg_data,

    output wire [31:0]reg1_data,
    output wire [31:0]reg2_data
);

reg [31:0]register[31:0];

assign reg1_data = register[reg1_addr];
assign reg2_data = register[reg2_addr];

always@(posedge clk)begin
    if(write_reg)register[dstreg_addr]<=dstreg_data;
    else begin
    end
end