`timescale 1us/100ns

module mux_4to1(A, B, C, D, S0, S1, Z);
	// I/O
	input wire A, B, C, D, S0, S1;
	output wire Z;
	// Intermediates
	wire AanS1anS0, BanS1aS0, CaS1anS0, DaS1aS0;

	// Intermediate logic
	assign AanS1anS0 = A & ~S1 & ~S0;
	assign BanS1aS0 = B & ~S1 & S0;
	assign CaS1anS0 = C & S1 & ~S0;
	assign DaS1aS0 = D & S1 & S0;
	// Output logic
	assign Z = AanS1anS0 | BanS1aS0 | CaS1anS0 | DaS1aS0;

endmodule
