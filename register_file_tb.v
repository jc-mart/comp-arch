`timescale 1us/100ns

module register_file_tb();
	// Test I/O
	reg [31:0] write_data;
	reg [4:0] read_address0, read_address1, write_address;
	reg write_enable, clock, reset;
	wire [31:0] output0, output1;

	// Register file testing
	register_file rf(.ra0(read_address0), .ra1(read_address1),
			 .we(write_enable), .wd(write_data),
			 .wa(write_address), .out0(output0),
			 .out1(output1), .clock(clock),
			 .reset(reset));

	initial begin
		clock = 1'b0;
		reset = 1'b1;
		#10

		reset = 1'b0;
		#10

		write_address = 5'd0;
		write_enable = 1'b0;
		write_data = 32'd0;
		read_address0 = 5'd0;
		read_address1 = 5'd0;
		#10

		write_address = 5'd25;
		write_enable = 1'b1;
		write_data = 32'd10;
		#10

		write_enable = 1'b0;
		write_address = 5'd12;
		write_data = 32'd1024;
		#10

		write_enable = 1'b1;
		#10

		write_enable = 1'b0;
		#10
		
		read_address0 = 5'd25;
		read_address1 = 5'd12;
		#10

		$finish;

	end

	always
		#5
		clock = ~clock;
endmodule
