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

`define OP_MUL 3'b000
`define OP_MULH 3'b010
`define OP_MULHSU 3'b011
`define OP_MULHU 3'b100
`define OP_DIV 3'b110
`define OP_DIVU 3'b111
`define OP_REM 3'b001
`define OP_REMU 3'b101
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
`define ADD 5'b00000
`define SUB 5'b00001 
`define SLT 5'b00010
`define SLTu 5'b00011
`define SLL 5'b00100
`define SRL 5'b00101 
`define SRA 5'b00110 
`define AND 5'b00111
`define OR 5'b01000
`define XOR 5'b01001
`define LUI 5'b01010
//M
`define MUL 5'b10000
`define MULH 5'b10001
`define MULHSU 5'b10010
`define MULHU 5'b10011
`define DIV 5'b10100
`define DIVU 5'b10101
`define REM 5'b10110
`define REMU 5'b10111
`define UNUSED 5'b01111

//stall time
`define MULSTALL 3'd7
`define DIVSTALL 3'd7
`define REMSTALL 3'd7

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

//hazard
`define NORMAL 2'b00
`define WRITEMEM 2'b01
`define WRITEBACK 2'b10

// address for hardware counter
`define HARDWARE_COUNTER_ADDR 32'hffffff00

// address for UART
`define UART_ADDR 32'hf6fff070