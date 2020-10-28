//
// alu test bench
//

`define assert(name, signal, value) \
        if (signal !== value) begin \
            $display("ASSERTION FAILED in %s : signal is '0x%x' but expected '0x%x'!", name, signal, value); \
            $finish; \
        end else begin \
            $display("    signal == value"); \
        end

`define test(name, ex_result) \
        $display("%s:", name); \
        $display("    code: 0x%x, op1: 0x%x, op2: 0x%x", code, op1, op2); \
        `assert("result", result, ex_result) \
        $display("%s test passed\n", name); \

`include "99_define.v"
`include "31_alu.v"

module alu_tb;

    reg clk;
    reg [5:0] code;
    reg [31:0] op1;
    reg [31:0] op2;
    wire [31:0]  result;
    wire br;

    alu alu(
       .alucode(code),
       .r1(op1),
       .r2(op2),
       .imm(result),
       .using_r2(`TRUE),
       .using_pc(`FALSE),
       .alu_result(result)
    );

    initial begin
        clk<=0;
        // -----------------------------
        // arithmetic operations
        // -----------------------------
        
        code = `ADD;
        op1 = 32'd34;
        op2 = 32'd55;
        #10;
        `test("ADD", 32'd89)

        code = `SUB;
        op1 = 32'd55;
        op2 = 32'd56;
        #10;
        `test("SUB", 32'hFFFFFFFF)

        code = `SLT;
        op1 = 32'hFEEDFACE;
        op2 = 32'hBADCAB1E;
        #10;
        `test("SLT", 32'h0)

        code = `SLTu;
        op1 = 32'hBADCAB1E;
        op2 = 32'hFEEDFACE;
        #10;
        `test("SLTU", 32'h1)


        // -----------------------------
        // logical operations
        // -----------------------------
        code = `XOR;
        op1 = 32'hBADCAB1E;
        op2 = 32'hFEEDFACE;
        #10;
        `test("XOR", 32'h443151d0)
        
        code = `OR;
        op1 = 32'hBADCAB1E;
        op2 = 32'hFEEDFACE;
        #10;
        `test("OR", 32'hFEFDFBDE)

        code = `AND;
        op1 = 32'hBADCAB1E;
        op2 = 32'hFEEDFACE;
        #10;
        `test("AND", 32'hBACCAA0E)


        // -----------------------------
        // shift operations
        // -----------------------------
        code = `SLL;
        op1 = 32'hFEEDFACE;
        op2 = 32'd1036;
        #10;
        `test("SLL", 32'hDFACE000)

        code = `SRL;
        op1 = 32'hDEADDEAD;
        op2 = 32'd16;
        #10;
        `test("SRL", 32'hDEAD)

        code = `SRA;        
        op1 = 32'hDEADDEAD;
        op2 = 32'd16;
        #10;
        `test("SRA", 32'hFFFFDEAD)

        $display("all ALU-tests passed!");
    end

endmodule