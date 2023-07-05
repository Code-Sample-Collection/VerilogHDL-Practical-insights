`timescale 1ns/1ps
module clk_3div_tb;

reg        clk;
reg        rst_;
wire       clk_3div;


initial
   begin
     rst_ = 0;
     clk = 0;
     # 10;
     rst_ = 1;
     # 1000;
     $stop;
   end


 clk_3div clk_3div_u1 (.clk(clk),
                   .reset(rst_),
                   .clk_out(clk_3div));

always # 10 clk = ~clk;



endmodule