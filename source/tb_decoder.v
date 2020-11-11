//
// decoder_tb
//

`include "99_define.v"
`include "20_decoder.v"

`define assert(name, signal, value) \
        if (signal !== value) begin \
            $display("ASSERTION FAILED in %s : signal is '%d' but expected '%d'", name, signal, value); \
            $finish; \
        end else begin \
            $display("\t%m: signal == value"); \
        end

`define test(name, ir, ex_srcreg1_num, ex_srcreg2_num, ex_dstreg_num, ex_imm, ex_alucode, ex_using_r2, ex_using_pc, ex_write_reg, ex_info_load, ex_info_store, ex_info_branch) \
        $display("%s:", name); \
        $display("\tcodeword: %b", ir); \
        `assert("srcreg1_num", srcreg1_num, ex_srcreg1_num) \
        `assert("srcreg2_num", srcreg2_num, ex_srcreg2_num) \
        `assert("dstreg_num", dstreg_num, ex_dstreg_num) \
        `assert("imm", imm, ex_imm) \
        `assert("alucode", alucode, ex_alucode) \
        `assert("using_r2", using_r2, ex_using_r2) \
        `assert("using_pc", using_pc, ex_using_pc) \
        `assert("write_reg", write_reg, ex_write_reg) \
        `assert("info_load", info_load, ex_info_load) \
        `assert("info_store", info_store, ex_info_store) \
        $display("%s test ...ok\n", name); 



