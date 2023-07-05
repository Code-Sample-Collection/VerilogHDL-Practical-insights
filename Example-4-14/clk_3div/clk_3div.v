module clk_3div (clk,reset,clk_out);

  input clk, reset;
  output clk_out;
  reg[1:0] state;
  reg clk1;
    always @(posedge clk or negedge reset)
      if(!reset)
         state<=2'b00;
      else
        case(state)
          2'b00:state<=2'b01;
          2'b01:state<=2'b11;
          2'b11:state<=2'b00;
          default:state<=2'b00;
        endcase
        
  always @(negedge clk or negedge reset)
      if(!reset)
         clk1<=1'b0;
      else
         clk1<=state[0];
         
  assign clk_out=state[0]&clk1;
endmodule 
