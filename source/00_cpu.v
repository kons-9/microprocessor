`timescale 1ns / 1ps

`include "10_fetch.v"
`include "20_decoder.v"
`include "30_execute.v"
`include "40_datamem.v"
`include "50_writeback.v"
`include "99_define.v"
`include "99_regfile.v"
`include "99_uart.v"
`include "99_hardware_counter.v"

module cpu(
    input wire sysclk,
    input wire cpu_resetn,
    input wire uart_tx
    );
    // the number of stage is five.
    //1st stage is fetch.
    //2nd stage is decode.
    //3rd stage is execute.
    //4th stage is save data(datamem).
    //5th stage is writeback.

    reg fclk,dclk,eclk,mclk,wclk;

    initial begin
        fclk<=0;
        dclk<=0;
        eclk<=0;
        mclk<=0;
        wclk<=0;
    end

    always@(posedge sysclk)begin
        if(fclk==1)begin
            dclk <=1;
            fclk <= 0;
        end 
        else if(dclk==1)begin
            dclk <= 0;
            eclk <= 1;
        end
        else if(eclk==1)begin
            eclk<=0;
            mclk<=1;
        end
        else if(mclk ==1)begin
            mclk<=0;
            wclk<=1;
        end
        else begin
            wclk<=0;
            fclk<=1;
        end
    end


    wire [31:0]next_pc;
    wire [31:0]ir;
    wire [31:0]pc1;
    //fetch
    fetch fetch0(
        .clk(fclk),
        .reset(cpu_resetn),
        .next_pc(next_pc),

        .ir(ir),
        .pc1(pc1)
    );

    wire [4:0]reg1_addr;
    wire [4:0]reg2_addr;
    wire [4:0]dstreg_addr;
    wire [31:0]imm;
    wire [3:0]alucode;
    wire using_r2;
    wire using_pc;
    wire write_reg;
    wire [2:0] info_load;
    wire [1:0] info_store;
    wire [3:0] info_branch;
    wire [31:0] pc2;

    //decode
    decoder decoder0(
        //input
        .clk(dclk),
        .ir(ir),
        .pc1(pc1),
        //output
        .srcreg1_num(reg1_addr),
        .srcreg2_num(reg2_addr),
        .dstreg_num(dstreg_addr),
        .imm(imm),
        .alucode(alucode),
        .using_r2(using_r2),
        .using_pc(using_pc),
        .write_reg(write_reg),
        .info_load(info_load),
        .info_store(info_store),
        .info_branch(info_branch),
        .pc2(pc2)
    );

    wire [31:0]r1_data;
    wire [31:0]r2_data;

    wire [31:0]alu_result;
    wire [31:0]rs2E;
    wire write_regE;
    wire [2:0] info_loadE;
    wire [1:0] info_storeE;
    wire [4:0] dstreg_addrE;
    wire [31:0] next_pcE;
    //execute
    execute execute0(
        //input
        .clk(eclk),
        .r1_data(r1_data),
        .r2_data(r2_data),
        .imm(imm),
        .pc(pc2),
        .alucode(alucode),
        .using_r2(using_r2),
        .using_pc(using_pc),
        .write_reg(write_reg),//unused
        .info_load(info_load),//unused
        .info_store(info_store),//unused
        .info_branch(info_branch),//unused
        .dstreg_addr(dstreg_addr),
        
        //output
        .alu_result(alu_result),
        .next_pc(next_pcE),
        .rs2E(rs2E),//unused
        .write_regE(write_regE),//unused
        .info_loadE(info_loadE),//unused
        .info_storeE(info_storeE),//unused
        .dstreg_addrE(dstreg_addrE)
    );

    wire [31:0]next_pcD;
    wire w_regD;
    wire [31:0]rd_dataD;
    wire [31:0]branchD;
    wire [4:0]dst_addrD;

    wire [31:0] hc_OUT_data;
    //writemem
    datamem datamem0(
        //input
        .clk(mclk),
        .info_load(info_loadE),
        .info_store(info_storeE),
        .alu_result(alu_result),
        .rs2(rs2E),
        .write_reg(write_regE),//unused
        .dst_addr(dstreg_addrE),
        .next_pc(next_pcE),
        .hc_OUT_data(hc_OUT_data),
        //output
        .next_pcD(next_pcD),
        .w_reg(w_regD),
        .rd_data(rd_dataD),
        .branchD(branchD),//unused
        .dst_addrD(dst_addrD)
    );

    // wire [4:0]dstreg_addrW;
    // wire w_regW;
    // wire [31:0]dst_dataW;
    // //writeback
    // writeback writeback0(
    //     //input
    //     .clk(wclk),
    //     .branch(branchD),
    //     .w_reg(w_regD),
    //     .rd_data(rd_dataD),
    //     .dst_addr(dst_addrD),
    //     .next_pcD(next_pcD),
    //     //output
    //     .next_pc(next_pc),
    //     .dstreg_addr(dstreg_addrW),
    //     .write_reg(w_regW),
    //     .dstreg_data(dst_dataW)
    // );

    //regster file(decode,writeback)
    regfile regfile0(
        //input
        .clk(sysclk),
        .reg1_addr(reg1_addr),//after decode
        .reg2_addr(reg2_addr),//after decode
        .dstreg_addr(dstreg_addrW),
        .write_reg(w_regW),
        .dstreg_data(dst_dataW),
        //output
        .reg1_data(r1_data),//execute
        .reg2_data(r2_data)//execute
    );

    /*                 */
    /* HardwareCounter */
    /*                 */
    // wire [31:0] hc_OUT_data;

    hardware_counter hardware_counter0(
        .CLK_IP(sysclk),
        .RSTN_IP(cpu_resetn),
        .COUNTER_OP(hc_OUT_data)
    );

    /*      */
    /* uart */
    /*      */
    wire [7:0] uart_IN_data;
    wire uart_we;
    wire uart_OUT_data;

    // Memory Accessステージに下記のような記述を追加
    assign uart_IN_data = rs2E[7:0];  // ストアするデータをモジュールへ入力
    assign uart_we = ((alu_result == `UART_ADDR) && (info_storeE != `NOTSTORE)) ? 1'b1 : 1'b0;  // シリアル通信用アドレスへのストア命令実行時に送信開始信号をアサート
    assign uart_tx = uart_OUT_data;  // シリアル通信モジュールの出力はFPGA外部へと出力

    uart uart0(
        .uart_tx(uart_OUT_data),
        .uart_wr_i(uart_we),

        .uart_dat_i(uart_IN_data),
        .sys_clk_i(sysclk),
        .sys_rstn_i(cpu_resetn)
    );




endmodule



