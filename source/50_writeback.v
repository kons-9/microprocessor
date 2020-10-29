`timescale 1ns / 1ps

module writeback(
    input wire clk,
    input wire reset,
    input wire [31:0]branch,

    input wire w_reg,
    input wire [31:0]rd_data,
    input wire [4:0]dst_addr,
    input wire [31:0]next_pcD,

    output reg [31:0]next_pc,

    output reg [4:0]dstreg_addr,
    output reg write_reg,
    output reg [31:0]dstreg_data
    );

    always@(posedge clk or negedge reset)begin
        if(reset == 0) next_pc <= 32'h00008000;
        else if (clk == 1) next_pc <= next_pcD;
        else begin end

        write_reg <= w_reg;
        dstreg_data <= rd_data;
        dstreg_addr <= dst_addr;
    end
endmodule