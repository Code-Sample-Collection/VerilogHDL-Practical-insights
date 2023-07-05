module srl2pal (clk, rst, srl_in, pal_out);

input        clk;
input        rst;
input        srl_in;
output [7:0] pal_out;
reg    [7:0] pal_out;

always @ (posedge clk or negedge rst)
   if (!rst)
      pal_out <= 8'b0;
   else
      pal_out <= {pal_out,srl_in};


endmodule