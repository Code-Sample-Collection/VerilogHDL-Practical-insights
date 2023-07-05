module un_shannon (in0, in1, in2, late, en, out);
input [7 : 0] in0, in1, in2;
input late, en;
output out;
  assign out = ((({8{late}} | in0) + in1) == in2) & en;
endmodule
