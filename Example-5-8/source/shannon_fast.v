module shannon_fast (in0, in1, in2, late, en, out);
input [7 : 0] in0, in1, in2;
input         late, en;
output        out;
wire          late_eq_0, late_eq_1;
assign late_eq_0 = ((in0+in1) == in2) & en;
//assign late_eq_0 = ((({8{1'b0}} | in0) + in1) == in2) & en;
assign late_eq_1 = ((8'b1+in1) == in2) & en;
//assign late_eq_1 = ((({8{1'b1}} | in0) + in1) == in2) & en;
assign out = (late) ? late_eq_1 : late_eq_0;
endmodule
