`timescale 1ns / 1ps

`include "31_alu.v"
`include "32_gen_branch_signal.v"
`include "33_sequencer.v"

module execute(
    input wire clk,

    input wire [31:0]r1_data,
    input wire [31:0]r2_data,
    input wire [31:0]imm,  
    input wire [31:0]pc,

    input wire [3:0]alucode,
    input wire using_r2,//r2 or imm  
    input wire using_pc,//r1 or pc

    input wire [1:0]forward_sig1,
    input wire [1:0]forward_sig2,
    input wire [31:0]forward_data_writemem,
    input wire [31:0]forward_data_writeback,
    input wire flush,

    input wire write_reg,
    input wire [2:0]info_load,
    input wire [1:0]info_store,
    input wire [3:0]info_branch,
    input wire [4:0]dstreg_addr,

    output reg [31:0] alu_result,
    output wire branch_signal,
    output wire [31:0]branch_pc,

    output reg [31:0]rs2E,
    output reg write_regE,
    output reg [2:0]info_loadE,
    output reg [1:0]info_storeE,
    output reg [4:0]dstreg_addrE
    );

    wire [31:0] ans;
    assign branch_pc = ans;

    wire alu_var1,alu_var2;

    assign alu_var1 =   forward_sig1==`NORMAL ? r1_data:
                        forward_sig1==`WRITEMEM ? forward_data_writemem:
                        forward_sig1==`WRITEBACK ? forward_data_writeback:r1_data
    assign alu_var2 =   forward_sig2==`NORMAL ? r2_data:
                        forward_sig2==`WRITEMEM ? forward_data_writemem:
                        forward_sig2==`WRITEBACK ? forward_data_writeback:r2_data
    alu alu0(
        .r1(alu_var1),
        .r2(alu_var2),
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
        .flush(flush),

        .branch_signal(branch_signal)
    );

    always@(posedge clk)begin
        case(info_branch)
            `BJAL,`BJALR:alu_result <= notbranch;
            default:alu_result <= ans;
        endcase

        rs2E <= r2_data;
        write_regE <= write_reg;
        info_loadE <= info_load;
        info_storeE <= info_store;
        dstreg_addrE <= dstreg_addr;
    end 
endmodule