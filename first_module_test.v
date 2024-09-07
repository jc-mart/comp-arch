`timescale 1us/100ns

module first_module_tb();
    reg button1;
    reg button2;

    wire [9:0] leds;

    first_module fm (.button1(button1), .button2(button2), .oleds(leds));

    initial begin
        button1 = 0;
        button2 = 0; 
        #5;
        button1 = 1;
        #10;
        button2 = 1;
        #10;
	    $finish;
    end

endmodule
