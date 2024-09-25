`timescale 1us/100ns

module barrel_shifter(in, shift, selector, out);
	// I/O
	input wire [31:0] in;
	input wire [5:0] shift;
	input wire [1:0] selector; // SLL, SLR, SAR
	output reg [31:0] out; // Only being used in case statements

	// Logic
	always @(*) begin
		if (selector == 2'b00) begin // 00 == SLL
			case (shift)
				6'd0:  out = in;
				6'd1:  out = {in[30:0], 1'b0};
				6'd2:  out = {in[29:0], 2'b0};
				6'd3:  out = {in[28:0], 3'b0};
    				6'd4:  out = {in[27:0], 4'b0};
			    	6'd5:  out = {in[26:0], 5'b0};
    				6'd6:  out = {in[25:0], 6'b0};
    				6'd7:  out = {in[24:0], 7'b0};
    				6'd8:  out = {in[23:0], 8'b0};
    				6'd9:  out = {in[22:0], 9'b0};
    				6'd10: out = {in[21:0], 10'b0};
    				6'd11: out = {in[20:0], 11'b0};
    				6'd12: out = {in[19:0], 12'b0};
    				6'd13: out = {in[18:0], 13'b0};
    				6'd14: out = {in[17:0], 14'b0};
    				6'd15: out = {in[16:0], 15'b0};
    				6'd16: out = {in[15:0], 16'b0};
    				6'd17: out = {in[14:0], 17'b0};
    				6'd18: out = {in[13:0], 18'b0};
    				6'd19: out = {in[12:0], 19'b0};
    				6'd20: out = {in[11:0], 20'b0};
    				6'd21: out = {in[10:0], 21'b0};
    				6'd22: out = {in[9:0], 22'b0};
    				6'd23: out = {in[8:0], 23'b0};
    				6'd24: out = {in[7:0], 24'b0};
    				6'd25: out = {in[6:0], 25'b0};
    				6'd26: out = {in[5:0], 26'b0};
    				6'd27: out = {in[4:0], 27'b0};
    				6'd28: out = {in[3:0], 28'b0};
    				6'd29: out = {in[2:0], 29'b0};
    				6'd30: out = {in[1:0], 30'b0};
    				6'd31: out = {in[0], 31'b0};
				6'd32: out = 32'b0;
    				default: out = in;

			endcase
		end

		else if (selector == 2'b01) begin // 01 == SLR
			case (shift)
				6'd0:  out = in;
    				6'd1:  out = {1'b0, in[31:1]};
    				6'd2:  out = {2'b0, in[31:2]};
    				6'd3:  out = {3'b0, in[31:3]};
    				6'd4:  out = {4'b0, in[31:4]};
    				6'd5:  out = {5'b0, in[31:5]};
    				6'd6:  out = {6'b0, in[31:6]};
    				6'd7:  out = {7'b0, in[31:7]};
    				6'd8:  out = {8'b0, in[31:8]};
    				6'd9:  out = {9'b0, in[31:9]};
    				6'd10: out = {10'b0, in[31:10]};
    				6'd11: out = {11'b0, in[31:11]};
    				6'd12: out = {12'b0, in[31:12]};
    				6'd13: out = {13'b0, in[31:13]};
    				6'd14: out = {14'b0, in[31:14]};
    				6'd15: out = {15'b0, in[31:15]};
    				6'd16: out = {16'b0, in[31:16]};
    				6'd17: out = {17'b0, in[31:17]};
    				6'd18: out = {18'b0, in[31:18]};
    				6'd19: out = {19'b0, in[31:19]};
    				6'd20: out = {20'b0, in[31:20]};
    				6'd21: out = {21'b0, in[31:21]};
    				6'd22: out = {22'b0, in[31:22]};
    				6'd23: out = {23'b0, in[31:23]};
    				6'd24: out = {24'b0, in[31:24]};
    				6'd25: out = {25'b0, in[31:25]};
    				6'd26: out = {26'b0, in[31:26]};
    				6'd27: out = {27'b0, in[31:27]};
    				6'd28: out = {28'b0, in[31:28]};
    				6'd29: out = {29'b0, in[31:29]};
    				6'd30: out = {30'b0, in[31:30]};
    				6'd31: out = {31'b0, in[31]};
				6'd32: out = 32'b0;
				default: out = in;

			endcase
		end

		else if (selector == 2'b10) begin // 10 == SAR
			case (shift)
				6'd0:  out = in;
    				6'd1:  out = {in[31], in[31:1]};
    				6'd2:  out = {{2{in[31]}}, in[31:2]};
    				6'd3:  out = {{3{in[31]}}, in[31:3]};
    				6'd4:  out = {{4{in[31]}}, in[31:4]};
    				6'd5:  out = {{5{in[31]}}, in[31:5]};
    				6'd6:  out = {{6{in[31]}}, in[31:6]};
    				6'd7:  out = {{7{in[31]}}, in[31:7]};
    				6'd8:  out = {{8{in[31]}}, in[31:8]};
    				6'd9:  out = {{9{in[31]}}, in[31:9]};
    				6'd10: out = {{10{in[31]}}, in[31:10]};
    				6'd11: out = {{11{in[31]}}, in[31:11]};
    				6'd12: out = {{12{in[31]}}, in[31:12]};
    				6'd13: out = {{13{in[31]}}, in[31:13]};
    				6'd14: out = {{14{in[31]}}, in[31:14]};
    				6'd15: out = {{15{in[31]}}, in[31:15]};
    				6'd16: out = {{16{in[31]}}, in[31:16]};
    				6'd17: out = {{17{in[31]}}, in[31:17]};
    				6'd18: out = {{18{in[31]}}, in[31:18]};
    				6'd19: out = {{19{in[31]}}, in[31:19]};
    				6'd20: out = {{20{in[31]}}, in[31:20]};
    				6'd21: out = {{21{in[31]}}, in[31:21]};
    				6'd22: out = {{22{in[31]}}, in[31:22]};
    				6'd23: out = {{23{in[31]}}, in[31:23]};
    				6'd24: out = {{24{in[31]}}, in[31:24]};
    				6'd25: out = {{25{in[31]}}, in[31:25]};
    				6'd26: out = {{26{in[31]}}, in[31:26]};
    				6'd27: out = {{27{in[31]}}, in[31:27]};
    				6'd28: out = {{28{in[31]}}, in[31:28]};
    				6'd29: out = {{29{in[31]}}, in[31:29]};
    				6'd30: out = {{30{in[31]}}, in[31:30]};
    				6'd31: out = {{31{in[31]}}};
				6'd32: out = {32{in[31]}};
    				default: out = in;

			endcase
		end

		else begin // Default to input if 11 is selected
			out = in; 

		end
	end

endmodule
