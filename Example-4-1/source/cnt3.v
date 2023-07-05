module cnt2 (cnt_out, cnt_out_plus);

input  [3:0] cnt_out;
output [3:0] cnt_out_plus;


wire [3:0] cnt_out_plus;
assign   cnt_out_plus = cnt_out + 1;


endmodule