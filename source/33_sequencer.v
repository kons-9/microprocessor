`timescale 1ns / 1ps

`include "99_define.v"

module sequencer(
    input wire branch_signal,
    input wire [31:0]branch,
    input wire [31:0]notbranch,

    output wire [31:0]npc
    }

    assign npc = branch_signal ? branch : notbranch;

endmodule


    