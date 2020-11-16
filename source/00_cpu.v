`timescale 1ns / 1ps

`include "99_define.vh"

module cpu(
    input wire sysclk,
    input wire cpu_resetn,
    output wire uart_tx
    );
    // the number of stage is five.
    //1st stage is fetch.
    //2nd stage is decode.
    //3rd stage is execute.
    //4th stage is save data(datamem).
    //5th stage is writeback.

    wire [31:0]ir;
    wire branch_sig;
    wire stallF;
    wire stallD;
    wire [31:0]branch_pc;
    wire [31:0]npc;

    //fetch
    fetch fetch0(
        .clk(sysclk),
        .reset(cpu_resetn),
        .branch_sig(branch_sig),
        .branch_pc(branch_pc),
        .stallF(stallF),
        .stallD(stallD),

        .ir(ir),
        .npc(npc)
    );

    wire flushE;
    
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
    wire [4:0] Ereg1_addr;
    wire [4:0] Ereg2_addr;

    //decode
    decoder decoder0(
        //input
        .clk(sysclk),
        .ir(ir),
        .pc1(npc),
        .flush(flushE),
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
        .pc2(pc2),
        .Ereg1_addr(Ereg1_addr),
        .Ereg2_addr(Ereg2_addr)
    );
    wire flushD;
    wire [31:0]load_data;

    wire [31:0]r1_data;
    wire [31:0]r2_data;
    wire [1:0]forward_sig1;
    wire [1:0]forward_sig2;

    wire [31:0]rs2E;
    wire write_regE;
    wire [2:0] info_loadE;
    wire [1:0] info_storeE;
    wire [4:0] dstreg_addrE;
    wire [31:0] alu_result;
    wire [31:0]rd_dataD;
    //execute
    execute execute0(
        //input
        .clk(sysclk),
        .r1_data(r1_data),
        .r2_data(r2_data),
        .imm(imm),
        .pc(pc2),
        .alucode(alucode),
        .using_r2(using_r2),
        .using_pc(using_pc),
        .forward_sig1(forward_sig1),
        .forward_sig2(forward_sig2),
        .forward_data_writemem(load_data),
        .forward_data_writeback(rd_dataD),
        .write_reg(write_reg),//unused
        .info_load(info_load),//unused
        .info_store(info_store),//unused
        .info_branch(info_branch),//unused
        .dstreg_addr(dstreg_addr),
        .flush(flushD),
        
        //output
        .alu_result(alu_result),
        .branch_signal(branch_sig),
        .rs2E(rs2E),//unused
        .write_regE(write_regE),//unused
        .info_loadE(info_loadE),//unused
        .info_storeE(info_storeE),//unused
        .dstreg_addrE(dstreg_addrE),
        .branch_pc(branch_pc)
    );

    wire w_regD;
    wire [4:0]dst_addrD;

    wire [31:0] hc_OUT_data;
    //writemem
    datamem datamem0(
        //input
        .clk(sysclk),
        .info_load(info_loadE),
        .info_store(info_storeE),
        .alu_result(alu_result),
        .rs2(rs2E),
        .write_reg(write_regE),//unused
        .dst_addr(dstreg_addrE),
        .hc_OUT_data(hc_OUT_data),
        //output
        .load_data(load_data),//alu_result fowarding
        .w_reg(w_regD),
        .rd_data(rd_dataD),
        .dst_addrD(dst_addrD)//unused
    );

    //regster file(decode,writeback)
    regfile regfile0(
        //input
        .clk(sysclk),
        .reg1_addr(reg1_addr),//after decode
        .reg2_addr(reg2_addr),//after decode
        .dstreg_addr(dst_addrD),
        .write_reg(w_regD),
        .dstreg_data(rd_dataD),
        //output
        .reg1_data(r1_data),//execute
        .reg2_data(r2_data)//execute
    );

    hazard_control hazard_control0(
        .clk(sysclk),
        .reset(cpu_resetn),
        .Ereg1_addr(Ereg1_addr),
        .Ereg2_addr(Ereg2_addr),
        .Mwrite_reg_addr(dstreg_addrE),
        .Mwrite_reg_sig(write_regE),
        .Wwrite_reg_addr(dst_addrD),
        .Wwrite_reg_sig(w_regD),
        .branch_sig(branch_sig),
        
        .forward1E(forward_sig1),
        .forward2E(forward_sig2),
        .stallF(stallF),
        .stallD(stallD),
        .flushE(flushE),
        .flushD(flushD)
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



