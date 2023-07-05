// synchronous write by cpu clock, use my_wr as condition
module write_reg (rst, data_in,  my_wr, CS_reg1, CS_reg2, CS_reg3, reg1, reg2, reg3);

input        rst, my_wr, CS_reg1, CS_reg2, CS_reg3;
input  [7:0] data_in;
output [7:0] reg1, reg2, reg3;
reg    [7:0] reg1, reg2, reg3;

  always @ (my_wr or data_in or CS_reg1 or CS_reg2 or CS_reg3)
         begin
            if (my_wr)
                begin
                     if (CS_reg1)
                         reg1 <= data_in;
                     else if (CS_reg2)
                         reg2 <= data_in;
                     else if (CS_reg3)
                         reg3 <= data_in;
                end
            else
                begin
                     reg1 <= reg1;
                     reg2 <= reg2;
                     reg3 <= reg3;
                end                
         
         end

endmodule