module resource_share1 (data_in,square);
input [7:0]   data_in;     //输入是补码
output [15:0]  square;
wire  [7:0]   data_bar;

assign data_bar = ~data_in + 1;
assign square=(data_in[7])? (data_bar*data_bar) : (data_in*data_in);
endmodule
