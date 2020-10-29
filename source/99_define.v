//bool
`define TRUE 1'b1
`define FALSE 1'b0

//decoder

`define IMMOP 7'b0010011
`define ROP 7'b0110011
`define LUi 7'b0110111
`define AUiPC 7'b0010111
`define JAL 7'b1101111
`define JALR 7'b1100111
`define BOP 7'b1100011
`define SOP 7'b0100011
`define LOP 7'b0000011

//sub decode
//IMMOP
`define OP_ADDi 3'b000
`define OP_SLTi 3'b010
`define OP_SLTiu 3'b011
`define OP_XORi 3'b100
`define OP_ORi 3'b110
`define OP_ANDi 3'b111
`define OP_SLLi 3'b001
`define OP_SRi 3'b101
`define OP_SRLi 1'b0
`define OP_SRAi 1'b1
//ROP
`define OP_ADD 3'b000
`define OP_SUB 3'b000
`define OP_SLT 3'b010
`define OP_SLTu 3'b011
`define OP_XOR 3'b100
`define OP_OR 3'b110
`define OP_AND 3'b111
`define OP_SLL 3'b001
`define OP_SR 3'b101
`define OP_SRL 1'b0
`define OP_SRA 1'b1
//BOP
`define OP_Beq 3'b000
`define OP_Bne 3'b001
`define OP_Blt 3'b100
`define OP_Bge 3'b101
`define OP_Bltu 3'b110
`define OP_Bgeu 3'b111
//SOP
`define OP_SB 3'b000
`define OP_SH 3'b001
`define OP_SW 3'b010
//LOP
`define OP_LB 3'b000
`define OP_LBU 3'b001
`define OP_LH 3'b010
`define OP_LHU 3'b100
`define OP_LW 3'b101 


//ALU
`define ADD 4'b0000
`define SUB 4'b0001 
`define SLT 4'b0010
`define SLTu 4'b0011
`define SLL 4'b0100
`define SRL 4'b0101 
`define SRA 4'b0110 
`define AND 4'b0111
`define OR 4'b1000
`define XOR 4'b1001
`define LUI 4'b1010
`define UNUSED 4'b1011

//store info
`define NOTSTORE 2'b00 
`define Sb 2'b01
`define Sh 2'b10
`define Sw 2'b11

//load info
`define NOTLOAD 3'b111 
`define Lb 3'b000
`define Lbu 3'b100
`define Lh 3'b001
`define Lhu 3'b101
`define Lw 3'b010

//branch info
`define Beq 4'b0001
`define Bne 4'b0011
`define Blt 4'b1001
`define Bge 4'b1011
`define Bltu 4'b1101
`define Bgeu 4'b1111
`define BJAL 4'b0111
`define BJALR 4'b0101
`define NOTBRANCH 4'b0000

//stage
`define F 3'b000
`define D 3'b001
`define E 3'b010
`define M 3'b011
`define W 3'b100
