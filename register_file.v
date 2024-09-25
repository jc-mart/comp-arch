`timescale 1us/100ns

module register_file(ra0, ra1, ra2, we, wd, wa, out0, out1, out2);
	// I/O
	input wire [31:0] wd;
	input wire [4:0] ra0, ra1, ra2, wa; // 32 possible registers
	input wire we; 
	output wire [31:0] out0, out1, out2;

	// Intermediates
	wire [31:0] wr; // write router from 1:32 mux
	mux_32to1 mux0();
endmodule
