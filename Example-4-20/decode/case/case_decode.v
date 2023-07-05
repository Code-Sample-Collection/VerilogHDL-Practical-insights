// Use case statement to build decode circuit without prior

`timescale 1ns/1ps
module case_decode (addr_H, CS1, CS2, CS3, CS4);

input  [2:0] addr_H;
output       CS1, CS2, CS3, CS4;
reg    [3:0] CS_bus;

parameter CHIP1 = 3'b100,
          CHIP2 = 3'b101,
          CHIP3 = 3'b010,
          CHIP4 = 3'b011;

     always @ (addr_H)
              case (addr_H)
                   CHIP1:     CS_bus = 4'b0111;  
                   CHIP2:     CS_bus = 4'b1011;
                   CHIP3:     CS_bus = 4'b1101;
                   CHIP4:     CS_bus = 4'b1110;
                   default:   CS_bus = 4'b1111;
              endcase           
              
assign CS4 = CS_bus [3];
assign CS3 = CS_bus [2];
assign CS2 = CS_bus [1];
assign CS1 = CS_bus [0];

endmodule