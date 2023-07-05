module cnt1 (clock, cnt_out);

input        clock;
output [3:0] cnt_out;

reg [3:0] cnt_out;
  always @ (posedge clock)
         cnt_out <= cnt_out + 1;


endmodule