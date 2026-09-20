// Lindsey Sands
// lsands@g.hmc.edu
// 9-18-2026
// This module is an FSM that stores the two most recent button press values.
module storeDigit(input logic        clk, enSSDP, reset,
                  input logic[3:0]   row, led,

                  output logic       s0, s1);

    // TODO: does synchronizer go here or in top level module?
    always_ff @ (posedge clk) begin
        decodeKeypad(row, led, hex);

        if (!reset) begin
            s0 <= 4'b0000;
            s1 <= 4'b0000;
            end

        else begin
            s1 <= s0;
            s0 <= hex;
        end
    end

endmodule