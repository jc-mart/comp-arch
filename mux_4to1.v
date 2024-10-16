`timescale 1us/100ns

module mux_4to1(A, B, C, D, S0, Z);
	// I/O
	input wire [31:0] A, B, C, D;
	input wire [1:0] S0;
	output wire [31:0] Z;
	// Intermediates
	wire [31:0] AanS1anS0, BanS1aS0, CaS1anS0, DaS1aS0;

	// Intermediate logic
	assign AanS1anS0 = A & ~{32{S0[1]}} & ~{32{S0[0]}};
	assign BanS1aS0 = B & ~{32{S0[1]}} & {32{S0[0]}};
	assign CaS1anS0 = C & {32{S0[1]}} & ~{32{S0[0]}};
	assign DaS1aS0 = D & {32{S0[1]}} & {32{S0[0]}};
	// Output logic
	assign Z = AanS1anS0 | BanS1aS0 | CaS1anS0 | DaS1aS0;

endmodule
