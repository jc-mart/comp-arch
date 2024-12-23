`timescale 1us/100ns

`include "alu.vh"

module alu_tb();
	// Test I/O
	reg [31:0] input0, input1;
	reg [2:0] function0;
	wire [31:0] out;
	wire msb_flag;
	wire zero_flag;

	// ALU testing
	alu alu0(.in0(input0), .in1(input1), .selector(function0), .zero(zero_flag),
		 .msb(msb_flag), .out0(out));

	initial begin
		// Expecting add 5 + 5 = 10
		input0 = 32'd5;
		input1 = 32'd5;
		function0 = `add; // func7 and func3 combined
		
		#5;

		// Expecting 0 as input0 != input1
		input0 = 32'b110;
		input1 = 32'b010;
		function0 = `and;

		#5;

		// Expecting 1010 from SLL by 1
		input0 = 32'b101;
		input1 = 32'd1;
		function0 = `sll;

		#5; 

		input0 = 32'b1;
		input1 = 32'b1;
		function0 = `xor;

		#5;
		// TODO: Add more test cases
		$finish;
		
	end
endmodule
