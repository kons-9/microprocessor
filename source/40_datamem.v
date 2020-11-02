`timescale 1ns / 1ps
`include "41_load.v"
`include "99_define.v"

module datamem(
    input wire clk,
    input wire [31:0]next_pc,
    input wire[2:0]info_load,
    input wire[1:0]info_store,
    input wire[31:0]alu_result,
    input wire[31:0]rs2,

    input wire write_reg,
    input wire [4:0]dst_addr,
    input wire [31:0] hc_OUT_data,

    output reg [31:0]next_pcD,
    output reg [31:0]rd_data,
    output reg w_reg,
    output reg [31:0]branchD,
    output reg [4:0]dst_addrD
    );

    reg [31:0]datamem[0:70000];//word length equal to 4byte. datamem is byte addressing memory.

    wire [31:0]byte_addr;
    wire [1:0]addr_rem; //addr's remainder
    wire [31:0]addr_data;
    wire [31:0]load_data;
    
    integer i;

    assign byte_addr = {{3{alu_result[31]}},alu_result[30:2]};// division by 4(because word length is 4byte)
    assign addr_rem = alu_result[1:0];// mod 4
    assign addr_data = datamem[byte_addr];

    load load0(
        .addr_data(addr_data),
        .addr_rem(addr_rem),
        .alu_result(alu_result),
        .info_load(info_load),

        .data(load_data)
    );
    parameter FILENAME ="/home/denjo/risc/b3exp/benchmarks/Coremark_for_Synthesis/data.hex";

    initial begin
        //for (i=0; i < 70000; i = i+1)begin datamem[i] <= 32'h00000000;end
        $readmemh(FILENAME, datamem);
    end

    always@(posedge clk)begin
        rd_data <= ((info_load==`Lw)&&(alu_result==`HARDWARE_COUNTER_ADDR))?hc_OUT_data:load_data;
        w_reg <= write_reg;
        branchD <= alu_result;
        dst_addrD<=dst_addr;
        next_pcD <= next_pc;

        case(info_store)
            `Sb:begin
                case(addr_rem)
                    2'b00:datamem[byte_addr][7:0]<=rs2[7:0];
                    2'b01:datamem[byte_addr][15:8]<=rs2[7:0];
                    2'b10:datamem[byte_addr][23:16]<=rs2[7:0];
                    2'b11:datamem[byte_addr][31:24]<=rs2[7:0];
                    default:begin end
                endcase
            end
            `Sh:begin
                case(addr_rem)
                    2'b00:datamem[byte_addr][15:0]<=rs2[15:0];
                    2'b01:datamem[byte_addr][23:8]<=rs2[15:0];
                    2'b10:datamem[byte_addr][31:16]<=rs2[15:0];
                    default:begin end
                endcase
            end
            `Sw:datamem[byte_addr][31:0]<=rs2[31:0];
            default:begin end
        endcase
    end
endmodule
