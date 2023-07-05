/************************************************************************/
/*         Fast Hadamard                                                */
/************************************************************************/
//Integer for loop;// Author : fb 
// Last Modi Date   : 2000.6 .9
// In; A/D compensate code
//In data buffer operation
// Clk; 1*chip clock
// Reset; globl Reset;
// Location; the code number 

module fht_unit1(Clk,Reset,FhtStar,
           In0,In1,In2,In3,In4,In5,In6,In7,In8,In9,In10,In11,In12,
           In13,In14,In15,
           Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,
           Out13,Out14,Out15
           );

input Clk;
input Reset;
input FhtStar;
input [11:0] In0,In1,In2,In3,In4,In5,In6,In7,In8,In9;
input [11:0] In10,In11,In12,In13,In14,In15;
output [12:0] Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9;
output [12:0] Out10,Out11,Out12,Out13,Out14,Out15;


/* first Fht */
reg [12:0] Out0,Out1,Out2,Out3,Out4,Out5;
reg [12:0] Out6,Out7,Out8,Out9,Out10,Out11;
reg [12:0] Out12,Out13,Out14,Out15;

wire [11:0] In8Co =~In8+1;
wire [11:0] In9Co =~In9+1;
wire [11:0] In10Co=~In10+1;
wire [11:0] In11Co=~In11+1;
wire [11:0] In12Co=~In12+1;
wire [11:0] In13Co=~In13+1;
wire [11:0] In14Co=~In14+1;
wire [11:0] In15Co=~In15+1;

always @(posedge Clk or negedge Reset)
begin
  if(!Reset)
  begin
    Out0<=0;Out1<=0;Out2<=0;Out3<=0;Out4<=0;Out5<=0;Out6<=0;Out7<=0;
    Out8<=0;Out9<=0;Out10<=0;Out11<=0;Out12<=0;Out13<=0;Out14<=0;Out15<=0;
  end
  else
  begin
    if(FhtStar)
    begin
    Out0<={In0[11],In0 }+{In8[11],In8 };
    Out1<={In0[11],In0 }+{In8Co[11],In8Co };
    Out2<={In1[11],In1 }+{In9[11],In9 };
    Out3<={In1[11],In1 }+{In9Co[11],In9Co };
    Out4<={In2[11],In2 }+{In10[11],In10 };
    Out5<={In2[11],In2 }+{In10Co[11],In10Co };
    Out6<={In3[11],In3 }+{In11[11],In11 };
    Out7<={In3[11],In3 }+{In11Co[11],In11Co };
    Out8<={In4[11],In4 }+{In12[11],In12 };
    Out9<={In4[11],In4 }+{In12Co[11],In12Co };
    Out10<={In5[11],In5 }+{In13[11],In13 };
    Out11<={In5[11],In5 }+{In13Co[11],In13Co };
    Out12<={In6[11],In6 }+{In14[11],In14 };
    Out13<={In6[11],In6 }+{In14Co[11],In14Co };
    Out14<={In7[11],In7 }+{In15[11],In15 };
    Out15<={In7[11],In7 }+{In15Co[11],In15Co };
    end
  end
end

endmodule
