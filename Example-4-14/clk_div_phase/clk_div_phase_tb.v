`timescale 1ns/1ps
module clk_div_phase_tb;

reg        clk_200K;
reg        rst;
wire       clk_100K, clk_50K, clk_25K;


initial
   begin
     rst = 0;
     clk_200K = 0;
     # 10;
     rst = 1;
     # 3000;
     $stop;
   end

clk_div_phase clk_div_phase_inst (.rst(rst), 
                                  .clk_200K(clk_200K), 
                                  .clk_100K(clk_100K), 
                                  .clk_50K(clk_50K), 
                                  .clk_25K(clk_25K)
                                  );

always # (2500) clk_200K = ~clk_200K;



endmodule