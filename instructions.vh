// Arithmetic instructions
`define ADD  10'b0
`define SUB  10'b100000000
`define SLL  10'b1
`define SLT  10'b10
`define SLTU 10'b11
`define XOR  10'b100
`define SRL  10'b101
`define SRA  10'b100000101
`define OR   10'b110
`define AND  10'b111

// Load instructions
`define LB  3'b000
`define LH  3'b001
`define LW  3'b010
`define LBU 3'b100
`define LHU 3'b101

// Store instructions
`define SB 3'b000
`define SH 3'b001
`define SW 3'b010