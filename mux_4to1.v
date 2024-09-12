`timescale 1us/100ns

module mux_4to1(A, B, C, D, S_0, S_1, Z);
	// I/O
	input wire A, B, C, D, S_0, S_1;
	output wire Z;
	// Intermediates
	wire AanS_1anS_0, BanS_1aS_0, CaS_1anS_0, DaS_1aS_0;

	// Intermediate logic
	assign AanS_1anS_0 = A & ~S_1 & ~S_0;
	assign BanS_1aS_0 = B & ~S_1 & S_0;
	assign CaS_1anS_0 = C & S_1 & ~S_0;
	assign DaS_1aS_0 = D & S_1 & S_0;
	// Output logic
	assign Z = AanS_1anS_0 | BanS_1aS_0 | CaS_1anS_0 | DaS_1aS_0;

endmodule
