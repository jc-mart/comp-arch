`timescale 1us/100ns

module mux_2to1(A, B, S_0, Z);
	// I/O
	input wire A, B, S_0;
	output wire Z;
	// Intermediates
	wire AonS_0, BaS_0;
	
	// Intermediate logic
	assign AonS_0 = A | !S_0;
	assign BaS_0 = B & S_0;
	// Output logic
	assign Z = AonS_0 | BaS_0;

endmodule
