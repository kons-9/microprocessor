`timescale 1ns / 1ps

`include "99_define.v"

module gen_branch_signal(
    input wire [3:0]info_branch,
    input wire [31:0] reg1,
    input wire [31:0] reg2,
    input wire flush,

    output wire branch_signal
    );
    wire eq;
    wire sl;
    wire slu;

    assign eq = (reg1 == reg2);
    assign sl = ($signed(reg1)<$signed(reg2));
    assign slu = ($unsigned(reg1)<$unsigned(reg2));

    assign branch_signal = flush?1'b0:gen_signal(info_branch,eq,sl,slu);

    function gen_signal;
        input [3:0]info_branch;
        input eq;
        input sl;
        input slu;
        
        case(info_branch)
            `Beq: gen_signal = eq;
            `Bne: gen_signal = ~eq;
            `Blt: gen_signal = sl;
            `Bge: gen_signal = ~sl;
            `Bltu: gen_signal = slu;
            `Bgeu: gen_signal = ~slu;
            `BJAL,`BJALR: gen_signal = 1'b1;
            default: gen_signal = 1'b0;
        endcase

    endfunction


endmodule