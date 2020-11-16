`timescale 1ns / 1ps

`include "99_define.vh"

module branch_prediction(
    input wire [31:0]pcD,
    input wire [31:0]branch_pc,
    input wire [3:0]info_branch,

    output wire failure,
    output wire success,
    output wire is_branch
    );

    assign is_branch = info_branch!=`NOTBRANCH;
    assign success = is_branch & (pcD==branch_pc);
    assign failure = is_branch & ~success;

endmodule