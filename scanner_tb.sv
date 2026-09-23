// Lindsey Sands
// lsands@g.hmc.edu
// 09-11-2026
// This is the testbench module for the keypad scanner module.
`timescale 1 ns/1 ns

module scanner_tb();
	
	logic		int_osc;
	logic		reset;
	logic		en;
	logic[3:0]	col;
	
	logic[3:0]	row, led;
	
	HSOSC #(.CLKHF_DIV(2'b01))
		dut2 (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
		
    scanner dut (
		.int_osc(int_osc),
        .reset(reset),
		.en(en),
		.col(col),
		
		.row(row),
        .led(led)
    );

    initial begin
    reset = 1;
    #22 reset = 0;

    // Test all four output transitions
	en = 1;
	#22 reset = 0;
	reset = 1;
	#5;
	// First, row[3] should be on
	assert (row == 4'b1000)
	else 
		$error("Scanner row[3] test failed."); 
		
	#35_000_000;
	// Then, row[2]...
	assert (row == 4'b0100)
	else 
		$error("Scanner row[2] test failed.");
		
	#35_000_000;		
	// row[1]...
	assert (row == 4'b0010)
	else 
		$error("Scanner row[1] test failed."); 
		
	#35_000_000;
	// row[0]...
	assert (row == 4'b0001)
	else 
		$error("Scanner row[0] test failed."); 
		
	// Enable test
	en = 0;
	#30_050_000;
	assert (row == 4'b0001)
	else 
		$error("Enable test 1 failed."); 
	
	reset = 0;
	#35_000_000;
	assert (row == 4'b1000)
	else 
		$error("Enable test 2 failed."); 
		
	// Reset test
	en = 1;
	#22 reset = 0;
	#35_000_000;
	assert (row == 4'b1000)
	else 
		$error("Reset test 1 failed."); 
	
	reset = 1;
	#35_000_000;
	assert (row == 4'b0100)
	else 
		$error("Reset test 2 failed."); 

    end
endmodule