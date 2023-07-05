// decode circuit, combination logic

module decode (CS_, OE_, WR_, Addr, my_wr, my_rd, CS_reg1, CS_reg2, CS_reg3);

input        CS_, OE_, WR_;
input  [7:0] Addr;

output       my_wr, my_rd;
output       CS_reg1, CS_reg2, CS_reg3;

reg          CS_reg1, CS_reg2, CS_reg3;

assign my_wr = (!WR_) && (!CS_) && (!OE_);
assign my_rd = (WR_)  && (!CS_) && (!OE_);

always @ (Addr or CS_)
  if (!CS_)
     begin
       case (Addr)
          8'b 11110000: CS_reg1 <= 1'b1;
          8'b 00001111: CS_reg2 <= 1'b1;
          8'b 10100010: CS_reg3 <= 1'b1;
          default:     begin     
                           CS_reg1 <= 1'b0;   
                           CS_reg2 <= 1'b0;  
                           CS_reg3 <= 1'b0;                   
                       end
       endcase
     end

               
endmodule
