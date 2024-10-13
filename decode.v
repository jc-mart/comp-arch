`timescale 1us/100ns

`include "alu.vh"
`include "opcode.vh"

module decode(in, rs1, rs2, rd, imm_i, imm_u, imm_j, imm_s,
	      imm_b, branch_sel, mr_sel, mtr_sel, alu_op, 
              mw_sel);
	// I/O
	input wire [31:0] in;
	output wire [11:0] imm_i, imm_j, imm_b;
	output wire [4:0] rd, rs1, rs2;
	output wire [2:0] alu_op;
	output wire branch_sel, mr_sel, mtr_sel, mw_sel;

	// Intermediates
	wire [6:0] funct7;
	wire [2:0] funct3;
	
	// Using reg for case statements
	reg [31:0] instruction = in;

	// Assigning possible opcode interpretations
	assign rd = in[11:7];
	assign rs1 = in[19:15];
	assign rs2 = in[24:20];
	assign imm_i = in[31:20];
	assign imm_u = in[31:12];
	assign imm_b = {in[11:8], in[30:25], in[7], in[31]};
	assign imm_s = {in[11:7], in[31:25]};
	assign imm_j = {in[31], in[21:12], in[22], in[30:23]};

	// Mux selects and ALU operation will get chosen here.
	always @(*) begin
		casex(instruction)
			`arithmetic_base:
				
			// Set all possible muxes and alu ops
			default:
		endcase
	end
endmodule
