`timescale 1ns / 1ps

`include "99_define.v"

module sequencer(
    input wire [3:0]info_branch,
    input wire [31:0]branch,//alu result
    input wire [31:0]notbranch,

    output wire [31:0]next_pc
    }

    wire eq,sl,slu;

    assign eq = (reg1 == reg2);
    assign sl = (reg1<reg2);
    assign slu = ((signed)reg1<(signed)reg2);

    assign next_pc = gen_next_pc(branch,notbranch,eq,sl,slu)

    function [31:0]gen_next_pc;
        input [31:0]branch;
        input [31:0]notbranch;
        input eq,sl,slu;

        case(info_branch):
            `Beq: gen_next_pc <= eq? branch : notbranch;
            `Bne: gen_next_pc <= ~eq?: branch : notbranch;
            `Blt: gen_next_pc <= sl? branch : notbranch;
            `Bge: gen_next_pc <= ~sl? branch : notbranch;
            `Bltu: gen_next_pc <= slu? branch : notbranch;
            `Bgeu: gen_next_pc <= ~slu? branch : notbranch;
            `BJAL,`BJALR: gen_next_pc <= branch;
            default: gen_next_pc <= notbranch;
        endcase
    end


    