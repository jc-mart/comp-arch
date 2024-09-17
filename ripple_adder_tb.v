`timescale 1us/100ns

module ripple_adder_tb();
	// Test I/O
	reg [3:0] tA; 
	reg [3:0] tB; 
	wire [3:0] tS; 

	// Four-bit ripple adder testing
	ripple_adder ra(.A_bus(tA), .B_bus(tB), .S_bus(tS));

	initial begin
		// Test inputs
		tA    = 4'b0;
		tB    = 4'b0;

		#5 // Time delay 5 time units

		// Expecting 10
		tA    = 4'b0001;
		tB    = 4'b0001;

		#5

		// Expecting 1
		tA    = 4'b0001;
		tB    = 4'b0000;

		#5

		// Expecting 11
		tA    = 4'b0010;
		tB    = 4'b0001;

		#5

		// Expecting 100
		tA    = 4'b0001;
		tB    = 4'b0011;

		#5

		// Expecting 11
		tA    = 4'b0000;
		tB    = 4'b0011;

		#5

		// Expecting 110
		tA    = 4'b0011;
		tB    = 4'b0011;

		#5
		$finish;

	end
endmodule
