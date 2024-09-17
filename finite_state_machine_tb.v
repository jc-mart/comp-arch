`timescale 1us/100ns

module finite_state_machine_tb();
	// Test inputs
	reg clk, rst;
	
	// Finite state machine testing
	finite_state_machine fsm(.clock(clk), .reset(rst));

	initial begin
		clk = 1'b0;
		rst = 1'b1;
		
		#5
		rst = 1'b0;
	end

	always
		#5
		clk = ~clk;
endmodule
