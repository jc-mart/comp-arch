`timescale 1us/100ns

// Version 1: Decoder, Register File, ALU.
module cpu(in, zero, clk, rst);
	// I/O
	input wire [31:0] in;
	input wire clk, rst;
	output wire zero;

	// Intermediates
	wire [31:0] sign_ext_imm, zero_ext_imm, rf_do0, 
		    rf_do1, alu_do, alu_din1, out;
	wire [19:0] imm_u;
	wire [11:0] imm_i, imm_j, imm_s, imm_b;
	wire [4:0] ra0, ra1, wa;
	wire [2:0] alu_func;
	wire [1:0] alu_src;
	wire rf_we, branch_sel, mr_sel, mtr_sel, mw_sel;

	// Modules
	decode dl(.in(in), .rs1(ra0), .rs2(ra1), .rd(wa), .imm_i(imm_i),
		  .imm_u(imm_u), .imm_j(imm_j), .imm_s(imm_s), .imm_b(imm_s),
		  .branch_sel(branch_sel), .mr_sel(mr_sel), .mtr_sel(mtr_sel), .alu_op(alu_func),
		  .alu_src(alu_src), .rw_sel(rf_we), .mw_sel(mw_sel), .pc_sel(1'b0),
		  .sign_ext_imm(sign_ext_imm), .zero_ext_imm(zero_ext_imm));
	register_file rf(.ra0(ra0), .ra1(ra1), .we(rf_we), .wd(out), .wa(wa),
			 .out0(rf_do0), .out1(rf_do1), .clock(clk), .reset(rst));
	alu alu0(.in0(rf_do0), .in1(alu_din1), .selector(alu_func), .zero(zero),
		 .out0(out));
	mux_4to1 mux(.A(rf_do1), .B(sign_ext_imm), .C(zero_ext_imm),
		     .D(32'b0), .S0(alu_src), .Z(alu_din1));
endmodule
