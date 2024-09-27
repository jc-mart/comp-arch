`timescale 1us/100ns

module register_file(ra0, ra1, we, wd, wa, out0, out1, clock, reset);
	// I/O
	input wire [31:0] wd;
	input wire [4:0] ra0, ra1, wa; // 32 possible registers
	input wire we, clock, reset; 
	output wire [31:0] out0, out1;

	// Intermediates
	wire we_router0, we_router1, we_router2, we_router3, // write data router from 1:32 mux
	     we_router4, we_router5, we_router6, we_router7,
	     we_router8, we_router9, we_router10, we_router11,
	     we_router12, we_router13, we_router14, we_router15,
	     we_router16, we_router17, we_router18, we_router19, 
	     we_router20, we_router21, we_router22, we_router23, 
	     we_router24, we_router25, we_router26, we_router27, 
	     we_router28, we_router29, we_router30, we_router31;
	wire [31:0] data0, data1, data2, data3, data4, data5,
		    data6, data7, data8, data9, data10, data11,
		    data12, data13, data14, data15, data16,
		    data17, data18, data19, data20, data21,
		    data22, data23, data24, data25, data26,
		    data27, data28, data29, data30, data31;
	mux_32to1 data_out0(.I0(data0), .I1(data1), .I2(data2), .I3(data3), .I4(data4),
			    .I5(data5), .I6(data6), .I7(data7), .I8(data8), .I9(data9),
			    .I10(data10), .I11(data11), .I12(data12), .I13(data13),
			    .I14(data14), .I15(data15), .I16(data16), .I17(data17), 
			    .I18(data18), .I19(data19), .I20(data20), .I21(data21),
			    .I22(data22), .I23(data23), .I24(data24), .I25(data25), 
			    .I26(data26), .I27(data27), .I28(data28), .I29(data29),
			    .I30(data30), .I31(data31), .S(ra0), .O(out0));
	mux_32to1 data_out1(.I0(data0), .I1(data1), .I2(data2), .I3(data3), .I4(data4),
			    .I5(data5), .I6(data6), .I7(data7), .I8(data8), .I9(data9),
			    .I10(data10), .I11(data11), .I12(data12), .I13(data13),
			    .I14(data14), .I15(data15), .I16(data16), .I17(data17), 
			    .I18(data18), .I19(data19), .I20(data20), .I21(data21),
			    .I22(data22), .I23(data23), .I24(data24), .I25(data25), 
			    .I26(data26), .I27(data27), .I28(data28), .I29(data29),
			    .I30(data30), .I31(data31), .S(ra1), .O(out1));
	mux_1to32 write_enable(.in0(we), .sel0(wa), .out0(we_router0), .out1(we_router1),
			       .out2(we_router2), .out3(we_router3), .out4(we_router4),
			       .out5(we_router5), .out6(we_router7), .out8(we_router8),
			       .out9(we_router9), .out10(we_router10), .out11(we_router11),
			       .out12(we_router12), .out13(we_router13), .out14(we_router14),
			       .out15(we_router15), .out16(we_router16), .out17(we_router17),
  			       .out18(we_router18), .out19(we_router19), .out20(we_router20),
 			       .out21(we_router21), .out22(we_router22), .out23(we_router23),
			       .out24(we_router24), .out25(we_router25), .out26(we_router26),
			       .out27(we_router27), .out28(we_router28), .out29(we_router29),
			       .out30(we_router30), .out31(we_router31));
	register r0(.in0(wd), .out0(data0), .sel0(we_router0), .clock(clock), .reset(reset));
	register r1(.in0(wd), .out0(data1), .sel0(we_router1), .clock(clock), .reset(reset));
	register r2(.in0(wd), .out0(data2), .sel0(we_router2), .clock(clock), .reset(reset));
	register r3(.in0(wd), .out0(data3), .sel0(we_router3), .clock(clock), .reset(reset));
	register r4(.in0(wd), .out0(data4), .sel0(we_router4), .clock(clock), .reset(reset));
	register r5(.in0(wd), .out0(data5), .sel0(we_router5), .clock(clock), .reset(reset));
	register r6(.in0(wd), .out0(data6), .sel0(we_router6), .clock(clock), .reset(reset));
	register r7(.in0(wd), .out0(data7), .sel0(we_router7), .clock(clock), .reset(reset));
	register r8(.in0(wd), .out0(data8), .sel0(we_router8), .clock(clock), .reset(reset));
	register r9(.in0(wd), .out0(data9), .sel0(we_router9), .clock(clock), .reset(reset));
	register r10(.in0(wd), .out0(data10), .sel0(we_router10), .clock(clock), .reset(reset));
	register r11(.in0(wd), .out0(data11), .sel0(we_router11), .clock(clock), .reset(reset));
	register r12(.in0(wd), .out0(data12), .sel0(we_router12), .clock(clock), .reset(reset));
	register r13(.in0(wd), .out0(data13), .sel0(we_router13), .clock(clock), .reset(reset));
	register r14(.in0(wd), .out0(data14), .sel0(we_router14), .clock(clock), .reset(reset));
	register r15(.in0(wd), .out0(data15), .sel0(we_router15), .clock(clock), .reset(reset));
	register r16(.in0(wd), .out0(data16), .sel0(we_router16), .clock(clock), .reset(reset));
	register r17(.in0(wd), .out0(data17), .sel0(we_router17), .clock(clock), .reset(reset));
	register r18(.in0(wd), .out0(data18), .sel0(we_router18), .clock(clock), .reset(reset));
	register r19(.in0(wd), .out0(data19), .sel0(we_router19), .clock(clock), .reset(reset));
	register r20(.in0(wd), .out0(data20), .sel0(we_router20), .clock(clock), .reset(reset));
	register r21(.in0(wd), .out0(data21), .sel0(we_router21), .clock(clock), .reset(reset));
	register r22(.in0(wd), .out0(data22), .sel0(we_router22), .clock(clock), .reset(reset));
	register r23(.in0(wd), .out0(data23), .sel0(we_router23), .clock(clock), .reset(reset));
	register r24(.in0(wd), .out0(data24), .sel0(we_router24), .clock(clock), .reset(reset));
	register r25(.in0(wd), .out0(data25), .sel0(we_router25), .clock(clock), .reset(reset));
	register r26(.in0(wd), .out0(data26), .sel0(we_router26), .clock(clock), .reset(reset));
	register r27(.in0(wd), .out0(data27), .sel0(we_router27), .clock(clock), .reset(reset));
	register r28(.in0(wd), .out0(data28), .sel0(we_router28), .clock(clock), .reset(reset));
	register r29(.in0(wd), .out0(data29), .sel0(we_router29), .clock(clock), .reset(reset));
	register r30(.in0(wd), .out0(data30), .sel0(we_router30), .clock(clock), .reset(reset));
	register r31(.in0(wd), .out0(data31), .sel0(we_router31), .clock(clock), .reset(reset));

endmodule
