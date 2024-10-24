`timescale 1us/100ns

`include "alu.vh"
`include "opcode.vh"
`include "instructions.vh"

module decode(in, rs1, rs2, rd, imm_i, imm_u, imm_j, imm_s,
	      imm_b, branch_sel, brcmp_src, mr_sel, mtr_sel, alu_op, 
              alu_src, rw_sel, mw_sel, sign_ext_imm,
	      zero_ext_imm);
	// I/O
	input wire [31:0] in;
	output wire [19:0] imm_u, imm_j;
	output wire [11:0] imm_i, imm_b, imm_s;
	output wire [4:0] rd, rs1, rs2;
	// Using reg for case statements
	output reg [2:0] alu_op, brcmp_src;
	output reg [1:0] alu_src, branch_sel;
	output reg mr_sel, mtr_sel, mw_sel, rw_sel;
	output wire [31:0] sign_ext_imm, zero_ext_imm;
	wire [11:0] sel_imm;
	reg [6:0] opcode;
	reg [9:0] funct;

	// Assigning possible opcode interpretations
	assign rd = in[11:7];
	assign rs1 = in[19:15];
	assign rs2 = in[24:20];
	assign imm_i = in[31:20];
	assign imm_u = in[31:12];
	assign imm_b = {in[31], in[7], in[30:25], in[11:8]};
	assign imm_s = {in[11:7], in[31:25]};
	assign imm_j = {in[31], in[21:12], in[22], in[30:23]};
	assign sel_imm = (in[6:0] == `load) ? imm_i:
			 (in[6:0] == `store) ? imm_s:
			 (in[6:0] == `branch) ? imm_b:
			 imm_i;
	assign sign_ext_imm = ((in[6:0] == `load) | (in[6:0] == `arithmetic)) ? 
			      {{20{in[31]}}, imm_i}:
			      (in[6:0] == `store) ? {{20{in[31]}}, imm_s}:
			      (in[6:0] == `branch) ? {{19{in[31]}}, imm_b, 1'b0}:
			      ((in[6:0] == `lui) | (in[6:0] == `auipc)) ? 
			      {imm_u, 12'b0}: {{20{in[31]}}, imm_i};
	assign zero_ext_imm = ((in[6:0] == `load) | (in[6:0] == `arithmetic)) ?
			      {20'b0, imm_i}:
			      (in[6:0] == `store) ? {20'b0, imm_s}:
			      (in[6:0] == `branch) ? {20'b0, imm_b}:
			      ((in[6:0] == `lui) | (in[6:0] == `auipc)) ?
			      {imm_u, 12'b0}: {20'b0, imm_i};

	// Mux selects and ALU operation will get chosen here.
	always @(*) begin
		opcode = in[6:0];
		funct = {in[31:25], in[14:12]};

		casex(opcode)
			// Set all possible muxes and alu ops
			`arithmetic: begin
				branch_sel = 2'b0;
				brcmp_src  = 3'b111;
				mr_sel     = 1'b0;
				mtr_sel    = 1'b0;
				case(funct)
					`ADD:    alu_op = `add;
					`SUB:    alu_op = `sub;
					`SLL:    alu_op = `sll;
					// `SLT:    alu_op = <PLACEHOLDER>;
					// `SLTU:   alu_op = <PLACEHOLDER>;
					`XOR:    alu_op = `xor;
					`SRL:    alu_op = `slr;
					`SRA:    alu_op = `sar;
					`OR:     alu_op = `or;
					`AND:    alu_op = `and;
					default: alu_op = `add;
				endcase
				mw_sel     = 1'b0;
				alu_src    = (opcode[5] == 1'b1) ? `rf : `se;
				rw_sel     = 1'b1;
			end  
			`load: begin
				branch_sel = 2'b0;
				brcmp_src  = 3'b111;
				mr_sel     = 1'b1;
				mtr_sel    = 1'b1;
				alu_op     = `add;
				mw_sel     = 1'b0;
				alu_src    = `ze;
				rw_sel     = 1'b1;
			end
			`store: begin
				branch_sel = 2'b0;
				brcmp_src  = 3'b111;
				mr_sel     = 1'b0;
				mtr_sel    = 1'b0;
				alu_op     = `add;
				mw_sel     = 1'b1;
				alu_src    = `ze;
				rw_sel     = 1'b0;
			end
			`branch: begin
				branch_sel = 2'b1;
				case (funct[3:0])
					`BEQ:  brcmp_src = 3'b000;
					`BNE:  brcmp_src = 3'b001;
					`BLT:  brcmp_src = 3'b010;
					`BGE:  brcmp_src = 3'b011;
					`BLTU: brcmp_src = 3'b100;
					`BGEU: brcmp_src = 3'b101;
				endcase
				mr_sel     = 1'b0;
				mtr_sel    = 1'b0;
				alu_op     = `sub;
				mw_sel     = 1'b0;
				alu_src    = `rf;
				rw_sel     = 1'b0;
			end
			`jump: begin
				branch_sel = 2'b10;
				brcmp_src  = 3'b111;
				mr_sel     = 1'b0;
				mtr_sel    = 1'b0;
				alu_op     = `add;
				mw_sel     = 1'b0;
				alu_src    = `rf;
				rw_sel     = 1'b0;

			end
			`jalr: begin
				branch_sel = 2'b11;
				brcmp_src  = 3'b111;
				mr_sel     = 1'b0;
				mtr_sel    = 1'b0;
				alu_op     = `add;
				mw_sel     = 1'b0;
				alu_src    = `rf;
				rw_sel     = 1'b1;
			end
			`lui: begin
				branch_sel = 2'b0;
				brcmp_src  = 3'b111;
				mr_sel     = 1'b0;
				mtr_sel    = 1'b0;
				alu_op     = `add;
				mw_sel     = 1'b0;
				alu_src    = `ze;
				rw_sel     = 1'b1;
			end
			`auipc: begin
				branch_sel = 2'b0;
				brcmp_src  = 3'b111;
				mr_sel	   = 1'b0;
				mtr_sel    = 1'b0;
				alu_op     = `add;
				mw_sel	   = 1'b0;
				alu_src    = `ze;
				rw_sel     = 1'b1;
			end
			default: begin
				branch_sel = 2'b0;
				brcmp_src  = 3'b111;
				mr_sel     = 1'b0;
				alu_op     = `add;
				mtr_sel    = 1'b0;
				mw_sel     = 1'b0;
				alu_src    = `rf;
				rw_sel     = 1'b0;
			end
		endcase
	end
endmodule
