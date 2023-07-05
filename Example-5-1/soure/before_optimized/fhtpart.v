module fhtpart(Clk,Reset,FhtStarOne,FhtStarTwo,FhtStarThree,FhtStarFour,
           I0,I1,I2,I3,I4,I5,I6,I7,I8,
           I9,I10,I11,I12,I13,I14,I15,
           Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,
           Out9,Out10,Out11,Out12,Out13,Out14,Out15);
input Clk;
input Reset;
input FhtStarOne,FhtStarTwo,FhtStarThree,FhtStarFour;
input [11:0] I0,I1,I2,I3,I4,I5,I6,I7,I8;
input [11:0] I9,I10,I11,I12,I13,I14,I15;
output [15:0] Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7;
output [15:0] Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15;

wire [12:0] m0,m1,m2,m3,m4,m5,m6,m7,m8,m9;
wire [12:0] m10,m11,m12,m13,m14,m15;
wire [13:0] mm0,mm1,mm2,mm3,mm4,mm5,mm6,mm7,mm8,mm9;
wire [13:0] mm10,mm11,mm12,mm13,mm14,mm15;
wire [14:0] mmm0,mmm1,mmm2,mmm3,mmm4,mmm5,mmm6,mmm7,mmm8,mmm9;
wire [14:0] mmm10,mmm11,mmm12,mmm13,mmm14,mmm15;
wire [15:0] Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9;
wire [15:0] Out10,Out11,Out12,Out13,Out14,Out15;

fht_unit1 fht_unit1(Clk,Reset,FhtStarOne,
           I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,
           I13,I14,I15,
           m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,
           m13,m14,m15
           );

fht_unit2 fht_unit2(Clk,Reset,FhtStarTwo,
           m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,
           m13,m14,m15,
           mm0,mm1,mm2,mm3,mm4,mm5,mm6,mm7,mm8,mm9,mm10,mm11,mm12,
           mm13,mm14,mm15
           );
fht_unit3 fht_unit3(Clk,Reset,FhtStarThree,
           mm0,mm1,mm2,mm3,mm4,mm5,mm6,mm7,mm8,mm9,mm10,mm11,mm12,
           mm13,mm14,mm15,
           mmm0,mmm1,mmm2,mmm3,mmm4,mmm5,mmm6,mmm7,mmm8,mmm9,mmm10,mmm11,mmm12,
           mmm13,mmm14,mmm15
           );
fht_unit4 fht_unit4(Clk,Reset,FhtStarFour,
           mmm0,mmm1,mmm2,mmm3,mmm4,mmm5,mmm6,mmm7,mmm8,mmm9,mmm10,mmm11,mmm12,
           mmm13,mmm14,mmm15,
           Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,
           Out13,Out14,Out15
           );

endmodule
