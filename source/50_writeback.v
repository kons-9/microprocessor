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
    initial begin
        next_pc <= 32'h8000;
    end

    always@(posedge clk)begin
        write_reg <= w_reg;
        dstreg_data <= rd_data;
        dstreg_addr <= dst_addr;
    end

    always@(posedge clk or negedge reset)begin
        next_pc <= (reset==1'b0) ? 32'h00008000 : next_pcD;
    end
endmodule