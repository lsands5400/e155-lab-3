// Lindsey Sands
// lsands@g.hmc.edu
// 09-18-2026
// This is the testbench module for the lab 3 top module.
`timescale 1 ns/1 ns

module lab3_tb();
	
	logic 		reset, en;
	logic 		anode0, anode1;
	logic[3:0]	s0, s1, col, row, led;
	logic[6:0]	seg0, seg1;
    
    lab3_ls dut (
		.s0(s0), 
		.s1(s1), 
		.col(col), 
        .reset(reset),
		.en(en),
		
        .seg0(seg0),
		.seg1(seg1),
		.anode0(anode0),
		.anode1(anode1),
		.row(row),
        .led(led)
    );
	
	HSOSC #(.CLKHF_DIV(2'b01))
		clk (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

    initial begin
	// Set enable = 1 for all tests
	en = 1;
	
    reset = 1;
    #5 reset = 0;
	#20;
	
	// Test scanner LED output
	reset = 1;
	
	col = 4'b0001;
	#10;                        // wait required time
	assert (led == 4'b0001)       // check outputs
	else 
		$error("Scanner LED test 1 failed."); 
	
	col = 4'b0010;
	#10;                        // wait required time
	assert (led == 4'b0010)       // check outputs
	else 
		$error("Scanner LED test 2 failed."); 
	
	col = 4'b0100;
	#10;                        // wait required time
	assert (led == 4'b0100)       // check outputs
	else 
		$error("Scanner LED test 3 failed."); 
		
		col = 4'b1000;
	#10;                        // wait required time
	assert (led == 4'b1000)       // check outputs
	else 
		$error("Scanner LED test 4 failed."); 

 
    // Test multiplexing
	reset = 1;
	// We begin with seg0 being on
	s0 = 4'b0000;
	s1 = 4'b0011;

	#15;                        // wait required time
	assert (anode1 == 0 && anode0 == 1)
	else 
		$error("Mux test failed. anode is wrong."); 
	
	// Then we wait to see the switch to seg1 being on
	#180;                        // wait required time
	assert (anode1 == 1 && anode0 == 0)
	else 
		$error("Mux test 2 failed. anode is wrong."); 

    #100 $stop;
    end
endmodule