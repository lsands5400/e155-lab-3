// Lindsey Sands
// lsands@g.hmc.edu
// 09-18-2026
// This is the testbench module for the keypad decoder module.
`timescale 1 ns/1 ns

module decodeKeypad_tb();

	logic[3:0]	col, row, hex;
    logic       clk;
    
    decodeKeypad dut (
		.col(col),
		.row(row),

        .hex(hex)
    );
	
    always begin
        clk = 0; #5;
        clk = 1; #5;
    end

    initial begin

    row = 4'b0010;
	col = 4'b0001;
	#10;                        // wait required time
	assert (hex == 4'b0100)       // check outputs
	else 
		$error("Keypad Decoder test 1 failed."); 
	
    #10; 
    row = 4'b1000;
	col = 4'b1000;
	#10;                        // wait required time
	assert (hex == 4'b1101)       // check outputs
	else 
		$error("Keypad Decoder test 2 failed."); 
	
    #100 $finish;
    end
endmodule