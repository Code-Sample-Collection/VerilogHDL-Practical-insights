`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:16:29 09/08/2013 
// Design Name: 
// Module Name:    HelloVlog 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

//������module����, �˿��б�
module HelloVlog ( Clock, Reset_n, A_in, B_in, Sel_in, A_xor_out, B_xor_out ); 

//���������������˿�����
input Clock;
input Reset_n;
input [1:0] A_in;
input [1:0] B_in;
input Sel_in;
output A_xor_out;
output B_xor_out;

//�����������ͼĴ�������
wire A_xor_wire;
wire B_xor_wire;
wire [1:0] result;
reg eq0, eq1, eq2, eq3;
reg A_xor_out;
reg B_xor_out;

//��Ϊ����, DFF_A
always @ (posedge Clock or negedge Reset_n)
    if (~Reset_n)
        A_xor_out <= 0;
    else
        A_xor_out <= A_xor_wire;

//��Ϊ����, DFF_B
always @ (posedge Clock or negedge Reset_n)
    if (~Reset_n)
        B_xor_out <= 0;
    else
        B_xor_out <= B_xor_wire;

//����������, XOR_A
assign #1 A_xor_wire = eq0 ^ eq1 ;

//�ṹ������, XOR_B
xor #1 XOR_B ( B_xor_wire, eq2, eq3 );

//����������, MUX2
assign #3 result = (Sel_in) ? B_in : A_in;

//��Ϊ����, DECODE2
always @ ( result )
begin
    case ( result )
    2'b00 : begin 
            {eq3, eq2, eq1, eq0} = #2 4'b0001 ;
            $display ("At time %t - ",$time,"eq0 = 1");
        end
    2'b01 : begin 
            {eq3, eq2, eq1, eq0} = #2 4'b0010 ;
            $display ("At time %t - ",$time,"eq1 = 1");
        end
    2'b10 : begin 
            {eq3, eq2, eq1, eq0} = #2 4'b0100 ;
            $display ("At time %t - ",$time,"eq2 = 1");
        end
    2'b11 : begin 
            {eq3, eq2, eq1, eq0} = #2 4'b1000 ;
            $display ("At time %t - ",$time,"eq3 = 1");
        end
    default : ;    
    endcase
end

//module����
endmodule

