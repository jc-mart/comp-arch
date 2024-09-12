`timescale 1us/100ns

module full_adder_test();
	// Test I/O
	reg tA, tB, tC_in;
	wire tS, tC_out;

	// One-bit full adder testing
	full_adder bit_0 (.A(tA), .B(tB), .C_in(tC_in), .S(tS), .C_out(tC_out));
	
	initial begin
		// Test input
		tA    = 1'b0;
		tB    = 1'b0;
		tC_in = 1'b0;

		#5; // Time delay 5 time units

		tA    = 1'b1;
		tB    = 1'b0;
		tC_in = 1'b0;

		#5;

		tA    = 1'b0;
		tB    = 1'b1;
		tC_in = 1'b0;

		#5;

		tA    = 1'b1;
		tB    = 1'b1;
		tC_in = 1'b0;

		#5;

		tA    = 1'b1;
		tB    = 1'b0;
		tC_in = 1'b1;

		#5;

		tA    = 1'b1;
		tB    = 1'b1;
		tC_in = 1'b1;

		#5;

		$finish;
	end

endmodule
