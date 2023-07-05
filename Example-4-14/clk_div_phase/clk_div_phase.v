module clk_div_phase (rst, clk_200K, clk_100K, clk_50K, clk_25K);

input        clk_200K;
input        rst;
output       clk_100K, clk_50K, clk_25K;
wire         clk_100K, clk_50K, clk_25K;

reg [2:0] cnt;  

always @ (posedge clk_200K or negedge rst)
   if (!rst)
      cnt <= 3'b000;
   else
      cnt <= cnt + 1;

assign clk_100K = ~cnt [0];
assign clk_50K  = ~cnt [1];
assign clk_25K  = ~cnt [2];

endmodule