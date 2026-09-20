// Lindsey Sands
// lsands@g.hmc.edu
// 9-18-2026
// This module is an FSM that handles button press intake for asynchronous button events. 
module buttonPress(input logic clk, reset, press,
                    output logic enSSDP);

    typedef enum logic[1:0] {S0, S1, S2} statetype;
    statetype state, nextstate;

    // State register
    always_ff @(posedge clk) begin
        if (!reset)          state <= S0;
        else                state <= nextstate;
    end

    always_comb
        begin
            case(state)
                // State 0:
                // The system is ready to register a new button press if:
                // 1. No other buttons are being pressed
                // 2. Debouncing is not occurring
                S0: if (press == 0) begin             
                        nextstate <= S0;
                        enSSDP <= 0;
                    end
                    else begin
                        nextstate <= S1;
                        enSSDP <= 1;
                    end

                // State 1: 
                // Initial press is registered and hex value is sent to seven 
                // segment display
                S1: if (press == 0) begin             
                        nextstate <= S0;
                        enSSDP <= 0;
                    end
                    else begin
                        nextstate <= S2;
                        enSSDP <= 0;
                    end

                // State 2:
                // The system is not ready to register a new button press if:
                // 1. Another button is currently being pressed
                // 2. Debouncing is occuring
                S2: if (press == 0) begin             
                        nextstate <= S0;
                        enable <=0;
                    end
                    else begin
                        nextstate <= S2;
                        enSSDP <= 0;
                    end

                default: S0;
            endcase
        end

endmodule