`timescale 1us/100ns

`include "alu.vh"
`include "opcode.vh"
`include "instructions.vh"

module decode(in, rs1, rs2, rd, imm_i, imm_u, imm_j, imm_s,
	      imm_b, branch_sel, mr_sel, mtr_sel, alu_op, 
              alu_src, rw_sel, mw_sel, ext_imm);
	// I/O
	input wire [31:0] in;
	output wire [19:0] imm_u;
	output wire [11:0] imm_i, imm_j, imm_b, imm_s;
	output wire [4:0] rd, rs1, rs2;
	// Using reg for case statements
	output reg [2:0] alu_op;
	output reg branch_sel, mr_sel, mtr_sel, mw_sel, alu_src, rw_sel;
	output reg [31:0] ext_imm;
	reg [6:0] opcode;
	reg [9:0] funct;

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
		opcode = in[6:0];
		funct = {in[31:25], in[14:12]};

		case(opcode)
			// Set all possible muxes and alu ops
			`arithmetic_base: alu_src = 1'b0; // Base arithmetic ops won't use immediates
			`arithmetic_imm: alu_src = 1'b1;
			`load: begin
				branch_sel = 1'b0;
				mr_sel     = 1'b1;
				mtr_sel    = 1'b1;
				alu_op     = `add;
				mw_sel     = 1'b0;
				alu_src    = 1'b1;
				rw_sel     = 1'b1;
				
			end
			`store: begin
				branch_sel = 1'b0;
				mr_sel     = 1'b0;
				mtr_sel    = 1'b0;
				alu_op     = `add;
				mw_sel     = 1'b1;
				alu_src    = 1'b1;
				rw_sel     = 1'b0;
			end
			default: begin
				alu_src    = 1'b0;
				alu_op     = `add;
				branch_sel = 1'b0;
				mr_sel     = 1'b0;
				mtr_sel    = 1'b0;
				mw_sel     = 1'b0;
				rw_sel     = 1'b0;
			end
		endcase
		
		// Reducing redundant code in arthmetic ops
		if((opcode == `arithmetic_base) || (opcode == `arithmetic_imm)) begin
			branch_sel = 1'b0;
			mr_sel     = 1'b0;
			mtr_sel    = 1'b0;
			mw_sel     = 1'b0;
			rw_sel     = 1'b1;
			ext_imm    = {{20{imm_i[31]}}, imm_i};

			case(funct)
				`ADD:    alu_op = `add;
				`SUB:    alu_op = `sub;
				`SLL:    alu_op = `sll;
				// `SLT:      assign alu_op = <PLACEHOLDER>;
				// `SLTU:     assign alu_op = <PLACEHOLDER>;
				`XOR:    alu_op = `xor;
				`SRL:    alu_op = `slr;
				`SRA:    alu_op = `sar;
				`OR:     alu_op = `or;
				`AND:    alu_op = `and;
				default: alu_op = `add;
			endcase

			if (~(funct == `ADD) || ~(funct == `SUB)) begin
				ext_imm = {20'b0, imm_i}; // Logical ops don't need sign extension
			end
		end 
	end
endmodule
