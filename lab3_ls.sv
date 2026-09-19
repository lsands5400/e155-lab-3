// Lindsey Sands
// lsands@g.hmc.edu
// 9-18-2026
// This is the top level module for Lab 3. It takes button press inputs from a keypad
// and sends corresponding hex digit outputs to a multiplexed seven segment display. 
module lab3_ls(input logic[3:0] col,
                output logic[6:0] seg);

    HSOSC #(.CLKHF_DIV(2'b01))
		clk (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

    // Scan for button press inputs
    scanner(int_osc, reset, en, col,
                row, led);

    // Check for bouncing and simulataneous inputs
    debounce(int_osc, led,
                press);

    // Check if button press can be registered and sent to the seven 
    // segment display
    buttonPress(int_osc, reset, press,
                    enSSDP);

    

    storeDigit(int_osc, row, col, enSSDP,
                    s0, s1);

    muxCount(int_osc, reset, en, s0, s1,
                sOn, anode0, anode1);
    
endmodule