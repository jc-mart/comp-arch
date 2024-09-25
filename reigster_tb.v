`timescale 1us/100ns

module register_tb();
	//Test I/O
	reg [31:0] input0;
	reg clock0, reset0, selector0;
	wire [31:0] output0;

	// 32-bit register from D-flip flops
	register r0(.in0(input0), .out0(output0), .sel0(selector0), .clock(clock0), .reset(reset0));

	initial begin
		clock0 = 1'b0;
		reset0 = 1'b1;

		#10;

		reset0 = 1'b0;

		#10;

		selector0 = 1'b1;
		input0 = 32'd10;

		#10;

		selector0 = 1'b0;

		#10;

		input0 = 32'd32;

		#10;

		selector0 = 1'b1;
		input0 = 32'd55;

		#10;

		selector0 = 1'b0;

		#10;

		input0 = 32'd0;

		#10;

		$finish;
	end

	always
		#5
		clock0 = ~clock0;
	
endmodule
