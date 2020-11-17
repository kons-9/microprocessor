`timescale 1ns / 1ps

`include "99_define.v"

module fetch(
    input wire clk,
    input wire reset,
    input wire branch_sig,
    input wire [31:0]branch_pc,
    input wire stallF,
    input wire stallD,

    output reg [31:0]ir,
    output reg [31:0]npc
    );
    

    // parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks_mul/tests/ControlTransfer/code.hex";
    // parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/IntRegImm/code.hex";
    // parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/IntRegReg/code.hex";
    // parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/LoadAndStore/code.hex";
    // parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/Uart/code.hex";
    // parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/ZeroRegister/code.hex";
    parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks_mul/Coremark_for_Synthesis/code.hex";

    reg [31:0]ir_mem[0:16384];
    initial begin
        $readmemh(FILENAME, ir_mem);
    end

    reg [31:0]pc1;
    
    wire [31:0]next_pc;
    wire [31:0]pcplus4;

    wire [31:0]ir_addr;

    assign pcplus4 = pc1+4;

    assign ir_addr = {{2{1'b0}},next_pc[31:2]};

     sequencer sequencer0(
         .branch_signal(branch_sig),
         .branch(branch_pc),
         .notbranch(pcplus4),
        
         .npc(next_pc)
     );
//    assign next_pc = branch_sig ? branch_pc : pcplus4;
    
    always@(posedge clk or negedge reset)begin
        pc1 <=  reset==1'b0 ? 32'h7FFC:
                stallF ? pc1:next_pc ;

        ir <= stallD ? ir:ir_mem[ir_addr];
        npc <= stallD ? npc:next_pc;
    end

endmodule