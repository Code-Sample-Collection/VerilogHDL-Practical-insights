`timescale 1ns/100ps
module tb;
reg [3:0] a ;
reg [3:0] b ;
wire [4:0] sum ;

initial begin
a = 0;
b = 0;
# 5
a = 'ha ;
# 1
b = 'h3 ;
a = 'he ;
# 1
a = 'hf ;
# 1
b = 1 ;
# 5;
a = 2 ;
b = 8 ;
end

AD2 inst (
.a (a),
.b (b),
.sum (sum)
);
endmodule



module AD2 (a, b, sum);
input [3:0] a ;
input [3:0] b ;
output [4:0] sum ;
reg [4:0] sum ;

always @( a or b ) begin //Óï¾äA£¬²»ÍÆ¼ö
sum = #5 a + b ;
end

endmodule