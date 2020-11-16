`timescale 1ns / 1ps

`include "99_define.vh"

module fetch(
    input wire clk,
    input wire reset,
    input wire branch_sig,
    input wire branch_sigE,
    input wire [31:0]branch_pc,
    input wire [31:0]branch_plus4,
    input wire stallF,
    input wire stallD,
    input wire success,
    input wire failure,

    output reg [31:0]ir,
    output reg [31:0]npc
    );
    // wire success = 1'b1;
    

    parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/ControlTransfer/code.hex";
//     parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/IntRegImm/code.hex";
    //  parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/IntRegReg/code.hex";
    // parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/LoadAndStore/code.hex";
//     parameter FILENAME = "/home/?denjo/risc/b3exp/benchmarks/tests/Uart/code.hex";
    // parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/ZeroRegister/code.hex";
//    parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/Coremark_for_Synthesis/code.hex";

    reg [31:0]ir_mem[0:16384];
    initial begin
        $readmemh(FILENAME, ir_mem);
    end

    reg [31:0]pc1;
    
    wire [31:0]next_pc;
    wire [31:0]pcplus4;
    wire [31:0]npcplus4;

    wire [31:0]ir_addr;
    wire [31:0]ir_data;

    assign pcplus4 = pc1+4;

    assign ir_addr = {{2{1'b0}},next_pc[31:2]};
    assign ir_data = ir_mem[ir_addr];

    //for prediction
    reg [3:0]stage;//one-hot
    reg [31:0] pre_branch_pc;
    wire pre_plus4 =stage[0]|stage[1];
    wire [31:0]predict = pre_plus4?pcplus4:pre_branch_pc;
    wire [31:0]predict_ir_addr = {{2{1'b0}},predict[31:2]};
    wire [31:0]predict_ir_data = ir_mem[predict_ir_addr];
    wire is_predict = (ir[6:5]==2'b11)?`TRUE:`FALSE;

    sequencer sequencer0(
        .branch_signal(branch_sig),
        .failure(failure),
        .branch_plus4(branch_plus4),
        .branch(branch_pc),
        .notbranch(pcplus4),
        
        .npc(next_pc)
    );

    initial begin
        stage <= 4'b0010;
        pc1 <= 32'h7FFC;
        npc <= 32'b0;
        ir <= 32'b0;
        pre_branch_pc <= 32'h8000;
    end
    
    always@(posedge clk or negedge reset)begin
        pc1 <=  reset==1'b0 ? 32'h7FFC:
                stallF ? pc1:
                branch_sig ? next_pc:
                is_predict ? predict:next_pc;
    end

    always@(posedge clk)begin
        ir <=   stallD ? ir:
                branch_sig ? ir_data:
                is_predict ? predict_ir_data:ir_data;
        npc <= stallD ? npc:
                branch_sig ? next_pc:
                is_predict ? predict:next_pc;

        pre_branch_pc <= stallD ? pre_branch_pc:
                            branch_sig ? branch_pc:pre_branch_pc;

        stage <= success?(pre_plus4 ? ((stage[0]==1'b1)?stage:{{1'b0},stage[3:1]}):((stage[3]==1'b1)?stage:{stage[2:0],{1'b0}})):
                failure? (pre_plus4 ? {stage[2:0],{1'b0}}:{{1'b0},stage[3:1]}) : stage;
    end

endmodule