module decoder_tb;
    reg [31:0] ir;
    reg clk;
    wire [4:0] srcreg1_num;
    wire [4:0] srcreg2_num;
    wire [4:0] dstreg_num;
    wire [31:0] imm;
    wire [4:0] alucode;
    wire using_r2;
    wire using_pc;
    wire write_reg;
    wire [2:0]info_load;
    wire [1:0]info_store;
    wire [2:0]info_branch;

    decoder decoder(
        .ir(ir),
        .clk(clk),
        .srcreg1_num(srcreg1_num),
        .srcreg2_num(srcreg2_num),
        .dstreg_num(dstreg_num),
        .imm(imm),
        .alucode(alucode),
        .using_r2(using_r2),
        .using_pc(using_pc),
        .write_reg(write_reg),
        .info_load(info_load),
        .info_store(info_store),
        .info_branch(info_branch)
    );


    always begin
        clk <=~clk;
        #5;
    end


    initial begin
        clk<=1;

        // --------------------------------------- //
        // tworeg
        // --------------------------------------- //

        // 32'hb50633 ADD [10, 11] [12] 0
        ir = 32'hb50633; #10;
        `test("ADD", ir, 10, 11, 12, 0, `ADD, `TRUE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)
        `assert("srcreg1_num", srcreg1_num, 10)

        // 32'h40b60633 SUB [12, 11] [12] 0
        ir = 32'h40b60633; #10;
        `test("SUB", ir, 12, 11, 12, 0, `SUB, `TRUE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH);

        // 32'h11626b3 SLT [12, 17] [13] 0
        ir = 32'h11626b3; #10;
        `test("SLT", ir, 12, 17, 13, 0, `SLT, `TRUE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH);

        // 32'hc5b6b3 SLTU [11, 12] [13] 0
        ir = 32'hc5b6b3; #10;
        `test("SLTu", ir, 11, 12, 13, 0, `SLTu, `TRUE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'hb57733 AND [10, 11] [14] 0
        ir = 32'hb57733; #10;
        `test("AND", ir, 10, 11, 14, 0, `AND, `TRUE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'hc8e733 OR [17, 12] [14] 0
        ir = 32'hc8e733; #10;
        `test("OR", ir, 17, 12, 14, 0, `OR, `TRUE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'hc8c733 XOR [17, 12] [14] 0
        ir = 32'hc8c733; #10;
        `test("XOR", ir, 17, 12, 14, 0, `XOR, `TRUE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'hc597b3 SLL [11, 12] [15] 0
        ir = 32'hc597b3; #10;
        `test("SLL", ir, 11, 12, 15, 0, `SLL, `TRUE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'hb657b3 SRL [12, 11] [15] 0
        ir = 32'hb657b3; #10;
        `test("SRL", ir, 12, 11, 15, 0, `SRL, `TRUE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'h40b5d7b3 SRA [11, 11] [15] 0
        ir = 32'h40b5d7b3; #10;
        `test("SRA", ir, 11, 11, 15, 0, `SRA, `TRUE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)


        // --------------------------------------- //
        // onereg
        // --------------------------------------- //

        // 32'hfff00513 ADDI [0] [10] -1
        ir = 32'hfff00513; #10;
        `test("ADDI", ir, 0, 0, 10, 32'hffffffff, `ADD, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'h150593 ADDI [10] [11] 1
        ir = 32'h150593; #10;
        `test("ADDI", ir, 10, 0, 11, 1, `ADD, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'h5a613 SLTI [11] [12] 0
        ir = 32'h5a613; #10;
        `test("SLTI", ir, 11, 0, 12, 0, `SLT, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'hfff5a613 SLTI [11] [12] -1
        ir = 32'hfff5a613; #10;
        `test("SLTI", ir, 11, 0, 12, -1, `SLT, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'h5b693 SLTIU [11] [13] 0
        ir = 32'h5b693; #10;
        `test("SLTIU", ir, 11, 0, 13, 0, `SLTu, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'hfff5b693 SLTIU [11] [13] -1
        ir = 32'hfff5b693; #10;
        `test("SLTIU", ir, 11, 0, 13, -1, `SLTu, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'h15f713 ANDI [11] [14] 1
        ir = 32'h15f713; #10;
        `test("ANDI", ir, 11, 0, 14, 1, `AND, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'hfff5f713 ANDI [11] [14] -1
        ir = 32'hfff5f713; #10;
        `test("ANDI", ir, 11, 0, 14, -1, `AND, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'h5e713 ORI [11] [14] 0
        ir = 32'h5e713; #10;
        `test("ORI", ir, 11, 0, 14, 0, `OR, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'hfff6e713 ORI [13] [14] -1
        ir = 32'hfff6e713; #10;
        `test("ORI", ir, 13, 0, 14, -1, `OR, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'h5c713 XORI [11] [14] 0
        ir = 32'h5c713; #10;
        `test("XORI", ir, 11, 0, 14, 0, `XOR, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'hfff5c713 XORI [11] [14] -1
        ir = 32'hfff5c713; #10;
        `test("XORI", ir, 11, 0, 14, -1, `XOR, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'h279793 SLLI [15] [15] 2
        ir = 32'h279793; #10;
        `test("SLLI", ir, 15, 0, 15, 2, `SLL, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'h17d793 SRLI [15] [15] 1
        ir = 32'h17d793; #10;
        `test("SRLI", ir, 15, 0, 15, 1, `SRL, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'h15d793 SRLI [11] [15] 1
        ir = 32'h15d793; #10;
        `test("SRLI", ir, 11, 0, 15, 1, `SRL, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'h4015d793 SRAI [11] [15] 1
        ir = 32'h4015d793; #10;
        `test("SRAI", ir, 11, 0, 15, 1, `SRA, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'h1837 LUI [] [16] 1
        ir = 32'h1837; #10;
        `test("LUI", ir, 0, 0, 16, 4096, `UNUSED, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'h808805b7 LUI [] [11] -522112
        ir = 32'h808805b7; #10;
        `test("LUI", ir, 0, 0, 11, 2156396544, `UNUSED, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)

        // 32'h817 AUIPC [] [16] 0
        ir = 32'h817; #10;
        `test("AUIPC", ir, 0, 0, 16, 0, `ADD, `FALSE, `TRUE, `TRUE, `NOTLOAD, `NOTSTORE, `NOTBRANCH)


        // --------------------------------------- //
        // memaccess
        // --------------------------------------- //

        // 32'hb52023 SW [10, 11] [] 0
        ir = 32'hb52023; #10;
        `test("SW", ir, 10, 11, 0, 0, `ADD, `FALSE, `FALSE, `FALSE, `NOTLOAD, `Sw, `NOTBRANCH)

        // 32'hb51023 SH [10, 11] [] 0
        ir = 32'hb51023; #10;
        `test("SH", ir, 10, 11, 0, 0, `ADD, `FALSE, `FALSE, `FALSE, `NOTLOAD, `Sh, `NOTBRANCH)

        // 32'hb510a3 SH [10, 11] [] 1
        ir = 32'hb510a3; #10;
        `test("SH", ir, 10, 11, 0, 1, `ADD, `FALSE, `FALSE, `FALSE, `NOTLOAD, `Sh, `NOTBRANCH)

        // 32'hb50023 SB [10, 11] [] 0
        ir = 32'hb50023; #10;
        `test("SB", ir, 10, 11, 0, 0, `ADD, `FALSE, `FALSE, `FALSE, `NOTLOAD, `Sb, `NOTBRANCH)

        // 32'hb500a3 SB [10, 11] [] 1
        ir = 32'hb500a3; #10;
        `test("SB", ir, 10, 11, 0, 1, `ADD, `FALSE, `FALSE, `FALSE, `NOTLOAD, `Sb, `NOTBRANCH)

        // 32'h52683 LW [10] [13] 0
        ir = 32'h52683; #10;
        `test("LW", ir, 10, 0, 13, 0, `ADD, `FALSE, `FALSE, `TRUE, `Lw, `NOTSTORE, `NOTBRANCH)

        // 32'h51683 LH [10] [13] 0
        ir = 32'h51683; #10;
        `test("LH", ir, 10, 0, 13, 0, `ADD, `FALSE, `FALSE, `TRUE, `Lh, `NOTSTORE, `NOTBRANCH)

        // 32'h251683 LH [10] [13] 2
        ir = 32'h251683; #10;
        `test("LH", ir, 10, 0, 13, 2, `ADD, `FALSE, `FALSE, `TRUE, `Lh, `NOTSTORE, `NOTBRANCH)

        // 32'h250683 LB [10] [13] 2
        ir = 32'h250683; #10;
        `test("LB", ir, 10, 0, 13, 2, `ADD, `FALSE, `FALSE, `TRUE, `Lb, `NOTSTORE, `NOTBRANCH)

        // 32'h350683 LB [10] [13] 3
        ir = 32'h350683; #10;
        `test("LB", ir, 10, 0, 13, 3, `ADD, `FALSE, `FALSE, `TRUE, `Lb, `NOTSTORE, `NOTBRANCH)

        // 32'h55683 LHU [10] [13] 0
        ir = 32'h55683; #10;
        `test("LHU", ir, 10, 0, 13, 0, `ADD, `FALSE, `FALSE, `TRUE, `Lhu, `NOTSTORE, `NOTBRANCH)

        // 32'h155683 LHU [10] [13] 1
        ir = 32'h155683; #10;
        `test("LHU", ir, 10, 0, 13, 1, `ADD, `FALSE, `FALSE, `TRUE, `Lhu, `NOTSTORE, `NOTBRANCH)

        // 32'h255683 LHU [10] [13] 2
        ir = 32'h255683; #10;
        `test("LHU", ir, 10, 0, 13, 2, `ADD, `FALSE, `FALSE, `TRUE, `Lhu, `NOTSTORE, `NOTBRANCH)

        // 32'h154683 LBU [10] [13] 1
        ir = 32'h154683; #10;
        `test("LBU", ir, 10, 0, 13, 1, `ADD, `FALSE, `FALSE, `TRUE, `Lbu, `NOTSTORE, `NOTBRANCH)

        // 32'h254683 LBU [10] [13] 2
        ir = 32'h254683; #10;
        `test("LBU", ir, 10, 0, 13, 2, `ADD, `FALSE, `FALSE, `TRUE, `Lbu, `NOTSTORE, `NOTBRANCH)

        // 32'h354683 LBU [10] [13] 3
        ir = 32'h354683; #10;
        `test("LBU", ir, 10, 0, 13, 3, `ADD, `FALSE, `FALSE, `TRUE, `Lbu, `NOTSTORE, `NOTBRANCH)


        // --------------------------------------- //
        // branch
        // --------------------------------------- //

        // 32'hfec584e3 BEQ [11, 12] [] -24
        ir = 32'hfec584e3; #10;
        `test("BEQ", ir, 11, 12, 0, -24, `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Beq)

        // 32'hd60463 BEQ [12, 13] [] 8
        ir = 32'hd60463; #10;
        `test("BEQ", ir, 12, 13, 0, 8, `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Beq)

        // 32'hfcd61ce3 BNE [12, 13] [] -40
        ir = 32'hfcd61ce3; #10;
        `test("BNE", ir, 12, 13, 0, -40,  `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Bne)

        // 32'hc59463 BNE [11, 12] [] 8
        ir = 32'hc59463; #10;
        `test("BNE", ir, 11, 12, 0, 8, `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Bne)

        // 32'hfcd644e3 BLT [12, 13] [] -56
        ir = 32'hfcd644e3; #10;
        `test("BLT", ir, 12, 13, 0, -56, `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Bne)

        // 32'hfce542e3 BLT [10, 14] [] -60
        ir = 32'hfce542e3; #10;
        `test("BLT", ir, 10, 14, 0, -60, `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Blt)

        // 32'ha74463 BLT [14, 10] [] 8
        ir = 32'ha74463; #10;
        `test("BLT", ir, 14, 10, 0, 8, `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Blt)

        // 32'hfaa75ae3 BGE [14, 10] [] -76
        ir = 32'hfaa75ae3; #10;
        `test("BGE", ir, 14, 10, 0, -76, `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Bge)

        // 32'he55463 BGE [10, 14] [] 8
        ir = 32'he55463; #10;
        `test("BGE", ir, 10, 14, 0, 8, `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Bge)

        // 32'hd65463 BGE [12, 13] [] 8
        ir = 32'hd65463; #10;
        `test("BGE", ir, 12, 13, 0, 8, `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Bge)

        // 32'hf8d66ce3 BLTU [12, 13] [] -104
        ir = 32'hf8d66ce3; #10;
        `test("BLTU", ir, 12, 13, 0, -104, `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Bltu)

        // 32'hf8a76ae3 BLTU [14, 10] [] -108
        ir = 32'hf8a76ae3; #10;
        `test("BLTU", ir, 14, 10, 0, -108, `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Bltu)

        // 32'he56463 BLTU [10, 14] [] 8
        ir = 32'he56463; #10;
        `test("BLTU", ir, 10, 14, 0, 8, `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Bltu)

        // 32'hf8e572e3 BGEU [10, 14] [] -124
        ir = 32'hf8e572e3; #10;
        `test("BGEU", ir, 10, 14, 0, -124, `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Bgeu)

        // 32'ha77463 BGEU [14, 10] [] 8
        ir = 32'ha77463; #10;
        `test("BGEU", ir, 14, 10, 0, 8, `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Bgeu)

        // 32'hd67463 BGEU [12, 13] [] 8
        ir = 32'hd67463; #10;
        `test("BGEU", ir, 12, 13, 0, 8, `ADD, `FALSE, `TRUE, `FALSE, `NOTLOAD, `NOTSTORE, `Bgeu)

        // 32'h8000ef JAL [] [1] 8
        ir = 32'h8000ef; #10;
        `test("JAL", ir, 0, 0, 1, 8, `ADD, `FALSE, `TRUE, `TRUE, `NOTLOAD, `NOTSTORE, `BJAL)

        // 32'hc0006f JAL [] [0] 12
        ir = 32'hc0006f; #10;
        `test("JAL", ir, 0, 0, 0, 12, `ADD, `FALSE, `TRUE, `TRUE, `NOTLOAD, `NOTSTORE, `BJAL)

        // 32'h8005ef JAL [] [11] 8
        ir = 32'h8005ef; #10;
        `test("JAL", ir, 0, 0, 11, 8, `ADD, `FALSE, `TRUE, `TRUE, `NOTLOAD, `NOTSTORE, `BJAL)

        // 32'h8580e7 JALR [11] [1] 8
        ir = 32'h8580e7; #10;
        `test("JALR", ir, 11, 0, 1, 8, `ADD, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `BJALR)

        // 32'hc08067 JALR [1] [0] 12
        ir = 32'hc08067; #10;
        `test("JALR", ir, 1, 0, 0, 12, `ADD, `FALSE, `FALSE, `TRUE, `NOTLOAD, `NOTSTORE, `BJALR)

        $display("all decoder-tests passed!");
    end

endmodule