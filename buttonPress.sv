// Lindsey Sands
// lsands@g.hmc.edu
// 9-18-2026
// This module is an FSM that handles button press intake for asynchronous button events. 
module buttonPress();

    typedef enum logic[1:0] {S0, S1, S2} statetype;
    statetype state, nextstate;

    // State register
    always_ff @(posedge clk) begin
        if (reset)          state <= S0;
        else                state <= nextstate;

    end

    always_comb
        begin
            case(state)
                S0: 

                S1:

                S2:

                default:
            endcase
        end
    // State 0:
    // The system is ready to register a new button press if:
        // 1. No other buttons are being pressed

    // State 1:
    // The system is not ready to register a new button press if:
        // 1. Another button is currently being pressed
        // 2. Debouncing is occuring

endmodule