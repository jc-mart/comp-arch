`timescale 1us/100ns

module barrel_shifter_tb();
	// Test I/O
	reg [31:0] test_in;
	reg [5:0] shift_amount;
	reg [1:0] mode;
	wire [31:0] result;

	// Barrel shifter testing
	barrel_shifter bs(.in(test_in), .shift(shift_amount), .selector(mode), .out(result));

	initial begin
	// Test input
		test_in = 32'd10;
		mode = 2'b0;
		shift_amount = 32'd2;
		
		#5;

		test_in = 32'd10;
		mode = 2'b1;
		shift_amount = 32'd1;

		#5;
		
		test_in = 32'b10000000000000000000000000001111;
		mode = 2'b10;
		shift_amount = 32'd4;

		#5;
		$finish;

	end
endmodule
