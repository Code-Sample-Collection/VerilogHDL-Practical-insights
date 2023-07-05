module mux (en, a, b, mux_out);

input        en;
input        a, b;
output       mux_out;

wire mux_out;
 assign mux_out = (en)? a : b;

endmodule