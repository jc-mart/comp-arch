`timescale 1us/100ns

module mux_8to1_1(in0, in1, in2, in3, in4, 
	          in5, in6, in7, sel, out);
	// I/O
	input wire in0, in1, in2, in3, in4,
		   in5, in6, in7;
	input wire [2:0] sel;
	output wire out;

	// Intermediates
	wire w0, w1, w2, w3, w4, w5, w6, w7;

	// Intermediate logic
	assign w0 = in0 & ~sel[2] & ~sel[1] & ~sel[0];
	assign w1 = in1 & ~sel[2] & ~sel[1] & sel[0];
	assign w2 = in2 & ~sel[2] & sel[1] & ~sel[0];
	assign w3 = in3 & ~sel[2] & sel[1] & sel[0];
	assign w4 = in4 & sel[2] & ~sel[1] & ~sel[0];
	assign w5 = in5 & sel[2] & ~sel[1] & sel[0];
	assign w6 = in6 & sel[2] & sel[1] & ~sel[0];
	assign w7 = in7 & sel[2] & sel[1] & sel[0];

	// Output logic
	assign out = w0 | w1 | w2 | w3 | w4 | w5 | w6 | w7;

endmodule
