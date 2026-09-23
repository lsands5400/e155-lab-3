// Lindsey Sands
// lsands@g.hmc.edu
// 09-20-2026
// This is the 4-bit two input/outputsynchronizer module.
module synchronizer(input logic         clk, reset, en, 
                    input logic[3:0]    in1, in2, 
                    output logic[3:0]   out1, out2);

    logic[3:0] intermediate1, intermediate2;

    always_ff @ (posedge clk) begin
        if (!reset) begin
            intermediate1 <= 4'b0000;
            intermediate2 <= 4'b0000;
        end
        else begin
            intermediate1 <= in1;
            intermediate2 <= in2;
        end
    end

    always_ff @ (posedge clk) begin
        if (!reset) begin
            out1 <= 4'b0000;
            out2 <= 4'b0000;
        end
        else begin
            out1 <= intermediate1;
            out2 <= intermediate2;
        end
    end
    
endmodule

