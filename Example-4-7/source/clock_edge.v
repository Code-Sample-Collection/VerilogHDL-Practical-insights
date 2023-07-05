module clock_edge (clk_50M, clk_100M, rst_, cnt1, cnt2);

input        clk_50M, clk_100M, rst_;
output [3:0] cnt1, cnt2;
reg    [3:0] cnt_temp1, cnt_temp2, cnt2;
wire   [3:0] cnt1;

always @ (posedge clk_50M or negedge rst_ )
   if (!rst_)
      cnt_temp1 <= 4'b0000;
   else
      cnt_temp1 <= cnt_temp2 + 1;

always @ (negedge clk_50M or negedge rst_ )
   if (!rst_)
      cnt_temp2 <= 4'b0000;
   else
      cnt_temp2 <= cnt_temp1 + 1;

assign cnt1 = (clk_50M)? cnt_temp2 : cnt_temp1;

always @ (posedge clk_100M or negedge rst_ )
   if (!rst_)
      cnt2 <= 4'b0000;
   else
      cnt2 <= cnt2 + 1;


endmodule