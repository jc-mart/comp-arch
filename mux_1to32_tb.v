`timescale 1us/100ns

module mux_1to32_tb();
	// Test I/O
	reg input0;
	reg [4:0] selector0;
	wire o0, o1, o2, o3, o4, o5, o6, o7, o8,
	     o9, o10, o11, o12, o13, o14, o15, o16,
	     o17, o18, o19, o20, o21, o22, o23, o24,
	     o25, o26, o27, o28, o29, o30, o31;

	// 1:32 mux testing
	mux_1to32 mux(.in0(input0), .sel0(selector0), .out0(o0), .out1(o1),
		      .out2(o2), .out3(o3), .out4(o4), .out5(o5), .out6(o6),
		      .out7(o7), .out8(o8), .out9(o9), .out10(o10), .out11(o11),
		      .out12(o12), .out13(o13), .out14(o14), .out15(o15), .out16(o16),
		      .out17(o17), .out18(o18), .out19(o19), .out20(o20), .out21(o21),
		      .out22(o22), .out23(o23), .out24(o24), .out25(o25), .out26(o26),
		      .out27(o27), .out28(o28), .out29(o29), .out30(o30), .out31(o31));

	initial begin

		input0 = 5'd1;
		selector0 = 5'd25;

		#5;

		selector0 = 5'd12;

		#5;

		selector0 = 5'd31;

		#5;

		input0 = 5'd0;

		#5;
		$finish;
	
	end
endmodule
