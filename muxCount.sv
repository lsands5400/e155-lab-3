// Lindsey Sands
// lsands@g.hmc.edu
// 09-11-2026
// This is the time multiplexer module for the seven segment display.
module muxCount(
    input logic        int_osc, reset, en,
	input logic[3:0]   s0, s1,
	
    output logic[3:0]  sOn, 
    output logic       anode0, anode1
);
	localparam int COUNT = 400_000;
    localparam int WIDTH = 19;

    logic[WIDTH-1:0]    counter;
	logic				seg_select, segOn;
    logic[1:0]  		anode;
	
    // Time mux to decide which seven segment display to turn on
    counter #(WIDTH, COUNT)
        timeMux (int_osc, reset, en, counter);

	always_comb 
		begin 
			if (!reset) begin
				seg_select <= 1'b0;
			end

			else if (en) begin
				if (counter == COUNT - 1) begin
					seg_select <= ~seg_select;
				end
			end
			else begin
			end
			
			sOn <= seg_select ? s1 : s0;
			anode <= seg_select ? 2'b10 : 2'b01; 

			anode0 <= anode[0];
			anode1 <= anode[1];
		end

endmodule