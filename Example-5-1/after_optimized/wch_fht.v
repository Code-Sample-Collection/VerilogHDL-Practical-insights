module wch_fht(Clk,Reset,
           PreFhtStar,
           In0,In1,In2,In3,In4,In5,In6,In7,
           In8,In9,In10,In11,In12,In13,In14,In15,
           Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,
           Out9,Out10,Out11,Out12,Out13,Out14,Out15
           );
input Clk;
input Reset;
input PreFhtStar;
input [11:0] In0,In1,In2,In3,In4,In5,In6,In7;
input [11:0] In8,In9,In10,In11,In12,In13,In14,In15;
output [15:0] Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7;
output [15:0] Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15;

reg [15:0] Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7;
reg [15:0] Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15;
wire [15:0] Temp0,Temp1,Temp2,Temp3,Temp4,Temp5,Temp6,Temp7;
wire [15:0] Temp8,Temp9,Temp10,Temp11,Temp12,Temp13,Temp14,Temp15;
reg [2:0] Cnt3;//count from 0 to 4,when Reset Cnt3=7;
reg FhtEn;//Enable fht culculate

always @(posedge Clk or negedge Reset)
begin 
   if (!Reset)
      Cnt3<= #1 3'b111;  
 
   else
   begin
       if(PreFhtStar)
       Cnt3<= #1 3'b100;
       else 
       Cnt3<= #1 Cnt3-1;
   end
end

always @(posedge Clk or negedge Reset)
if (!Reset)
   FhtEn<= #1 0;
else
begin
     if (PreFhtStar)
     FhtEn<= #1 1;
     if  (Cnt3==1)
     FhtEn<= #1 0;
end
       

      
        assign Temp0=(Cnt3==4)?{In0[11],In0[11],In0[11],In0[11],In0}:Out0;
        assign Temp1=(Cnt3==4)?{In1[11],In1[11],In1[11],In1[11],In1}:Out1;
        assign Temp2=(Cnt3==4)?{In2[11],In2[11],In2[11],In2[11],In2}:Out2;
        assign Temp3=(Cnt3==4)?{In3[11],In3[11],In3[11],In3[11],In3}:Out3;
        assign Temp4=(Cnt3==4)?{In4[11],In4[11],In4[11],In4[11],In4}:Out4;
        assign Temp5=(Cnt3==4)?{In5[11],In5[11],In5[11],In5[11],In5}:Out5;
        assign Temp6=(Cnt3==4)?{In6[11],In6[11],In6[11],In6[11],In6}:Out6;
        assign Temp7=(Cnt3==4)?{In7[11],In7[11],In7[11],In7[11],In7}:Out7;
        assign Temp8=(Cnt3==4)?{In8[11],In8[11],In8[11],In8[11],In8}:Out8;
        assign Temp9=(Cnt3==4)?{In9[11],In9[11],In9[11],In9[11],In9}:Out9;
        assign Temp10=(Cnt3==4)?{In10[11],In10[11],In10[11],In10[11],In10}:Out10;
        assign Temp11=(Cnt3==4)?{In11[11],In11[11],In11[11],In11[11],In11}:Out11;
        assign Temp12=(Cnt3==4)?{In12[11],In12[11],In12[11],In12[11],In12}:Out12;
        assign Temp13=(Cnt3==4)?{In13[11],In13[11],In13[11],In13[11],In13}:Out13;
        assign Temp14=(Cnt3==4)?{In14[11],In14[11],In14[11],In14[11],In14}:Out14;
        assign Temp15=(Cnt3==4)?{In15[11],In15[11],In15[11],In15[11],In15}:Out15;


always @(posedge Clk or negedge Reset)
begin
if (!Reset)
begin

    Out0<=0;Out1<=0;Out2<=0;Out3<=0;Out4<=0;Out5<=0;Out6<=0;Out7<=0;
    Out8<=0;Out9<=0;Out10<=0;Out11<=0;Out12<=0;Out13<=0;Out14<=0;Out15<=0;
end
else
begin
  if ((Cnt3<=4) && Cnt3>=0 && FhtEn)
    begin
    Out0[15:0]<= #1 Temp0[15:0]+Temp8[15:0];
    Out1[15:0]<= #1 Temp0[15:0]-Temp8[15:0];
    Out2[15:0]<= #1 Temp1[15:0]+Temp9[15:0];
    Out3[15:0]<= #1 Temp1[15:0]-Temp9[15:0];
    Out4[15:0]<= #1 Temp2[15:0]+Temp10[15:0];
    Out5[15:0]<= #1 Temp2[15:0]-Temp10[15:0];
    Out6[15:0]<= #1 Temp3[15:0]+Temp11[15:0];
    Out7[15:0]<= #1 Temp3[15:0]-Temp11[15:0];
    Out8[15:0]<= #1 Temp4[15:0]+Temp12[15:0];
    Out9[15:0]<= #1 Temp4[15:0]-Temp12[15:0];
    Out10[15:0]<= #1 Temp5[15:0]+Temp13[15:0];
    Out11[15:0]<= #1 Temp5[15:0]-Temp13[15:0];
    Out12[15:0]<= #1 Temp6[15:0]+Temp14[15:0];
    Out13[15:0]<= #1 Temp6[15:0]-Temp14[15:0];
    Out14[15:0]<= #1 Temp7[15:0]+Temp15[15:0];
    Out15[15:0]<= #1 Temp7[15:0]-Temp15[15:0];
    end
    
end    
end
endmodule