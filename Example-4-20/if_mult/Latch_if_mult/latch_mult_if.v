module mult_if(a, b, c, d, sel0, sel1, sel2, sel3, z);
input a, b, c, d;
input sel0, sel1, sel2, sel3;
output z;
reg z;
always @(a or b or c or d or sel0 or sel1 or sel2 or sel3)
   begin
      if (sel0) z = a;
      if (sel1) z = b;
      if (sel2) z = c;
      if (sel3) z = d;
   end
endmodule