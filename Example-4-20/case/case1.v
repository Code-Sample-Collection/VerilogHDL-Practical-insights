module case1(a, b, c, d, sel0, sel1, sel2, sel3, z);
input a, b, c, d;
input sel0, sel1, sel2, sel3;
output z;
reg z;
always @(a or b or c or d or sel0, sel1, sel2, sel3)
   begin
      casex ({sel0, sel1, sel2, sel3})
         4'b1xxx: z = d;
         4'bx1xx: z = c;
         4'bxx1x: z = b;
         4'bxxx1: z = a;
         default: z = 1'b0;
      endcase
   end
endmodule