module mod_copy1 (sel, a, b, c, d, data_out);
input sel, a, b, c, d;
output data_out;

assign data_out= (sel)? (a+b) : (c+d) ;

endmodule
