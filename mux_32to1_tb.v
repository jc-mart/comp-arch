`timescale 1us/100ns

module mux_32to1_tb();
	// Test I/O
	reg [31:0] in0, in1, in2, in3, in4, in5, in6, in7,
		   in8, in9, in10, in11, in12, in13, in14,
		   in15, in16, in17, in18, in19, in20, in21,
		   in22, in23, in24, in25, in26, in27, in28,
		   in29, in30, in31, out;
	reg [4:0] selector;

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
		in0 = 32'b1001;
		in1 = 32'b1011;
		in2 = 32'b1111;
		in3 = 32'b1000;
		
	end
	
endmodule
