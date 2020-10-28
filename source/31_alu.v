`timescale 1ns / 1ps

`include "99_define.v"

module alu(
    input wire [31:0]r1,
    input wire [31:0]r2,
    input wire [31:0]imm,  
    input wire [31:0]pc,

    input wire [3:0]alucode,
    input wire using_r2,//r2 or imm  
    input wire using_pc,//r1 or pc
    output wire [31:0] alu_result
    );

    wire[31:0] x,y;

    assign x = using_pc ? pc : r1;//pc or r1
    assign y = using_r2 ? r2 : imm;//r2 or imm

    assign alu_result = ans(x,y);

    function [31:0]ans;
        input[31:0] x,y;
        case(alucode)
            `ADD: ans = x+y;
            `SUB: ans= x-y;
            `SLT: ans= x < y;
            `SLTu: ans = $signed(x)<$signed(y);
            `SLL: ans = x<<y[4:0];
            `SRL: ans = x>>y[4:0];
            `SRA: ans = $signed(x)>>>$signed(y[4:0]); 
            `AND: ans = x&y;
            `OR: ans = x|y;
            `XOR: ans = x^y;
            default: ans = {32{1'b1}};
        endcase
    endfunction
endmodule