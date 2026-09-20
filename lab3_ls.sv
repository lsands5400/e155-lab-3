// Lindsey Sands
// lsands@g.hmc.edu
// 9-18-2026
// This is the top level module for Lab 3. It takes button press inputs from a keypad
// and sends corresponding hex digit outputs to a multiplexed seven segment display. 
module lab3_ls(input logic[3:0]     col,
                input logic         reset, en,

                output logic[6:0]   seg,
                output logic        anode0, anode1);

    logic       int_osc, press, enSSDP;
    logic[3:0]  led, s0, s1;

    HSOSC #(.CLKHF_DIV(2'b01))
		clk (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

    // Scan for button press inputs
    scanner scan (int_osc, reset, en, col,
                row, led);

    // Check for bouncing and simulataneous inputs
    debounce db (int_osc, row, led,
                press);

    // Check if button press can be registered and sent to the seven 
    // segment display
    buttonPress bp (int_osc, reset, press,
                    enSSDP);
    
    storeDigit sd (int_osc, enSSDP, reset, row, led,
                    s0, s1);

    muxCount mux (int_osc, reset, enSSDP, s0, s1,
                sOn, anode0, anode1);

    sevenSegDP ssdp (sOn, seg);
    
endmodule