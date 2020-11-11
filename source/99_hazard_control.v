`timescale 1ns / 1ps

`include "99_define.v"

module hazard_control(
    input wire clk,
    input wire reset,
    //data hazard input
    input wire [4:0]Ereg1_addr,
    input wire [4:0]Ereg2_addr,

    input wire [4:0]Mwrite_reg_addr,
    input wire Mwrite_reg_sig,
    input wire [4:0]Wwrite_reg_addr,
    input wire Wwrite_reg_sig,
    //control hazard input
    input wire branch_sig,

    //mul_div_rem control 
    input wire [4:0]alucode,

    //data hazard input
    output wire [1:0]forward1E,
    output wire [1:0]forward2E,

    //control hazard input 
    output wire stallF,
    output wire stallD,
    output wire flushE, //1 execute is dumped
    output wire flushD
    );

    assign forward1E = gen_forward_signal(Ereg1_addr,Mwrite_reg_addr,Wwrite_reg_addr,Mwrite_reg_sig,Wwrite_reg_sig);
    assign forward2E = gen_forward_signal(Ereg2_addr,Mwrite_reg_addr,Wwrite_reg_addr,Mwrite_reg_sig,Wwrite_reg_sig);
    
    assign stallD = cnt==0?1'b0:1'b1;
    assign stallF = cnt==0?1'b0:1'b1;
    assign flushD = branch_sig;
    assign flushE = cnt==0?branch_sig:1'b1;
    // gen_flush_signal(branch_sig,cnt);

    function [1:0]gen_forward_signal;
        input [4:0]reg_addr;
        input [4:0]Mreg_addr;
        input [4:0]Wreg_addr;
        input Mw_sig;
        input Ww_sig;

        if(Mw_sig && reg_addr!=5'b00000 && reg_addr==Mreg_addr)
            gen_forward_signal = `WRITEMEM;
        else if(Ww_sig && reg_addr!=5'b00000 && reg_addr==Wreg_addr)
            gen_forward_signal = `WRITEBACK;
        else
            gen_forward_signal = `NORMAL;
    endfunction
    

    reg [2:0]cnt;
    wire [2:0]ncnt =nextcnt(alucode,cnt);

    initial begin
        cnt <= 3'b0;
    end

    always@(posedge clk)begin
        cnt <= ncnt;
    end

    function [2:0]nextcnt;
        input [4:0]alucode;
        input unsigned [2:0]cnt;

        case(alucode):
            `MUL,`MULH,`MULHSU,`MULHU:begin
                nextcnt = (cnt<=`MULSTALL)?cnt+1:3'b0;
            end
            `DIV,`DIVU:begin
                nextcnt = (cnt<=`DIVSTALL)?cnt+1:3'b0;
            end
            `REM,`REMU:begin
                nextcnt = (cnt<=`REMSTALL)?cnt+1:3'b0;
            end
            default: nextcnt = 3'd0
        endcase
    endfunction
endmodule