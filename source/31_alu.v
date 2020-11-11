`timescale 1ns / 1ps

`include "99_define.v"

module alu(
    input wire [31:0]r1,
    input wire [31:0]r2,
    input wire [31:0]imm,  
    input wire [31:0]pc,

    input wire [4:0]alucode,
    input wire using_r2,//r2 or imm  
    input wire using_pc,//r1 or pc
    output wire [31:0] alu_result
    );

    wire[31:0] x,y;

    assign x = using_pc ? pc : r1;//pc or r1
    assign y = using_r2 ? r2 : imm;//r2 or imm

    wire[63:0] mulx,muly;

    assign mulx = mul_x(x,alucode);
    assign muly = mul_y(y,alucode);
    
    wire [63:0]mul = mulx*muly;

    wire mul_sig = alucode[4];

    assign alu_result = mul_sig?mulans(alucode,x,y,mul):ans(x,y,alucode);

    function [31:0]ans;
        input [31:0] x,y;
        input [4:0]alucode;
        
        case(alucode)
            `ADD: ans = x+y;
            `SUB: ans= x-y;
            `SLT: ans= ($signed(x) < $signed(y));
            `SLTu: ans = $unsigned(x)<$unsigned(y);
            `SLL: ans = x<<y[4:0];
            `SRL: ans = x>>y[4:0];
            `SRA: ans = $signed(x)>>>$signed(y[4:0]); 
            `AND: ans = x&y;
            `OR: ans = x|y;
            `XOR: ans = x^y;
            `LUI: ans = y;
            default: ans = {32{1'b1}};
        endcase
    endfunction

    function [31:0]mulans;
        input[4:0] alucode;
        input[31:0]x,y;
        input[63:0]mul;

        case(alucode)
            `MUL: mulans = mul[31:0];
            `MULH,`MULHSU,`MULHU: mulans = mul[63:32];
            `DIV:begin
                mulans =   y==32'b0 ? 32'hFFFFFFFF:
                            (y==32'hFFFFFFFF && x==32'h80000000)?
                            32'h80000000:$signed(x)/$signed(y);
            end
            `DIVU:begin
                mulans =   y==0?32'hFFFFFFFF:$unsigned(x)/$unsigned(y);
            end
            `REM:begin
                mulans =   y==32'b0 ? x:
                            (x==32'h80000000&&y==32'hFFFFFFFF)?
                            32'b0:$signed(x)%$signed(y);
            end
            `REMU:begin
                mulans = y==32'b0 ? x : $unsigned(x) % $unsigned(y);
            end
            default:mulans = 32'b0;
        endcase
    endfunction

    function [63:0]mul_x;
        input [31:0] x;
        input [4:0]alucode;

        case(alucode)
            `MUL,`MULH,`MULHSU,`DIV,`REM: mul_x = {{32{x[31]}},x[31:0]};
            `MULHU,`DIVU,`REMU: mul_x = {{32{1'b0}},x[31:0]};
            default:  mul_x = {{32{x[31]}},x[31:0]};
        endcase
    endfunction

    function [63:0]mul_y;
        input [31:0] x;
        input [4:0]alucode;

        case(alucode)
            `MUL,`MULH,`DIV,`REM: mul_y = {{32{x[31]}},x[31:0]};
            `MULHU,`MULHSU,`DIVU,`REMU: mul_y = {{32{1'b0}},x[31:0]};
            default:  mul_y = {{32{x[31]}},x[31:0]};
        endcase
    endfunction

endmodule