`timescale 1us/100ns

module mux_2to1_test();
	// Test I/O
	reg [31:0] tA, tB;
	reg tS0;
	wire [31:0] tZ;

	// 2:1 multiplexor testing
	mux_2to1 mux (.A(tA), .B(tB), .S0(tS0), .Z(tZ));

	initial begin
		// Test input
		tA  = 32'd10;
		tB  = 32'd20;
		tS0 = 1'b0;

		#5; // Time delay 5 time units

		tS0 = 1'b1;

		#5;

		tA  = 32'd0;
		tB  = 32'd0;
		tS0 = 32'b0;

		#5;

		$finish;
	end

endmodule
