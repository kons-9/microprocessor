`timescale 1ns / 1ps

`include "10_fetch.v"
`include "20_decoder.v"
`include "30_execute.v"
`include "40_datamem.v"
`include "50_writeback.v"
`include "99_define.v"
`include "99_regfile.v"

module cpu(
    sysclk
    );
    // the number of stage is five.
    //1st stage is fetch.
    //2nd stage is decode.
    //3rd stage is execute.
    //4th stage is save data(datamem).
    //5th stage is writeback.

    wire [31:0]next_pc;
    wire [31:0]ir;
    wire [31:0]pc1;
    //fetch
    fetch fetch0(
        .clk(sysclk),
        .next_pc(next_pc),

        .ir(ir),
        .pc1(pc1)
    );

    wire [4:0]reg1_addr;
    wire [4:0]reg2_addr;
    wire [4:0]dstreg_addr;
    wire [31:0]imm;
    wire [3:0]alucode;
    wire using_r2;
    wire using_pc;
    wire write_reg;
    wire [2:0] info_load;
    wire [1:0] info_store;
    wire [2:0] info_branch;
    wire [31:0] pc2;
    //decode
    decoder decoder0(
        //input
        .clk(sysclk),
        .ir(ir),
        .pc1(pc1),
        //output
        .srcreg1_num(reg1_addr),
        .srcreg2_num(reg2_addr),
        .dstreg_num(dstreg_addr),
        .imm(imm),
        .alucode(alucode),
        .using_r2(using_r2),
        .using_pc(using_pc),
        .write_reg(write_reg),
        .info_load(info_load),
        .info_store(info_store),
        .info_branch(info_branch),
        .pc2(pc2)
    );

    wire [31:0]r1_data;
    wire [31:0]r2_data;

    wire [31:0]notbranch;
    wire [31:0]alu_result;
    wire [31:0]rs2E;
    wire write_regE;
    wire [2:0] info_loadE;
    wire [1:0] info_storeE;
    wire [2:0] info_branchE;
    wire [4:0] dstreg_addrE;
    //execute
    execute execute0(
        //input
        .clk(sysclk),
        .r1_data(r1_data),
        .r2_data(r2_data),
        .dstreg(dstreg_data),
        .imm(imm),
        .pc(pc2)
        .alucode(alucode),
        .using_r2(using_r2),
        .using_pc(using_pc),
        .write_reg(write_reg),//unused
        .info_load(info_load),//unused
        .info_store(info_store),//unused
        .info_branch(info_branch),//unused
        .dstreg_addr(dstreg_addr),
        //output
        .notbranch_pc(notbranch),
        .alu_result(alu_result),
        .rs2E(rs2E),//unused
        .write_regE(write_regE),//unused
        .info_loadE(info_loadE),//unused
        .info_storeE(info_storeE),//unused
        .info_branchE(info_branchE),//unused
        .dstreg_addrE(dstreg_addrE)
    );

    wire w_regD;
    wire [31:0]rd_dataD;
    wire [31:0]notbranchD;
    wire [31:0]branchD;
    wire [2:0]info_branchD;
    wire [4:0]dst_addrD;
    //writemem
    datamem datamem0(
        //input
        .clk(sysclk),
        .info_load(info_loadE),
        .info_store(info_storeE),
        .alu_result(alu_result),
        .rs2(rs2E),
        .notbranch_pc(notbranch),//unused
        .write_reg(write_regE),//unused
        .info_branch(info_branchE),//unused
        .dst_addr(dstreg_addrE),
        //output
        .w_reg(w_regD),
        .rd_data(rd_dataD),
        .notbranchD(notbranchD),//unused
        .branchD(branchD),//unused
        .info_branchD(info_branchD),//unused
        .dst_addrD(dst_addrD)
    );

    wire [4:0]dstreg_addrW;
    wire w_regW;
    wire [5:0]dst_dataW;
    //writeback
    writeback writeback0(
        //input
        .clk(sysclk),
        .notbranch(notbranchD),
        .branch(branchD),
        .info_branch(info_branchD),
        .w_reg(w_regD),
        .rd_data(rd_dataD),
        .dst_addr(dst_addrD),
        //output
        .next_pc(next_pc),
        .dstreg_addr(dstreg_addrW),
        .write_reg(w_regW),
        .dstreg_data(dst_dataW)
        );


    //regster file(decode,writeback)
    regfile regfile0(
        //input
        .clk(sysclk),
        .reg1_addr(reg1_addr),//after decode
        .reg2_addr(reg2_addr),//after decode
        .dstreg_addr(dstreg_addrW),
        .write_reg(w_regW),
        .dstreg_data(dst_dataW),
        //output
        .reg1_data(r1_data),//execute
        .reg2_data(r2_data)//execute
    );


endmodule



