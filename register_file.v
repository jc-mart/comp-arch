`timescale 1us/100ns

module register_file(ra0, ra1, we, wd, wa, out0, out1);
	// I/O
	input wire [31:0] wd;
	input wire [4:0] ra0, ra1, wa; // 32 possible registers
	input wire we; 
	output wire [31:0] out0, out1;

	// Intermediates
	wire we_router0, we_router1, we_router2, we_router3, // write data router from 1:32 mux
	     we_router4, we_router5, we_router6, we_router7,
	     we_router8, we_router9, we_router10, we_router11,
	     we_router12, we_router13, we_router14, we_router15,
	     we_router16, we_router16, we_router17, we_router18,
	     we_router19, we_router20, we_router21, we_router22,
	     we_router23, we_router24, we_router25, we_router26,
	     we_router27, we_router28, we_router29, we_router30,
	     we_router31;
	wire [31:0] data0_0, data0_1, data0_2, data0_3, data0_4, data0_5,
		    data0_6, data0_7, data0_8, data0_9, data0_10, data0_11,
		    data0_12, data0_13, data0_14, data0_15, data0_16,
		    data0_17, data0_18, data0_19, data0_20, data0_21,
		    data0_22, data0_23, data0_24, data0_25, data0_26,
		    data0_27, data0_28, data0_29, data0_30, data0_31,
		    data1_0, data1_1, data1_2, data1_3, data1_4, data1_5,
		    data1_6, data1_7, data1_8, data1_9, data1_10, data1_11,
		    data1_12, data1_13, data1_14, data1_15, data1_16,
		    data1_17, data1_18, data1_19, data1_20, data1_21,
		    data1_22, data1_23, data1_24, data1_25, data1_26,
		    data1_27, data1_28, data1_29, data1_30, data1_31;
	mux_32to1 data_out0();
	mux_32to1 data_out1();
	mux_1to32 write_enable();
	// 32 Registers
	register r0()
endmodule
