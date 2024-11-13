`timescale 1us/100ns

module cpu5_tb();
	// Test I/O
	reg clk, mem_clk, rst;

	// CPU v3 testing
	cpu5 cpu(.clk(clk), .mem_clk(mem_clk), .rst(rst));

	initial begin
		clk = 1'b0;
		mem_clk = 1'b0;
		rst = 1'b1;
		#30;

		rst = 1'b0;
		#10000;
		$finish;

	end

	always #10 clk = ~clk;

	initial begin
		#26;
		forever #5 mem_clk = ~mem_clk;
	end

endmodule
