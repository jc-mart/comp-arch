`timescale 1us/100ns

module mux_1to32_32bit(in0, sel0, out0, out1, out2, out3, out4, out5, out6, out7,
		 out8, out9, out10, out11, out12, out13, out14, out15,
		 out16, out17, out18, out19, out20, out21, out22, out23,
		 out24, out25, out26, out27, out28, out29, out30, out31);
	// I/O
	input wire [31:0] in0;
	input wire [4:0] sel0;
	// Registers only for case statements
	output reg [31:0] out0, out1, out2, out3, out4, out5, out6, out7,
			  out8, out9, out10, out11, out12, out13, out14, out15,
			  out16, out17, out18, out19, out20, out21, out22, out23,
			  out24, out25, out26, out27, out28, out29, out30, out31;

	always @(*) begin
		case(sel0)
			5'd0: out0 = in0;
			5'd1: out1 = in0;
			5'd0: out0 = in0;
    			5'd1: out1 = in0;
    			5'd2: out2 = in0;
    			5'd3: out3 = in0;
    			5'd4: out4 = in0;
    			5'd5: out5 = in0;
    			5'd6: out6 = in0;
    			5'd7: out7 = in0;
    			5'd8: out8 = in0;
    			5'd9: out9 = in0;
    			5'd10: out10 = in0;
    			5'd11: out11 = in0;
    			5'd12: out12 = in0;
    			5'd13: out13 = in0;
    			5'd14: out14 = in0;
    			5'd15: out15 = in0;
    			5'd16: out16 = in0;
    			5'd17: out17 = in0;
   			5'd18: out18 = in0;
    			5'd19: out19 = in0;
    			5'd20: out20 = in0;
    			5'd21: out21 = in0;
    			5'd22: out22 = in0;
    			5'd23: out23 = in0;
    			5'd24: out24 = in0;
    			5'd25: out25 = in0;
    			5'd26: out26 = in0;
    			5'd27: out27 = in0;
  		  	5'd28: out28 = in0;
    			5'd29: out29 = in0;
    			5'd30: out30 = in0;
    			5'd31: out31 = in0;

		endcase
	end
endmodule
