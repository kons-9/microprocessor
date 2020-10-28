`timescale 1ns / 1ps

`include "99_define.v"

module sequencer(
    input wire [3:0]info_branch,
    input wire [31:0]branch,//alu result
    input wire [31:0]notbranch,
    input wire branch_signal,

    output wire [31:0]next_pc
    }

    assign next_pc = gen_next_pc(branch,notbranch,branch_signal);

    function [31:0]gen_next_pc;
        input [31:0]branch;
        input [31:0]notbranch;
        input branch_signal;

        gen_next_pc = branch_signal ? branch:notbranch;
        // case(info_branch)
        //     `Beq: gen_next_pc = eq? branch : notbranch;
        //     `Bne: gen_next_pc = ~eq?: branch : notbranch;
        //     `Blt: gen_next_pc = sl? branch : notbranch;
        //     `Bge: gen_next_pc = ~sl? branch : notbranch;
        //     `Bltu: gen_next_pc = slu? branch : notbranch;
        //     `Bgeu: gen_next_pc = ~slu? branch : notbranch;
        //     `BJAL,`BJALR: gen_next_pc = branch;
        //     default: gen_next_pc = notbranch;
        // endcase
    end


    