module HalfAdd (X, Y, SUM, C_out);//�����ģ��
input X;
input Y;
output SUM;
output C_out;
assign SUM = X ^ Y ;
assign C_out = X & Y ;
endmodule

module FullAdd (X, Y, C_in, SUM, C_out);//ȫ����ģ��
input X;
input Y;
input C_in;
output SUM;
output C_out;

wire HalfAdd_A_SUM;
wire HalfAdd_A_COUT;
wire HalfAdd_B_COUT;

assign C_out = HalfAdd_A_COUT | HalfAdd_B_COUT ;

HalfAdd u_HalfAdd_A (  //�����ʵ��A
    .X     (X),
    .Y     (Y),
    .SUM   (HalfAdd_A_SUM),
    .C_out (HalfAdd_A_COUT) );

HalfAdd u_HalfAdd_B (  //�����ʵ��B
    .X     (C_in),
    .Y     (HalfAdd_A_SUM),
    .SUM   (SUM),
    .C_out (HalfAdd_B_COUT) );
endmodule
