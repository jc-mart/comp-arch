`timescale 1us/100ns

module ripple_adder(A_bus, B_bus, S_bus);
	// I/O
	input wire [3:0] A_bus;
	input wire [3:0] B_bus;
	output wire [3:0] S_bus;
	// Intermediates
	wire [3:0] C_in_bus;
	wire [3:0] C_out_bus;

	// Logic
	full_adder bit0(.A(A_bus[0]), .B(B_bus[0]), .C_in(1'b0), .S(S_bus[0]), .C_out(C_out_bus[0]));
	full_adder bit1(.A(A_bus[1]), .B(B_bus[1]), .C_in(C_out_bus[0]), .S(S_bus[1]), .C_out(C_out_bus[1]));
	full_adder bit2(.A(A_bus[2]), .B(B_bus[2]), .C_in(C_out_bus[1]), .S(S_bus[2]), .C_out(C_out_bus[2]));
	full_adder bit3(.A(A_bus[3]), .B(B_bus[3]), .C_in(C_out_bus[2]), .S(S_bus[3]), .C_out(C_out_bus[3]));

endmodule
