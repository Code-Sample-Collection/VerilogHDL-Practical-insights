module HalfAdd (X, Y, SUM, C_out);//半加器模块
input X;
input Y;
output SUM;
output C_out;
//assign SUM = X ^ Y ;
//assign C_out = X & Y ;
xor u_xor (SUM, X, Y); //门级原语实例
and u_and (C_out, X, Y); //门级原语实例
endmodule

module FullAdd (X, Y, C_in, SUM, C_out);//全加器模块
input X;
input Y;
input C_in;
output SUM;
output C_out;

wire HalfAdd_A_SUM;
wire HalfAdd_A_COUT;
wire HalfAdd_B_COUT;

//assign C_out = HalfAdd_A_COUT | HalfAdd_B_COUT ;
or u_or (C_out, HalfAdd_A_COUT, HalfAdd_B_COUT);// 门级原语实例
HalfAdd u_HalfAdd_A (  //半加器实例A
    .X     (X),
    .Y     (Y),
    .SUM   (HalfAdd_A_SUM),
    .C_out (HalfAdd_A_COUT) );

HalfAdd u_HalfAdd_B (  //半加器实例B
    .X     (C_in),
    .Y     (HalfAdd_A_SUM),
    .SUM   (SUM),
    .C_out (HalfAdd_B_COUT) );
endmodule
