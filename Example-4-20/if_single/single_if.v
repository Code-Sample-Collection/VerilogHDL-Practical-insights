module single_if(a, b, c, d, sel0, sel1, sel2, sel3, z);
input a, b, c, d;
input sel0, sel1, sel2, sel3;
output z;
reg z;
always @(a or b or c or d or sel0 or sel1 or sel2 or sel3)
   begin
      z = 0;
      if (sel3)
          z = d;
      else if (sel2)
          z = c;
      else if (sel1)
          z = b;
      else if (sel0)
          z = a;                                                    
   end
endmodule