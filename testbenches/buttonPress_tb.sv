// Lindsey Sands
// lsands@g.hmc.edu
// 09-22-2026
// This is the testbench module for the button press module.
`timescale 1 ns/1 ns

module buttonPress_tb();

	logic      	clk, reset, press, enSSDP;
    
    buttonPress dut (
		.clk(clk),
		.reset(reset),
        .press(press),

        .enSSDP(enSSDP)
    );
	
    HSOSC #(.CLKHF_DIV(2'b01))
		clk (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

    initial begin

    reset = 0;
    #22;
	reset = 1;
	#10;  

    press = 0;     
    #10
	assert (enSSDP == 0)       // check outputs
	else 
		$error("Button Press test 1 failed."); 
	
    #10; 
    press = 1;
	#10;                        // wait required time
	assert (enSSDP == 1)       // check outputs
	else 
		$error("Button Press test 2 failed.");

    #10
    press = 0;     
    #10
	assert (enSSDP == 0)       // check outputs
	else 
		$error("Button Press test 1 failed."); 
	

    #100 $stop;
    end

endmodule