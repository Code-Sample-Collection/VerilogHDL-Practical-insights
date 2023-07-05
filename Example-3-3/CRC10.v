module CRC10 (Clock, Data_In, CRC_En, CRC_Clr, CRC_Out);
input Clock;
input CRC_En;
input CRC_Clr;
output [9:0] CRC_Out;
//reg [9:0] CRC_Out;
input [31:0] Data_In;

reg CRC_En_reg;
reg CRC_Clr_reg;
reg [31:0] Data_In_reg;

always @ (posedge Clock)
begin
CRC_En_reg = CRC_En ;
CRC_Clr_reg = CRC_Clr ;
Data_In_reg = Data_In ;
end

reg crcfb;
reg [9:0] CRC_Reg;
integer i;

assign CRC_Out = CRC_Reg;

always @ (posedge Clock)
begin
    if (CRC_Clr_reg)
        CRC_Reg <= 0;
    else if (CRC_En_reg) 
	begin
        for (i=31;i>=0;i=i-1)
		begin
                   crcfb     <=CRC_Reg[9];
	     	       CRC_Reg[9]<=CRC_Reg[8]^crcfb;
	     	       CRC_Reg[8]<=CRC_Reg[7];
	     	       CRC_Reg[7]<=CRC_Reg[6];
	     	       CRC_Reg[6]<=CRC_Reg[5];
	     	       CRC_Reg[5]<=CRC_Reg[4]^crcfb;
	     	       CRC_Reg[4]<=CRC_Reg[3]^crcfb;
	     	       CRC_Reg[3]<=CRC_Reg[2];
	     	       CRC_Reg[2]<=CRC_Reg[1];
	     	       CRC_Reg[1]<=CRC_Reg[0]^crcfb;
	     	       CRC_Reg[0]<=Data_In_reg[i]^crcfb;
		end
	end
end
endmodule
