`timescale 1ns / 1ps

`include "99_define.vh"

module branch_prediction(
    input wire [31:0]pcD,
    input wire [31:0]branch_pc,
    input wire is_branch,
    input wire branch_sig,
    input wire branch_plus4,

    output wire failure,
    output wire success

    );
    wire branch;
    
    assign branch = branch_sig ? (pcD == branch_pc):(pcD == branch_plus4);
    assign success = is_branch & branch;
    assign failure = is_branch & ~success;

endmodule