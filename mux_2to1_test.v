`timescale 1us/100ns

module mux_2to1_test();
	// Test I/O
	reg tA, tB, tS0;
	wire tZ;

	// 2:1 multiplexor testing
	mux_2to1 mux (.A(tA), .B(tB), .S0(tS0), .Z(tZ));

	initial begin
		// Test input
		tA  = 1'b1;
		tB  = 1'b0;
		tS0 = 1'b0;

		#5; // Time delay 5 time units

		tA  = 1'b0;
		tB  = 1'b1;
		tS0 = 1'b1;

		#5;

		tA  = 1'b1;
		tB  = 1'b1;
		tS0 = 1'b1;

		#5;

		tA  = 1'b1;
		tB  = 1'b1;
		tS0 = 1'b0;

		#5;

		tA  = 1'b0;
		tB  = 1'b0;
		tS0 = 1'b0;

		#5;

		$finish;
	end

endmodule
