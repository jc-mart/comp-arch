`timescale 1us/100ns

`include "alu.vh"

module alu(in0, in1, selector, zero, msb, carry, out0);
	// I/O
	input wire [31:0] in0, in1;
	input wire [2:0] selector;
	output reg [31:0] out0; // Using case statements
	output wire zero, msb, carry;

	// Intermediates
	wire [31:0] add0, sub0, and0, or0, xor0, sll0, slr0, sar0;

	// Logic
	assign add0 = in0 + in1;
	assign {carry, sub0} = in0 - in1; // Carry will be 1 if in0 is smaller
	assign and0 = in0 & in1;
	assign or0 = in0 | in1;
	assign xor0 = in0 ^ in1;
	barrel_shifter sll(.in(in0), .shift(in1[5:0]), .selector(2'b00), .out(sll0));
	barrel_shifter slr(.in(in0), .shift(in1[5:0]), .selector(2'b01), .out(slr0));
	barrel_shifter sar(.in(in0), .shift(in1[5:0]), .selector(2'b11), .out(sar0));

	// Routing output
	always @(*) begin
		case (selector)
			`add: out0 = add0;
			`sub: out0 = sub0;
			`and: out0 = and0;
			`or:  out0 = or0;
			`xor: out0 = xor0;
			`sll: out0 = sll0;
			`slr: out0 = slr0;
			`sar: out0 = sar0;
			default: out0 = in0;

		endcase

	end
	
	// Zero flag using NOR gate
	assign zero = ~(|out0);
	assign msb = out0[31];
endmodule
