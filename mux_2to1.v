`timescale 1us/100ns

module mux_2to1(A, B, S0, Z);
	// I/O
	input wire [31:0] A, B;
	input wire S0;
	output wire [31:0] Z;
	// Intermediates
	wire [31:0] AanS0, BaS0;
	
	// Intermediate logic
	assign AanS0 = A & ~{32{S0}};
	assign BaS0 = B & {32{S0}};
	// Output logic
	assign Z = AanS0 | BaS0;

endmodule
