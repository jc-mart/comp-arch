module full_adder(A, B, C_in, S, C_out);
	// I/O
   	input wire A, B, C_in;
	output wire S, C_out;
	// Intermediates
	wire AxB, AxBaC_in, AaB;

	// Logic
	assign AxB = A ^ B;
	assign AxBaC_in = AxB & C_in;
	assign AaB = A & B;
	// Output
	assign S = AxB ^ C_in;
	assign C_out = AxBaC_in | AaB;

endmodule;
