`timescale 1ns / 1ps

`include "99_define.vh"

module branch_prediction(
    input wire [31:0]pcD,
    input wire [31:0]branch_pc,
    input wire [3:0]info_branch,

    output wire failure,
    output wire success
    );

    wire branch;
    assign branch = info_branch!=4'b0000;

    assign success = branch & (pcD==branch_pc);
    assign failure = branch & ~success;

endmodule