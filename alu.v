`timescale 1us/100ns

module alu(in0, in1, selector, zero, out0);
	// I/O
	input wire [31:0] in0, in1;
	input wire [9:0] selector;
	output reg [31:0] out0; // Using case statements
	output wire zero;

	// Intermediates
	wire [31:0] add0, sub0, and0, or0, xor0, sll0, slr0, sar0;

	// Logic
	assign add0 = in0 + in1;
	assign sub0 = in0 - in1;
	assign and0 = in0 & in1;
	assign or0 = in0 | in1;
	assign xor0 = in0 ^ in1;
	barrel_shifter sll(.in(in0), .shift(in1[5:0]), .selector(2'b00), .out(sll0));
	barrel_shifter slr(.in(in0), .shift(in1[5:0]), .selector(2'b01), .out(slr0));
	barrel_shifter sar(.in(in0), .shift(in1[5:0]), .selector(2'b11), .out(sar0));

	// Routing output
	always @(*) begin
		if (selector[2:0] == 3'b000) begin // Add or subtract
			case (selector[9:3])
				7'b0000000: out0 = add0;
				7'b0100000: out0 = sub0;
				default: out0 = in0;
			endcase
		end 

		else if (selector[2:0] == 3'b101) begin // SLR or SAR 
			case (selector[3:0])
				7'b0000000: out0 = slr0;
				7'b0100000: out0 = sar0;
				default: out0 = in0;

			endcase
		end

		else begin // Bitwise operations
			case (selector[2:0])
				3'b001: out0 = sll0;
				3'b100: out0 = xor0;
				3'b110: out0 = or0;
				3'b111: out0 = and0;
				default: out0 = in0;

			endcase
		end
	end
	
	// Zero flag using NOR gate
	assign zero = ~(|out0);
endmodule
