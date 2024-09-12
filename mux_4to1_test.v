`timescale 1us/100ns

module mux_4to1_test();
	// Test I/O
	reg tA, tB, tC, tD, tS0, tS1;
	wire tZ;

	//4:1 multiplexor testing
	mux_4to1 mux (.A(tA), .B(tB), .C(tC), .D(tD), .S0(tS0), .S1(tS1), .Z(tZ));

	initial begin
		// Test input
		tA  = 1'b1;
		tB  = 1'b0;
		tC  = 1'b0;
		tD  = 1'b0;
		tS0 = 1'b0;
		tS1 = 1'b0;

		#5; // Delay 5 time units

		tA  = 1'b0;
		tB  = 1'b1;
		tC  = 1'b0;
		tD  = 1'b0;
		tS0 = 1'b1;
		tS1 = 1'b0;

		#5; // Delay 5 time units

		tA  = 1'b0;
		tB  = 1'b0;
		tC  = 1'b1;
		tD  = 1'b0;
		tS0 = 1'b0;
		tS1 = 1'b1;

		#5; // Delay 5 time units

		tA  = 1'b0;
		tB  = 1'b0;
		tC  = 1'b0;
		tD  = 1'b1;
		tS0 = 1'b1;
		tS1 = 1'b1;

		#5; // Delay 5 time units

		tA  = 1'b1;
		tB  = 1'b1;
		tC  = 1'b0;
		tD  = 1'b0;
		tS0 = 1'b1;
		tS1 = 1'b1;

		#5; // Delay 5 time units

		tA  = 1'b1;
		tB  = 1'b1;
		tC  = 1'b1;
		tD  = 1'b0;
		tS0 = 1'b1;
		tS1 = 1'b1;

		#5; // Delay 5 time units

		$finish;
	end

endmodule
