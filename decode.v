`timescale 1us/100ns

`include "alu.vh"
`include "decode.vh"

module decode(in0, ra0, ra1, sext0, zext0, pc_sel0, alu_func0, alu_in_sel0, rfw_sel0);
	// I/O
	input wire [31:0] in0;
	output wire [31:0] sext0, zext0, pc_sel0;
	output wire [3:0] ra0, ra1;
	output wire [2:0] alu_func0;
	output wire [1:0] alu_in_sel0;
	output wire pc_sel0, rfw_sel0;
endmodule
