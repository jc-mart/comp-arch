`timescale 1us/100ns

module mux_4to1_1(A, B, C, D, S0, Z);
	// I/O
	input wire A, B, C, D;
	input wire [1:0] S0;
	output wire Z;
	// Intermediates
	wire AanS1anS0, BanS1aS0, CaS1anS0, DaS1aS0;

	// Intermediate logic
	assign AanS1anS0 = A & ~S0[1] & ~S0[0];
	assign BanS1aS0 = B & ~S0[1] & S0[0];
	assign CaS1anS0 = C & S0[1] & ~S0[0];
	assign DaS1aS0 = D & S0[1] & S0[0];
	// Output logic
	assign Z = AanS1anS0 | BanS1aS0 | CaS1anS0 | DaS1aS0;

endmodule
