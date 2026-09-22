// Lindsey Sands
// lsands@g.hmc.edu
// 09-18-2026
// This is the testbench module for the digit storing module.
`timescale 1 ns/1 ns

module storeDigit_tb();

    logic       reset, int_osc, enSSDP;
	logic[3:0]	row, led;

    HSOSC #(.CLKHF_DIV(2'b01))
		clk (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

    storeDigit dut (
		.clk(int_osc),
		.enSSDP(enSSDP),
        .reset(reset),
        .row(row),
        .led(led),

        .s0(s0),
        .s1(s1)
    );
	
    initial begin

        reset = 0;
        #22;
        reset = 1;

        assert (s0 == 4'0000)      
        else 
            $error("Store Digit test 1a failed."); 

        assert (s1 == 4'b0000)
        else 
            $error("Store Digit test 1b failed."); 
        
        #10
        row = 4'b0010;
        led = 4'b0001;
        #10;                        
        assert (s0 == 4'b0100)
        else 
            $error("Store Digit test 2a failed."); 
          
        assert (s1 == 4'b0000)
        else 
            $error("Store Digit test 2b failed."); 

        #10
        row = 4'b0100;
        led = 4'b1000;
        #10;                        
        assert (s0 == 4'b1100)
        else 
            $error("Store Digit test 2a failed."); 
          
        assert (s1 == 4'b0100)
        else 
            $error("Store Digit test 2b failed.");  
        
        #10
        row = 4'b0001;
        led = 4'b0010;
        #10;                        
        assert (s0 == 4'b0010)
        else 
            $error("Store Digit test 2a failed."); 
          
        assert (s1 == 4'b1100)
        else 
            $error("Store Digit test 2b failed.");  
        
        #100 $stop;

    end
endmodule