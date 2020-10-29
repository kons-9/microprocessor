`timescale 1ns / 1ps

`include "00_cpu.v"
`include "99_define.v"

module cpu_tb;
    reg sysclk;
    reg cpu_resetn;

    parameter CYC = 2;

    always begin
        #(CYC/2);
        sysclk = ~sysclk;
    end 

    cpu cpu0(
        .sysclk(sysclk),
        .cpu_resetn(cpu_resetn)
    );

    initial begin
        sysclk = 1'b0;
        cpu_resetn = 1'b0;
        #(CYC);
        cpu_resetn = 1'b1;
        #100000 $finish;
    end



endmodule

    

