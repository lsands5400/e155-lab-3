// Lindsey Sands
// lsands@g.hmc.edu
// 9-18-2026
// This module is an FSM that handles debouncing for asynchronous switch inputs.
module debounce(input logic         clk,
                input logic[3:0]    row, led,

                output logic        press);

    typedef enum logic {S0, S1} statetype;
    statetype state, nextstate;
    // check if multiple bits of led are on

    // check if one input is rapidly repeating

    always_ff @ (posedge clk) begin
        if (!reset)          state <= S0;
        else                state <= nextstate;
    end

    always_comb
        begin
            case(state)
                S0: if 

                S1:

            endcase
        end

endmodule