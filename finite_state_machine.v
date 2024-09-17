`timescale 1us/100ns

module finite_state_machine(clock, reset);
	// Inputs
	input wire clock, reset;

	// Intermediates
	wire [3:0] count, next;

	// Logic
	dflop f0(.q(count[0]), .d(next[0]), .clk(clock), .rst(reset));
	dflop f1(.q(count[1]), .d(next[1]), .clk(clock), .rst(reset));
	dflop f2(.q(count[2]), .d(next[2]), .clk(clock), .rst(reset));
	dflop f3(.q(count[3]), .d(next[3]), .clk(clock), .rst(reset));

	ripple_adder ra(.A_bus(4'b0001), .B_bus(count), .S_bus(next));

endmodule
