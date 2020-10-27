
`include "41_load.v"
`include "99_define.v"
parameter FILENAME "";

module datamem(
    input wire clk,
    input wire[2:0]info_load,
    input wire[1:0]info_store,
    input wire[31:0]alu_result,
    input wire[31:0]rs2,

    input wire [31:0]notbranch_pc,
    input wire write_reg,
    input wire [2:0]info_branch,
    input wire [4:0]dst_addr,

    output reg [31:0]rd_data,
    output reg w_reg,
    output reg [31:0]notbranchD,
    output reg [31:0]branchD,
    output reg [2:0]info_branchD,
    output reg [4:0]dst_addrD
    );

    reg [31:0]datamem[0:255];//word length equal to 4byte. datamem is byte addressing memory.

    wire [31:0]byte_addr;
    wire [1:0]addr_rem; //addr's remainder
    wire [31:0]addr_data;
    wire [31:0]load_data;

    assign byte_addr = {{2{alu_result[31]}},alu_result[30:2]};// division by 4(because word length is 4byte)
    assign addr_rem = alu_result[1:0];// mod 4
    assign addr_data = datamem[byte_addr];

    load load0(
        .addr_data(addr_data),
        .addr_rem(addr_rem),
        .load_data(load_data)
    );

    initial begin
        $readmemb(FILENAME,datamem);
    end

    always@(posedge clk)begin
        rd_data <= load_data;
        w_reg <= write_reg;
        notbranchD <= notbranch_pc;
        branchD <= aluresult;
        info_branchD <= info_branch;
        dst_addrD<=dst_addr;

        case(info_store)
            `Sb:begin
                case(mod_4)
                    2'b00:datamem[byte_addr][7:0]<=rs2[7:0];
                    2'b01:datamem[byte_addr][15:7]<=rs2[7:0];
                    2'b10:datamem[byte_addr][23:16]<=rs2[7:0];
                    2'b11:datamem[byte_addr][31:24]<=rs2[7:0];
                    default:
            end
            `Sh:begin
                case(mod_4)
                    2'b00:datamem[byte_addr][15:0]<=rs2[15:0];
                    2'b01:datamem[byte_addr][23:8]<=rs2[15:0];
                    2'b10:datamem[byte_addr][31:16]<=rs2[15:0];
                    default:
            end
            `Sw:datamem[byte_addr][31:0]<=rs2[31:0];
            default:
        endcase
    end

