`timescale 1ns / 1ps

`include "99_define.vh"

module execute(
    input wire clk,

    input wire [31:0]r1_data,
    input wire [31:0]r2_data,
    input wire [31:0]imm,  
    input wire [31:0]pc,

    input wire [3:0]alucode,
    input wire using_r2,//r2 or imm  
    input wire using_pc,//r1 or pc

    input wire write_reg,
    input wire [2:0]info_load,
    input wire [1:0]info_store,
    input wire [3:0]info_branch,
    input wire [4:0]dstreg_addr,

    output reg [31:0] alu_result,
    output reg [31:0] next_pc,

    output reg [31:0]rs2E,
    output reg write_regE,
    output reg [2:0]info_loadE,
    output reg [1:0]info_storeE,
    output reg [4:0]dstreg_addrE
    );

    wire [31:0] ans;
    wire signal;
    wire [31:0]notbranch;
    wire [31:0]npc;

    assign notbranch = pc+4;//default program counter

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

    gen_branch_signal gen_branch_signal0 (
        .info_branch(info_branch),
        .reg1(r1_data),
        .reg2(r2_data),

        .branch_signal(signal)
    );

    sequencer sequencer0 (
        .branch_signal(signal),
        .branch(ans),
        .notbranch(notbranch),
        
        .npc(npc)
    );

    always@(posedge clk)begin
        case(info_branch)
            `BJAL,`BJALR:alu_result <= notbranch;
            default:alu_result <= ans;
        endcase
        
        next_pc <= npc;

        rs2E <= r2_data;
        write_regE <= write_reg;
        info_loadE <= info_load;
        info_storeE <= info_store;
        dstreg_addrE <= dstreg_addr;
    end
    
endmodule