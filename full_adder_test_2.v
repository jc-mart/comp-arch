`timescale 1us/100ns

module full_adder_test_2();
	// Test I/O
	reg [2:0] tA; 
	reg [2:0] tB; 
	wire [3:0] tS; 
	wire [2:0] tC_out;

	// Three-bit full adder testing
	full_adder bit_0 (.A(tA[0]), .B(tB[0]), .C_in(1'b0), .S(tS[0]), .C_out(tC_out[0]));
	full_adder bit_1 (.A(tA[1]), .B(tB[1]), .C_in(tC_out[0]), .S(tS[1]), .C_out(tC_out[1]));
	full_adder bit_2 (.A(tA[2]), .B(tB[2]), .C_in(tC_out[1]), .S(tS[2]), .C_out(tC_out[2]));

	initial begin
		// Test inputs
		tA    = 3'b0000;
		tB    = 3'b0000;

		#5; // Time delay 5 time units

		tA    = 4'b0001;
		tB    = 4'b0001;

		#5;

		tA    = 4'b0001;
		tB    = 4'b0000;

		#5;

		tA    = 4'b0010;
		tB    = 4'b0001;

		#5;

		tA    = 4'b0001;
		tB    = 4'b0011;

		#5;

		tA    = 4'b0000;
		tB    = 4'b0011;

		#5;

		tA    = 4'b0010;
		tB    = 4'b0001;

	end
endmodule
