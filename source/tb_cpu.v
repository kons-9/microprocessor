`timescale 1ns / 1ps

`include "99_define.vh"

module cpu_tb;
    reg sysclk;
    reg cpu_resetn;
    wire uart_tx;

    parameter CYC = 100;

    always begin
        #(CYC/2);
        sysclk = ~sysclk;
    end 

    design_1_wrapper gen_clk_wrapper0(
        .sysclk(sysclk),
        .cpu_resetn(cpu_resetn),
        .uart_tx(uart_tx)
    );

    initial begin
        sysclk = 1'b0;
        cpu_resetn = 1'b0;
        #(CYC);
        cpu_resetn = 1'b1;
        #1410065408 $finish;
    end



endmodule

    

