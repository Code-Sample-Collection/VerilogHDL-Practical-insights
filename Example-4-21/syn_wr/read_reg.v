// synchronous write by cpu clock, use my_wr as condition
module read_reg (clk, rst, data_out,  my_rd, CS_reg1, CS_reg2, CS_reg3, reg1, reg2, reg3);

input        clk, rst, my_rd, CS_reg1, CS_reg2, CS_reg3;
input  [7:0] reg1, reg2, reg3;
output [7:0] data_out;
reg    [7:0] data_out;

  always @ (posedge clk or negedge rst)
      if (!rst)
         data_out <= 8'b0;
      else
         begin
            if (my_rd)
                begin
                     if (CS_reg1)
                         data_out <= reg1;
                     else if (CS_reg2)
                         data_out <= reg2;
                     else if (CS_reg3)
                         data_out <= reg3;
                end
            else
                data_out <= 8'b0;              
         
         end
         
  

endmodule