`timescale 1us/100ns

module cpu_tb();
	// Test I/O
	reg [31:0] in;
	reg clk, rst;
	wire zero;

	// CPU v1 testing
	cpu cpu0(.in(in), .zero(zero), .clk(clk), .rst(rst));

	initial begin
		clk = 1'b0;
		rst = 1'b1;
		#10

		rst = 1'b0;
		// funct7, rs2, rs1, funct3, rd, opcode
		in = 32'b0000000_00010_00001_000_00011_0110011;
		#10

		in = 32'b000001100011_00000_000_11110_0010011;
		#10

		in = 32'b0000000_10000_10000_000_00111_0110011;
		#10
	
		$finish;

	end

	always
		#5
		clk = ~clk;
endmodule
