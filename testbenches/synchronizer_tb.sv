// Lindsey Sands
// lsands@g.hmc.edu
// 09-23-2026
// This is the testbench module for the 4-bit two input/output synchronizer module.
`timescale 1 ns/1 ns

module synchronizer_tb();

  logic       clk, reset, en;
	logic[3:0]	in1, in2, out1, out2;
    
  synchronizer dut (
  .clk(clk),
  .reset(reset),
      .en(en),
      .in1(in1),
      .in2(in2),

      .out1(out1),
      .out2(out2)
  );

  always begin
    clk = 0;  #5;
    clk = 1;  #5;
  end
  
  initial begin
      en = 1;
      reset = 1;
      #25;
      reset = 0;
      #25;
      reset = 1;
      #10;

      in1 = 4'b0010;
      in2 = 4'b1000;

      #4;                        
      assert (out1 == 4'b0000)       
      else 
          $error("Synchronizer test 1a failed."); 
      assert (out2 == 4'b0000)       
      else 
          $error("Synchronizer test 1b failed."); 
      #13;                        
      assert (out1 == 4'b0010)       
      else 
          $error("Synchronizer test 1c failed."); 
      assert (out2 == 4'b1000)       
      else 
          $error("Synchronizer test 1d failed."); 
      
      #10;
      en = 0;
      #25;
      reset = 0;
      #25;
      reset = 1;
      #10;
                    
      assert (out1 == 4'b0000)       
      else 
          $error("Synchronizer test 2a failed."); 
      assert (out2 == 4'b0000)       
      else 
          $error("Synchronizer test 2b failed.");

      #10;           
      assert (out1 == 4'b0000)       
      else 
          $error("Synchronizer test 2c failed."); 
      assert (out2 == 4'b0000)       
      else 
          $error("Synchronizer test 2d failed."); 

      #100 $finish;
  end
endmodule