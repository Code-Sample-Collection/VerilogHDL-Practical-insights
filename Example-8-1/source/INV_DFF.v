`timescale 1ns/100ps
module TB ;
reg Ck, Rst_n, Din;
wire Dout;

//Clock generation
initial
begin
    Ck = 0;
    forever 
        Ck = #10 ~ Ck;
end

//Reset generation
initial
begin
    Rst_n = 1;
    #5;
    Rst_n = 0;
    #55;
    Rst_n = 1;
end

//Data Input Generation
initial
begin
    Din = 0;
    #80;
    Din = 1;
    #40;
    Din = 0;
end

INV_DFF u_INV_DFF (
    .Clock   (Ck),
    .Reset_n (Rst_n),
    .DataIn  (Din),
    .DataOut (Dout)
);
endmodule

module INV_DFF (Clock, Reset_n, DataIn, DataOut);
input Clock;
input Reset_n;
input DataIn;
output DataOut;
reg DataOut;
wire DataInv;
always @(posedge Clock or negedge Reset_n)
begin
    if (~Reset_n)
        DataOut <= 1'b0;
    else
        DataOut <= DataInv;  
end
assign #3 DataInv = ~ DataIn ;
endmodule