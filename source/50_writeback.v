
`include "sequencer.v"

module writeback(
    input wire clk,
    input wire [31:0]notbranch,
    input wire [31:0]branch,
    input wire [3:0]info_branch,

    input wire w_reg,
    input wire rd_data[31:0],
    input wire [4:0]dst_addr,

    output reg [31:0]next_pc,

    output reg [4:0]dstreg_addr,
    output reg write_reg,
    output reg [31:0]dstreg_data
    );

    wire [31:0]npc;

    sequencer sequencer0(
        .info_branch(info_branch),
        .branch(branch),
        .notbranch(notbranch),
        .next_pc(npc)
    );


    always@(posedge clk)begin
        next_pc <= npc;

        write_reg <= w_reg;
        dstreg_data <= rd_data;
        dstreg_addr <= dst_addr;
    end