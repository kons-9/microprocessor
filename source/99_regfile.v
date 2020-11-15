`timescale 1ns / 1ps

`include "99_define.vh"

module regfile(
        input wire clk,
        input wire [4:0] reg1_addr,
        input wire [4:0] reg2_addr,

        input wire [4:0] dstreg_addr,
        input wire write_reg,
        input wire [31:0] dstreg_data,

        output wire [31:0]reg1_data,
        output wire [31:0]reg2_data
    );

    reg [31:0]register[31:0];

    assign reg1_data = register[reg1_addr];
    assign reg2_data = register[reg2_addr];
    initial begin
        register[5'b00000]<=32'h00000000;
    end

    always@(posedge clk)begin
        if(write_reg)begin
            if(dstreg_addr==5'b00000)begin
            end
            else register[dstreg_addr]<=dstreg_data;
        end
        else begin end
    end
endmodule