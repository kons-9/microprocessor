`timescale 1ns / 1ps

`include "99_define.vh"

module sequencer(
    input wire branch_signal,
    input wire [31:0]branch_plus4,
    input wire failure,
    input wire [31:0]branch,
    input wire [31:0]notbranch,

    output wire [31:0]npc
    );

    assign npc = branch_signal ? branch : 
                    failure ? branch_plus4:notbranch;

endmodule


    