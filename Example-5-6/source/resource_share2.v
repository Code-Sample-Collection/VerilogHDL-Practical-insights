module resource_share2 (data_in,square);
input [7:0]   data_in;       //ÊäÈëÊÇ²¹Âë
output [15:0]  square;
wire  [7:0]   data_tmp;

assign data_tmp = (data_in[7])? (~data_in + 1) : data_in;
assign square = data_tmp * data_tmp;
endmodule
