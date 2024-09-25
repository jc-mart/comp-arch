`timescale 1us/100ns

module mux_32to1_tb();
	// Test I/O
	reg [31:0] in0, in1, in2, in3, in4, in5, in6, in7,
		   in8, in9, in10, in11, in12, in13, in14,
		   in15, in16, in17, in18, in19, in20, in21,
		   in22, in23, in24, in25, in26, in27, in28,
		   in29, in30, in31;
	reg [4:0] selector;
	wire [31:0] out;

	// 32-bit 32:1 mux testing
	mux_32to1 mux (.I0(in0), .I1(in1), .I2(in2), .I3(in3), .I4(in4), .I5(in5),
		       .I6(in6), .I7(in7), .I8(in8), .I9(in9), .I10(in10), .I11(in11),
		       .I12(in12), .I13(in13), .I14(in14), .I15(in15), .I16(in16),
		       .I17(in17), .I18(in18), .I19(in19), .I20(in20), .I21(in21),
		       .I22(in22), .I23(in23), .I24(in24), .I25(in25), .I26(in26),
		       .I27(in27), .I28(in28), .I29(in29), .I30(in30), .I31(in31),
		       .S(selector), .O(out));

	initial begin
		// Test input
		in0  = 32'd1;
    		in1  = 32'd2;
    		in2  = 32'd3;
    		in3  = 32'd4;
    		in4  = 32'd5;
    		in5  = 32'd6;
		in6  = 32'd7;
    		in7  = 32'd8;
    		in8  = 32'd9;
    		in9  = 32'd10;
    		in10 = 32'd11;
    		in11 = 32'd12;
    		in12 = 32'd13;
    		in13 = 32'd14;
    		in14 = 32'd15;
    		in15 = 32'd16;
    		in16 = 32'd17;
    		in17 = 32'd18;
    		in18 = 32'd19;
    		in19 = 32'd20;
    		in20 = 32'd21;
    		in21 = 32'd22;
    		in22 = 32'd23;
    		in23 = 32'd24;
    		in24 = 32'd25;
    		in25 = 32'd26;
    		in26 = 32'd27;
    		in27 = 32'd28;
    		in28 = 32'd29;
    		in29 = 32'd30;
    		in30 = 32'd31;
    		in31 = 32'd32;

		#5;

		selector = 5'd0;

		#5;

		selector = 5'd25;

		#5;

		selector = 5'd31;

		#5;

		$finish;
		
	end
	
endmodule
