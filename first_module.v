`timescale 1us/100ns

module first_module(input wire button1,
                    input wire button2,
                    output wire [9:0] oleds);

    reg [9:0] leds;

    assign oleds = leds;

    always @(button1 or button2) begin
        if (button1) begin
	    leds[0] <= 1'b1;
	    leds[2] <= 1'b1;
	    leds[4] <= 1'b1;
	    leds[6] <= 1'b1;
	    leds[8] <= 1'b1;
        end
        else begin
	    leds[0] <= 1'b0;
	    leds[2] <= 1'b0;
	    leds[4] <= 1'b0;
	    leds[6] <= 1'b0;
	    leds[8] <= 1'b0;
	end
	if (button2) begin
	    leds[1] <= 1'b1;
	    leds[3] <= 1'b1;
	    leds[5] <= 1'b1;
	    leds[7] <= 1'b1;
	    leds[9] <= 1'b1;
        end
	else begin
	    leds[1] <= 1'b0;
	    leds[3] <= 1'b0;
	    leds[5] <= 1'b0;
	    leds[7] <= 1'b0;
	    leds[9] <= 1'b0;
	end
   end
endmodule
