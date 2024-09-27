`timescale 1us/100ns

module mux_1to32(in0, sel0, out0, out1, out2, out3, out4, out5, out6, out7,
		 out8, out9, out10, out11, out12, out13, out14, out15,
		 out16, out17, out18, out19, out20, out21, out22, out23,
		 out24, out25, out26, out27, out28, out29, out30, out31);
	// I/O
	input wire in0;
	input wire [4:0] sel0;
	output wire out0, out1, out2, out3, out4, out5, out6, out7,
			  out8, out9, out10, out11, out12, out13, out14, out15,
			  out16, out17, out18, out19, out20, out21, out22, out23,
			  out24, out25, out26, out27, out28, out29, out30, out31;

	assign out0 = (sel0 == 5'd0) ? in0 : 0;
	assign out1 = (sel0 == 5'd1) ? in0 : 0;
	assign out2 = (sel0 == 5'd2) ? in0 : 0;
	assign out3 = (sel0 == 5'd3) ? in0 : 0;
	assign out4 = (sel0 == 5'd4) ? in0 : 0;
	assign out5 = (sel0 == 5'd5) ? in0 : 0;
	assign out6 = (sel0 == 5'd6) ? in0 : 0;
	assign out7 = (sel0 == 5'd7) ? in0 : 0;
	assign out8 = (sel0 == 5'd8) ? in0 : 0;
	assign out9 = (sel0 == 5'd9) ? in0 : 0;
	assign out10 = (sel0 == 5'd10) ? in0 : 0;
	assign out11 = (sel0 == 5'd11) ? in0 : 0;
	assign out12 = (sel0 == 5'd12) ? in0 : 0;
	assign out13 = (sel0 == 5'd13) ? in0 : 0;
	assign out14 = (sel0 == 5'd14) ? in0 : 0;
	assign out15 = (sel0 == 5'd15) ? in0 : 0;
	assign out16 = (sel0 == 5'd16) ? in0 : 0;
	assign out17 = (sel0 == 5'd17) ? in0 : 0;
	assign out18 = (sel0 == 5'd18) ? in0 : 0;
	assign out19 = (sel0 == 5'd19) ? in0 : 0;
	assign out20 = (sel0 == 5'd20) ? in0 : 0;
	assign out21 = (sel0 == 5'd21) ? in0 : 0;
	assign out22 = (sel0 == 5'd22) ? in0 : 0;
	assign out23 = (sel0 == 5'd23) ? in0 : 0;
	assign out24 = (sel0 == 5'd24) ? in0 : 0;
	assign out25 = (sel0 == 5'd25) ? in0 : 0;
	assign out26 = (sel0 == 5'd26) ? in0 : 0;
	assign out27 = (sel0 == 5'd27) ? in0 : 0;
	assign out28 = (sel0 == 5'd28) ? in0 : 0;
	assign out29 = (sel0 == 5'd29) ? in0 : 0;
	assign out30 = (sel0 == 5'd30) ? in0 : 0;
	assign out31 = (sel0 == 5'd31) ? in0 : 0;
	
endmodule
