`timescale 1us/100ns

module decode_tb();
	// Test I/O
	reg [31:0] in;
	wire [31:0] sign_ext_imm, zero_ext_imm;
	wire [19:0] imm_u;
	wire [11:0] imm_i, imm_j, imm_b, imm_s;
	wire [4:0] rd, rs1, rs2;
	wire [2:0] alu_op, branch_sel;
	wire [1:0] alu_src;
	wire mr_sel, mtr_sel, mw_sel, rw_sel;

	// Decode logic testing
	decode dl(.in(in), .rs1(rs1), .rs2(rs2), .rd(rd), .imm_i(imm_i),
		  .imm_u(imm_u), .imm_j(imm_j), .imm_s(imm_s), .imm_b(imm_b),
		  .branch_sel(branch_sel), .mr_sel(mr_sel), .mtr_sel(mtr_sel),
		  .alu_op(alu_op), .alu_src(alu_src), .rw_sel(rw_sel),
		  .mw_sel(mw_sel), .pc_sel(1'b0), .sign_ext_imm(sign_ext_imm),
		  .zero_ext_imm(zero_ext_imm));

	initial begin
		// funct7, rs2, rs1, funct3, rd, opcode
		in = 32'b0000000_00010_00001_000_00011_0110011;
		#5;

		in = 32'b000001100011_00100_000_10000_0010011;
		#5;
		
		$finish;
	end
endmodule
