`timescale 1ns / 1ps

`include "99_define.vh"

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
    
    assign stallD = ~reset | 1'b0;
    assign stallF = ~reset | 1'b0;
    assign flushD = ~reset | branch_sig;
    assign flushE = ~reset | branch_sig;
    // gen_flush_signal(branch_sig,stage);

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

    // function gen_flush_signal;
    //     input branch_sig;
    //     input [2:0]stage;

    //     if(branch_sig==1'b1 || stage != 3'd0)begin
    //         gen_flush_signal = 1'b1;
    //     end
    //     else begin
    //         gen_flush_signal = 1'b0;
    //     end
    // endfunction
    
    // initial begin
    //     stage <= 3'b0;
    // end
    // always@(posedge clk)begin
    //     if(stage==3'd1)begin
    //         stage <= 3'd0;
    //     end
    //     else if(stage==3'd2)begin
    //         stage <= 3'd0;
    //     end 
    //     else if(flushE)begin
    //         stage<=3'd1;
    //     end
    //     else begin
    //         stage <= 3'd0;
    //     end
    // end
endmodule