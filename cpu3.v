`timescale 1us/100ns

`include "alu.vh"

// Version 3: PC, IMEM, Decoder, Register File, ALU, DMEM, branch, jump.
module cpu3(clk, rst);
	// I/O
	input wire clk, rst;

	// Intermediates
	wire [31:0] sign_ext_imm, zero_ext_imm, rf_do0, rf_do1, 
		    alu_do, alu_din1, mr_do, out, imem_do,
		    pc_din, pc_nxt_4, pc_nxt_imm;
	wire [19:0] imm_u;
	wire [11:0] imm_i, imm_j, imm_s, imm_b;
	wire [4:0] ra0, ra1, wa;
	wire [2:0] alu_func;
	wire [1:0] alu_src, branch_sel, brcmp_src;
	wire rf_we, mr_sel, mtr_sel, mw_sel, zero, msb, carry,
	     brcmp;
	(* keep="soft"*)
	wire na;

	// Modules
	decode dl(.in(imem_do), .rs1(ra0), .rs2(ra1), .rd(wa), .imm_i(imm_i),
		  .imm_u(imm_u), .imm_j(imm_j), .imm_s(imm_s), .imm_b(imm_s),
		  .branch_sel(branch_sel), .brcmp_src(brcmp_src), .mr_sel(mr_sel), 
		  .mtr_sel(mtr_sel), .alu_op(alu_func), .alu_src(alu_src), 
		  .rw_sel(rf_we), .mw_sel(mw_sel), .sign_ext_imm(sign_ext_imm), 
		  .zero_ext_imm(zero_ext_imm));
	register_file rf(.ra0(ra0), .ra1(ra1), .we(rf_we), .wd(out), .wa(wa),
			 .out0(rf_do0), .out1(rf_do1), .clock(clk), .reset(rst));
	alu alu0(.in0(rf_do0), .in1(alu_din1), .selector(alu_func), .zero(zero),
		 .msb(msb), .carry(carry), .out0(alu_do));
	alu pc_4(.in0(pc_do), .in1(32'd4), .selector(`add), .zero(na), .msb(na), 
		 .carry(na), .out0(pc_nxt_4));
	alu pc_imm(.in0(pc_do), .in(imm_b), .selector(`add), .zero(na), .msb(na), 
		   .carry(na), .out0(pc_nxt_imm));
	memory2c dmem(.data_out(mr_do), .data_in(rf_do1), .addr(alu_do), .enable(1'b1),
		      .wr(mw_sel), .createdump(1'b0), .clk(clk), .rst(rst));
	memory2c imem(.data_out(imem_do), .data_in(32'b0), .addr(pc_do), .enable(1'b1),
		      .wr(1'b0), .createdump(1'b0), .clk(clk), .rst(rst));
	register pc(.in0(pc_din), .out0(pc_do), .sel0(1'b1), .clock(clk), .reset(rst));
	mux_4to1 mux_alu_src(.A(rf_do1), .B(sign_ext_imm), .C(zero_ext_imm),
			     .D(32'b0), .S0(alu_src), .Z(alu_din1));
	mux_2to1 pc_src(.A(pc_nxt), .B(32'b0), .C(32'b0), .D(32'b0),
			.S0(branch_sel), .Z(pc_din)); // .C will be for jumps
	mux_2to1 pc_nxt_src(.A(pc_nxt_4), .B(pc_nxt_imm), .S0(branch_sel[0] & brcmp),
			  .Z(pc_din));
	mux_2to1 mux_dmem_src(.A(alu_do), .B(mr_do), .S0(mtr_sel), .Z(out));
	mux_8to1_1 mux_brcmp_src(.in0(zero), .in1(~zero), .in2(msb), .in3(~msb),
				 .in4(carry), .in5(~carry), .in6(1'b0), .in7(1'b0),
				 .sel(brcmp_sel), .out(brcmp));

endmodule