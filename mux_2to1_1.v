`timescale 1us/100ns

module mux_2to1_1(in0, in1, sel, out);
	// I/O
	input wire in0, in1, sel;
	output wire out;

	// Intermediates
	wire w0, w1;
	
	// Intermediate logic
	assign w0 = in0 & ~sel;
	assign w1 = in1 & sel;

	// Output
	assign out = w0 | w1;
endmodule
