module mod_copy1 (sel, a, b, c, d, data_out);
input sel, a, b, c, d;
output data_out;

wire temp1, temp2;
assign temp1 = (sel)? (a) : (c) ;
assign temp2 = (sel)? (b) : (d) ;
assign data_out = temp1 + temp2;


endmodule