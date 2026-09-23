// Lindsey Sands
// lsands@g.hmc.edu
// 09-11-2026
// This is the top module for Lab 2.
module lab2_ls (
    input logic[3:0]    s0, s1, col, 
    input logic         reset, en,

    output logic[6:0]   segOn,
    output logic        anode0, anode1,
    output logic[3:0]   row, led
);
    // To store clk value
    logic       int_osc;

    // For mux module
    logic[3:0]       sOn; 

    // Internal High Speed Oscillator generates clock signal at 
    // 24 MHz
    HSOSC #(.CLKHF_DIV(2'b01))
		clk (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

    //// Seven segment display and time mux
    //muxCount mux (int_osc, reset, en, s0, s1, 
        //sOn, anode0, anode1);
		
    //sevenSegDP dp (sOn, segOn);

    //// Keypad scanner
    scanner scan (int_osc, reset, en, col, 
		row, led);

endmodule