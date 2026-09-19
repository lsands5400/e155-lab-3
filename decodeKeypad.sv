// Lindsey Sands
// lsands@g.hmc.edu
// 9-18-2026
// This module decodes the keypad inputs and turns them into their hex digits 
// represented in binary.
module decodeKeypad(input logic[3:0] row, col,
					output logic[6:0] hex);

	always_comb
		case({row, col})
			8'b0001_0001: hex = 4'b0001; // 0x0 --> 1
			8'b0001_0010: hex = 4'b0010; // 0x1 --> 2
			8'b0001_0100: hex = 4'b0011; // 0x2 --> 3
			8'b0001_1000: hex = 4'b1010; // 0x3 --> A
			8'b0010_0001: hex = 4'b0100; // 1x0 --> 4
			8'b0010_0010: hex = 4'b0101; // 1x1 --> 5
			8'b0010_0100: hex = 4'b0110; // 1x2 --> 6
			8'b0010_1000: hex = 4'b1011; // 1x3 --> B
            8'b0100_0001: hex = 4'b0111; // 2x0 --> 7
			8'b0100_0010: hex = 4'b1000; // 2x1 --> 8
			8'b0100_0100: hex = 4'b1001; // 2x2 --> 9
			8'b0100_1000: hex = 4'b1100; // 2x3 --> C
            8'b1000_0001: hex = 4'b1110; // 3x0 --> E
			8'b1000_0010: hex = 4'b0000; // 3x1 --> 0
			8'b1000_0100: hex = 4'b1111; // 3x2 --> F
			8'b1000_1000: hex = 4'b1101; // 3x3 --> D
			default: hex = 4'b0000;
		endcase
		
endmodule