`timescale 1ns / 1ps

`include "31_alu.v"

module execute(
    input wire clk,

    input wire [31:0]r1_data,
    input wire [31:0]r2_data,
    input wire [31:0]dstreg,
    input wire [31:0]imm,  
    input wire [31:0]pc,

    input wire [3:0]alucode,
    input wire using_r2,//r2 or imm  
    input wire using_pc,//r1 or pc

    input wire write_reg,
    input wire [2:0]info_load,
    input wire [1:0]info_store,
    input wire [2:0]info_branch,
    input wire [4:0]dstreg_addr,

    output reg  [31:0] notbranch_pc,
    output reg [31:0] alu_result,

    output reg [31:0]rs2E,
    output reg write_regE,
    output reg [2:0]info_loadE,
    output reg [1:0]info_storeE,
    output reg [2:0]info_branchE,
    output reg [4:0]dstreg_addrE
    );

    wire [31:0] ans;

    alu alu0(
        .r1(r1_data),
        .r2(r2_data),
        .imm(imm),
        .pc(pc),
        .alucode(alucode),
        .using_pc(using_pc),
        .using_r2(using_r2),
        .alu_result(ans)
    );

    always@(posedge clk)begin
        alu_result <= ans;
        notbranch_pc <= pc +4;

        rs2E <= r2_data;
        write_regE <= wite_reg;
        info_loadE <= info_load;
        info_storeE <= info_store;
        info_branchE <= info_branch;
        dstreg_addrE <= dstreg_addr;
    end
    
endmodule