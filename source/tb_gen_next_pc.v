`timescale 1ns / 1ps

`define assert(name, signal, value) \
        if (signal !== value) begin \
            $display("ASSERTION FAILED in %s : signal is '0x%x' but expected '0x%x'!", name, signal, value); \
            $finish; \
        end else begin \
            $display("    signal == value"); \
        end

`define test(name, ex_npc, ex_signal) \
        $display("%s:", name); \
        $display("    info_branch: 0x%x, r1_data: 0x%x, r2_data: 0x%x, alu_result: 0x%x, notbranch:0x%x", info_branch, r1_data, r2_data, alu_result, notbranch); \
        `assert("signal", signal, ex_signal) \
        `assert("npc", npc, ex_npc) \
        $display("%s test passed\n", name); 

`include "99_define.v"
`include "32_gen_branch_signal.v"
`include "11_sequencer.v"

module gen_next_pc_tb;
    reg [3:0]info_branch;
    reg [31:0]r1_data;
    reg [31:0]r2_data;
    reg [31:0]alu_result;
    reg [31:0]notbranch;

    wire signal;
    wire [31:0]npc;

    gen_branch_signal gen_branch_signal0 (
        .info_branch(info_branch),
        .reg1(r1_data),
        .reg2(r2_data),

        .branch_signal(signal)
    );

    sequencer sequencer0 (
        .branch_signal(signal),
        .branch(alu_result),
        .notbranch(notbranch),
        
        .npc(npc)
    );

    initial begin

        info_branch = `Beq;
        r1_data = 32'hFFABCD5A;
        r2_data = 32'h123ABDEA;
        alu_result = 32'hAABBCCDD;
        notbranch = 32'hDDCCBBAA;
        #10`test("BEQ",32'hDDCCBBAA,1'b0)

        info_branch = `Bne;
        r1_data = 32'hFFABCD5A;
        r2_data = 32'h123ABDEA;
        alu_result = 32'hAABBCCDD;
        notbranch = 32'hDDCCBBAA;
        #10`test("BNE",32'hAABBCCDD,1'b1)

        info_branch = `Blt;
        r1_data = 32'hFFABCD5A;
        r2_data = 32'h123ABDEA;
        alu_result = 32'hAABBCCDD;
        notbranch = 32'hDDCCBBAA;
        #10`test("BLT",32'hAABBCCDD,1'b1)

        info_branch = `Bge;
        r1_data = 32'hFFABCD5A;
        r2_data = 32'h123ABDEA;
        alu_result = 32'hAABBCCDD;
        notbranch = 32'hDDCCBBAA;
        #10`test("BGE",32'hDDCCBBAA,1'b0)

        info_branch = `Bltu;
        r1_data = 32'hFFABCD5A;
        r2_data = 32'h123ABDEA;
        alu_result = 32'hAABBCCDD;
        notbranch = 32'hDDCCBBAA;
        #10`test("BLTU",32'hDDCCBBAA,1'b0)

        info_branch = `Bgeu;
        r1_data = 32'hFFABCD5A;
        r2_data = 32'h123ABDEA;
        alu_result = 32'hAABBCCDD;
        notbranch = 32'hDDCCBBAA;
        #10`test("BGEU",32'hAABBCCDD,1'b1)

        info_branch = `BJAL;
        r1_data = 32'hFFABCD5A;
        r2_data = 32'h123ABDEA;
        alu_result = 32'hAABBCCDD;
        notbranch = 32'hDDCCBBAA;
        #10`test("BJAL",32'hAABBCCDD,1'b1)

        info_branch = `BJALR;
        r1_data = 32'hFFABCD5A;
        r2_data = 32'h123ABDEA;
        alu_result = 32'hAABBCCDD;
        notbranch = 32'hDDCCBBAA;
        #10`test("BJALR",32'hAABBCCDD,1'b1)

        info_branch = `NOTBRANCH;
        r1_data = 32'hFFABCD5A;
        r2_data = 32'h123ABDEA;
        alu_result = 32'hAABBCCDD;
        notbranch = 32'hDDCCBBAA;
        #10`test("NOTBRANCH",32'hDDCCBBAA,1'b0)
        #100

        $display("all next_pc-tests passed!");
    end

endmodule