`timescale 1us/100ns

module cpu3_tb();
	// Test I/O
	reg clk, rst;

	// CPU v3 testing
	cpu3 cpu(.clk(clk), .rst(rst));

	initial begin
		clk = 1'b0;
		rst = 1'b1;
		#10

		rst = 1'b0;
		#1000
		$finish;

	end

	always
		#5
		clk = ~clk;
endmodule
