`timescale 1us/100ns

module cpu2_tb();
	// Test I/O
	reg [31:0] in;
	reg clk, rst;
	wire zero;

	// CPU v2 testing
	cpu2 cpu0(.in(in), .zero(zero), .clk(clk), .rst(rst));

	initial begin
		clk = 1'b0;
		rst = 1'b1;
		#10

		rst = 1'b0;
		// imm12, x0, funct3, x30, addi
		in = 32'b00000110001100000000111100010011;
		#10

		// imm7, rs2, rs1, funct3, imm5, sw
		in = 32'b00000001111000000010000000100011;
		#10;

		// imm12, rs1, funct3, rd, lw
		in = 32'b00000000000000000010111110000011;
		#10;
		$finish;

	end

	always
		#5
		clk = ~clk;
endmodule
