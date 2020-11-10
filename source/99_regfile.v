`timescale 1ns / 1ps

`include "99_define.v"

module regfile(
        input wire clk,
        input wire [4:0] reg1_addr,
        input wire [4:0] reg2_addr,

        input wire [4:0] dstreg_addr,
        input wire write_reg,
        input wire [31:0] dstreg_data,

        output reg [31:0]reg1_data,
        output reg [31:0]reg2_data
    );

    reg [31:0]register[31:0];

    initial begin
        register[5'b00000]<=32'h00000000;
    end

    always@(posedge clk)begin

        if(write_reg && dstreg_addr!=5'b00000)begin
            register[dstreg_addr]<=dstreg_data;
            if(dstreg_addr==reg1_addr)
                reg1_data <= dstreg_data;
            else
                reg1_data <= register[reg1_addr];

            if(dstreg_addr==reg2_addr)
                reg2_data <= dstreg_data;
            else
                reg2_data <= register[reg2_addr];
        end
        else begin 
            reg1_data <= register[reg1_addr];
            reg2_data <= register[reg2_addr];
        end
    end
endmodule