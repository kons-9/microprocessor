`timescale 1ns / 1ps

`include "99_define.vh"

module decoder(
    input wire [31:0] ir,           // 機械語命令列
    input wire clk,
    input wire [31:0] pc1,
    input wire flush,

    output wire [4:0] srcreg1_num,  // ソースレジスタ1番号
    output wire [4:0] srcreg2_num,  // ソースレジスタ2番号

    output reg [4:0] dstreg_num,   // デスティネーションレジスタ番号
    output reg signed [31:0] imm,          // 即値

    output reg [3:0] alucode,      // ALUcode 
    output reg using_r2,  //  if true ,alu usse r2 instead of imm
    output reg using_pc,  // if True, alu use program counter instead of r1

    output reg write_reg,       // レジスタ書き込みの有無
    output reg [2:0] info_load,      // infomation of load, default is NOTLOAD
    output reg [1:0] info_store,     // infomation of store, default is NOTSTORE
    output reg [3:0] info_branch,    // infomation of branch, default is NOTBRANCH
    output reg [31:0] pc2,
    output reg [4:0]Ereg1_addr,
    output reg [4:0]Ereg2_addr
    );

    initial begin
        imm <= {{32{1'b0}}};
        using_r2 <= `FALSE; //imm
        using_pc <=`FALSE;
        write_reg <= `FALSE;
        info_load <= `NOTLOAD;
        info_store <= `NOTSTORE;
        info_branch <= `NOTBRANCH;
        alucode <= `UNUSED;
        dstreg_num <= {{5{1'b0}}};
        Ereg1_addr <= {{5{1'b0}}};
        Ereg2_addr <= {{5{1'b0}}};
        pc2 <= 32'b0;
    end

    assign srcreg1_num = ir[19:15];
    assign srcreg2_num = ir[24:20];


    always @(posedge clk) begin
        if(flush)begin
            write_reg<=`FALSE;
            info_load<=`NOTLOAD;
            info_store<=`NOTSTORE;
            info_branch<=`NOTBRANCH;

            imm <= {{32{1'b0}}};
            using_r2 <= `FALSE;
            using_pc <=`FALSE;
            alucode <= `UNUSED;
            dstreg_num <= {{5{1'b0}}};
            pc2<=pc2;
            Ereg1_addr <= {{5{1'b0}}};
            Ereg2_addr <= {{5{1'b0}}};
        end
        else begin
            pc2 <= pc1;
            case(ir[6:0])
            `IMMOP:begin
                //type i
                if(ir[13:12]==2'b01)imm <= {{28{ir[24]}},ir[23:20]};
                else imm <={{20{ir[31]}},ir[31:20]};

                using_r2 <= `FALSE; //imm
                using_pc <= `FALSE;

                write_reg <=`TRUE;

                info_load <= `NOTLOAD;
                info_store <= `NOTSTORE;
                info_branch <= `NOTBRANCH;
                Ereg1_addr <= srcreg1_num;
                Ereg2_addr <= {{5{1'b0}}};
                
                
                dstreg_num <= ir[11:7];
                

                case(ir[14:12])
                    `OP_ADDi : alucode<=`ADD;
                    `OP_SLTi : alucode<=`SLT;
                    `OP_SLTiu : alucode<=`SLTu;
                    `OP_XORi : alucode <= `XOR;
                    `OP_ORi : alucode <= `OR;
                    `OP_ANDi :alucode <= `AND;
                    `OP_SLLi :alucode <= `SLL;
                    `OP_SRi :alucode <= ir[30]?`SRA:`SRL;
                    default:alucode <=`UNUSED;
                endcase

            

            end

            `ROP:begin
                //type r
                imm <= {32{1'b0}};//unused

                using_r2 <= `TRUE; //r2
                using_pc <= `FALSE;
                
                write_reg <= `TRUE;

                info_load <= `NOTLOAD;
                info_store <= `NOTSTORE;
                info_branch <= `NOTBRANCH;
                
                dstreg_num <= ir[11:7];
                Ereg1_addr <= srcreg1_num;
                Ereg2_addr <= srcreg2_num;

                case(ir[14:12])
                    `OP_ADD:begin
                    //OP_SUB and OP_ADD
                        alucode<=ir[30]?`SUB:`ADD;
                    end
                    `OP_SLT : alucode<=`SLT;
                    `OP_SLTu : alucode<=`SLTu;
                    `OP_XOR : alucode <= `XOR;
                    `OP_OR : alucode <= `OR;
                    `OP_AND :alucode <= `AND;
                    `OP_SLL :alucode <= `SLL;
                    `OP_SR :begin
                        //OP_SRA and OP_SRL
                        alucode <= ir[30]?`SRA:`SRL;
                    end
                    default:alucode <=`UNUSED;
                endcase

            end

            `LUi:begin
                //LUi
                imm <= {ir[31:12],{12{1'b0}}};

                using_r2 <= `FALSE; //imm
                using_pc <= `FALSE;

                write_reg <= `TRUE;

                info_load <= `NOTLOAD;
                info_store <= `NOTSTORE;
                info_branch <= `NOTBRANCH;
                
                dstreg_num <= ir[11:7];
                Ereg1_addr <= {{5{1'b0}}};
                Ereg2_addr <= {{5{1'b0}}};

                alucode <=`LUI;
            end

            `AUiPC:begin
                //AUiPC
                imm <= {ir[31:12],{12{1'b0}}};

                using_r2 <= `FALSE; //imm
                using_pc <= `TRUE;

                write_reg <= `TRUE;

                info_load <= `NOTLOAD;
                info_store <= `NOTSTORE;
                info_branch <= `NOTBRANCH;
                
                dstreg_num <= ir[11:7];
                Ereg1_addr <= {{5{1'b0}}};
                Ereg2_addr <= {{5{1'b0}}};

                alucode <=`ADD;//rd<-PC+imm
            end

            `JAL:begin
                //JAL
                imm <= {{12{ir[31]}},ir[19:12],ir[20],ir[30:21],{1'b0}};

                using_r2 <= `FALSE; //imm
                using_pc <= `TRUE;

                write_reg <= `TRUE;

                info_load <= `NOTLOAD;
                info_store <= `NOTSTORE;
                info_branch <= `BJAL;
                
                dstreg_num <= ir[11:7];
                Ereg1_addr <= {{5{1'b0}}};
                Ereg2_addr <= {{5{1'b0}}};

                alucode <=`ADD;//rd<- PC+4, PC<- PC+imm
            end

            `JALR:begin
                //JALR
                imm <= {{20{ir[31]}},ir[31:20]};

                using_r2 <= `FALSE; //imm
                using_pc <= `FALSE;

                write_reg <= `TRUE;

                info_load <= `NOTLOAD;
                info_store <= `NOTSTORE;
                info_branch <= `BJALR;
                
                dstreg_num <= ir[11:7];
                Ereg1_addr <= srcreg1_num;
                Ereg2_addr <= {{5{1'b0}}};

                alucode <= `ADD;//rd<- PC+4, PC<- rs1 +imm
            end

            `BOP:begin
                //Beq~Bgeu
                imm <= {{20{ir[31]}},ir[7],ir[30:25],ir[11:8],{1'b0}};

                using_r2 <= `FALSE; //imm
                using_pc <= `TRUE;

                write_reg <=`FALSE;

                info_load <= `NOTLOAD;
                info_store <= `NOTSTORE;
                
                dstreg_num <= 5'b00000;
                Ereg1_addr <= srcreg1_num;
                Ereg2_addr <= srcreg2_num;

                alucode <= `ADD;//if OP then PC <- PC+imm
                
                case(ir[14:12])
                    `OP_Beq: info_branch <=`Beq; 
                    `OP_Bne: info_branch <=`Bne;
                    `OP_Blt: info_branch <=`Blt;
                    `OP_Bge: info_branch <= `Bge;
                    `OP_Bltu:info_branch <= `Bltu;
                    `OP_Bgeu:info_branch <= `Bgeu;
                    default: info_branch <= `NOTBRANCH;

                endcase
            end
            `SOP:begin
                //Sb~Sw
                imm <= {{20{ir[31]}},ir[31:25],ir[11:7]};

                using_r2 <= `FALSE; //imm
                using_pc <= `FALSE;

                write_reg <= `FALSE;

                info_load <= `NOTLOAD;
                info_branch <= `NOTBRANCH;
                
                dstreg_num <= 5'b00000;
                Ereg1_addr <= srcreg1_num;
                Ereg2_addr <= srcreg2_num;

                alucode <= `ADD;//imm + r1
                case(ir[14:12])
                    `OP_SB: info_store <=`Sb;
                    `OP_SH: info_store <= `Sh;
                    `OP_SW:info_store <= `Sw;
                    default: info_store <= `NOTSTORE;
                endcase
                    
                
            end
            `LOP:begin
                //Lb~Lhu
                imm <= {{20{ir[31]}},ir[31:20]};

                using_r2 <= `FALSE; //imm
                using_pc <= `FALSE;

                write_reg <= `TRUE;

                info_store <= `NOTSTORE;
                info_branch <= `NOTBRANCH;
                
                dstreg_num <= ir[11:7];
                Ereg1_addr <= srcreg1_num;
                Ereg2_addr <= {{5{1'b0}}};

                alucode <=`ADD;//imm + r1

                // OP_L~ equal to L~. So info_load equal to ir[14:12]. 
                info_load <= ir[14:12];
            end

            default:begin
                imm <= {{32{1'b0}}};
                using_r2 <= `FALSE; //imm
                using_pc <=`FALSE;
                write_reg <= `FALSE;
                info_load <= `NOTLOAD;
                info_store <= `NOTSTORE;
                info_branch <= `NOTBRANCH;
                alucode <= `UNUSED;
                dstreg_num <= ir[11:7];
                Ereg1_addr <= {{5{1'b0}}};
                Ereg2_addr <= {{5{1'b0}}};
            end
            endcase
        end
    end
endmodule
