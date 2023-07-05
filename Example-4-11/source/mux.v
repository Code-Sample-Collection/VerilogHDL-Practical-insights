module mux (en, a, b, c, d, mux_out);

input  [1:0] en;
input        a, b, c, d;
output       mux_out;

reg mux_out;

 always @ (en or a or b or c or d)
      case(en)
        2'b00:  mux_out = a;
        2'b01:  mux_out = b;
        2'b10:  mux_out = c;
        2'b11:  mux_out = d;
      endcase


endmodule