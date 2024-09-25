`timescale 1us/100ns

module register(in0, out0, sel0, clock, reset);
	// I/O
	input wire [31:0] in0;
	input wire clock, reset, sel0;
	output wire [31:0] out0;

	// Intermediates
	wire [31:0] data0;

	// Logic
	dflop f0(.q(out0[0]), .d(data0[0]), .clk(clock), .rst(reset));
	dflop f1(.q(out0[1]), .d(data0[1]), .clk(clock), .rst(reset));
	dflop f2(.q(out0[2]), .d(data0[2]), .clk(clock), .rst(reset));
	dflop f3(.q(out0[3]), .d(data0[3]), .clk(clock), .rst(reset));
	dflop f4(.q(out0[4]), .d(data0[4]), .clk(clock), .rst(reset));
	dflop f5(.q(out0[5]), .d(data0[5]), .clk(clock), .rst(reset));
	dflop f6(.q(out0[6]), .d(data0[6]), .clk(clock), .rst(reset));
	dflop f7(.q(out0[7]), .d(data0[7]), .clk(clock), .rst(reset));
	dflop f8(.q(out0[8]), .d(data0[8]), .clk(clock), .rst(reset));
	dflop f9(.q(out0[9]), .d(data0[9]), .clk(clock), .rst(reset));
	dflop f10(.q(out0[10]), .d(data0[10]), .clk(clock), .rst(reset));
	dflop f11(.q(out0[11]), .d(data0[11]), .clk(clock), .rst(reset));
	dflop f12(.q(out0[12]), .d(data0[12]), .clk(clock), .rst(reset));
	dflop f13(.q(out0[13]), .d(data0[13]), .clk(clock), .rst(reset));
	dflop f14(.q(out0[14]), .d(data0[14]), .clk(clock), .rst(reset));
	dflop f15(.q(out0[15]), .d(data0[15]), .clk(clock), .rst(reset));
	dflop f16(.q(out0[16]), .d(data0[16]), .clk(clock), .rst(reset));
	dflop f17(.q(out0[17]), .d(data0[17]), .clk(clock), .rst(reset));
	dflop f18(.q(out0[18]), .d(data0[18]), .clk(clock), .rst(reset));
	dflop f19(.q(out0[19]), .d(data0[19]), .clk(clock), .rst(reset));
	dflop f20(.q(out0[20]), .d(data0[20]), .clk(clock), .rst(reset));
	dflop f21(.q(out0[21]), .d(data0[21]), .clk(clock), .rst(reset));
	dflop f22(.q(out0[22]), .d(data0[22]), .clk(clock), .rst(reset));
	dflop f23(.q(out0[23]), .d(data0[23]), .clk(clock), .rst(reset));
	dflop f24(.q(out0[24]), .d(data0[24]), .clk(clock), .rst(reset));
	dflop f25(.q(out0[25]), .d(data0[25]), .clk(clock), .rst(reset));
	dflop f26(.q(out0[26]), .d(data0[26]), .clk(clock), .rst(reset));
	dflop f27(.q(out0[27]), .d(data0[27]), .clk(clock), .rst(reset));
	dflop f28(.q(out0[28]), .d(data0[28]), .clk(clock), .rst(reset));
	dflop f29(.q(out0[29]), .d(data0[29]), .clk(clock), .rst(reset));
	dflop f30(.q(out0[30]), .d(data0[30]), .clk(clock), .rst(reset));
	dflop f31(.q(out0[31]), .d(data0[31]), .clk(clock), .rst(reset));

	// Mux to save registers value if not being written
	mux_2to1 store(.A(out0), .B(in0), .S0(sel0), .Z(data0));
	
endmodule
