`timescale 1us/100ns

module mux_2to1(A, B, S0, Z);
	// I/O
	input wire A, B, S0;
	output wire Z;
	// Intermediates
	wire AanS0, BaS0;
	
	// Intermediate logic
	assign AanS0 = A & ~S0;
	assign BaS0 = B & S0;
	// Output logic
	assign Z = AanS0 | BaS0;

endmodule
