// Lindsey Sands
// lsands@g.hmc.edu
// 09-11-2026
// This is the scanner module.
module scanner (
    input logic         int_osc,
    input logic         reset,
    input logic         en,
	input logic[3:0]	col,
	
    output logic[3:0]   row, 
	output logic[3:0]	led
);

	// Define parameters for counter
    localparam int COUNT = 23'd1_500_000;
    localparam int WIDTH = 25;
	
	logic[WIDTH-1:0] currCount;
		
    counter #(WIDTH, COUNT*4)
        scanner (int_osc, reset, en, currCount);
	
	always_comb
		begin 
			led <= ~col;

			if ((currCount >= 0) && (currCount <= COUNT)) begin
				row <= 4'b0111;
				end
			else if ((currCount > COUNT) && (currCount <= COUNT*2))
				row <= 4'b1011;
			else if ((currCount > COUNT*2) && (currCount <= COUNT*3))
				row <= 4'b1101;
			else if ((currCount > COUNT*3) && (currCount <= COUNT*4))
				row <= 4'b1110;
		end

endmodule