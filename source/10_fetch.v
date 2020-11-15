`timescale 1ns / 1ps

`include "99_define.vh"

module fetch(
    input wire [31:0]next_pc,
    input wire clk,
    input wire reset,

    output reg [31:0]ir,
    output reg [31:0]pc1
    );
    wire eq,sl,slu;
    reg [31:0]ir_mem[0:16384];


//    parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/ControlTransfer/code.hex";
//     parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/IntRegImm/code.hex";
//     parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/IntRegReg/code.hex";
//     parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/LoadAndStore/code.hex";
//    parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/Uart/code.hex";
//     parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/tests/ZeroRegister/code.hex";
     parameter FILENAME = "/home/denjo/risc/b3exp/benchmarks/Coremark_for_Synthesis/code.hex";

    initial begin
        $readmemh(FILENAME, ir_mem);
    end

    wire [31:0]ir_addr = next_pc>>2; 

    always@(posedge clk)begin
       ir <= ir_mem[ir_addr];
    end
    
    always@(posedge clk)begin
        pc1 <= next_pc;
    end

endmodule