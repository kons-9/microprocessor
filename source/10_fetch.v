`timescale 1ns / 1ps

`include "99_define.v"

module fetch(
    input wire [31:0]next_pc,
    input wire clk,

    output reg [31:0]ir,
    output reg [31:0]pc1
    )
    wire eq,sl,slu;
    reg [31:0]ir_mem[0:255];

    parameter FILENAME = "";

    initial begin
        $readmemb(FILENAME, ir_mem);
    end

    always@(posedge clk)begin
        ir <= ir_mem[next_pc];
    end

endmodule