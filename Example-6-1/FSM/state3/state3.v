//3-paragraph method to describe FSM
//Describe sequential state transition in the 1st sequential always block
//State transition conditions in the 2nd combinational always block
//Describe the FSM out in the 3rd sequential always block
//Westor, Dec. 2006
//Verilog Usage Book
module state3 ( nrst,clk,
                i1,i2,
                o1,o2,
                err
               );
         
input          nrst,clk;
input          i1,i2;
output         o1,o2,err;
reg            o1,o2,err;


reg    [2:0]   NS,CS;

parameter [2:0]      //one hot with zero idle
      IDLE   = 3'b000,
      S1     = 3'b001,
      S2     = 3'b010,
      ERROR  = 3'b100;

//1st always block, sequential state transition
always @ (posedge clk or negedge nrst)
      if (!nrst)            
         CS <= IDLE;        
      else                  
         CS <=NS;           

//2nd always block, combinational condition judgment
always @ (nrst or CS or i1 or i2)
          begin
               NS = 3'bx;
               case (CS)
                    IDLE:     begin
                                   if (~i1)           NS = IDLE;
                                   if (i1 && i2)      NS = S1;
                                   if (i1 && ~i2)     NS = ERROR;
                              end
                    S1:       begin
                                   if (~i2)           NS = S1;
                                   if (i2 && i1)      NS = S2;
                                   if (i2 && (~i1))   NS = ERROR;
                              end
                    S2:       begin
                                   if (i2)            NS = S2;
			           if (~i2 && i1)     NS = IDLE;
                                   if (~i2 && (~i1))  NS = ERROR;
                              end
                    ERROR:    begin
                                   if (i1)            NS = ERROR;
                                   if (~i1)           NS = IDLE;
                              end
               endcase
         end


//3rd always block, the sequential FSM output
always @ (posedge clk or negedge nrst)
 if (!nrst)
      {o1,o2,err} <= 3'b000;
 else
    begin
       {o1,o2,err} <=  3'b000;
       case (NS)
           IDLE:  {o1,o2,err}<=3'b000;

           S1:    {o1,o2,err}<=3'b100;
           S2:    {o1,o2,err}<=3'b010;
           ERROR: {o1,o2,err}<=3'b111;
       endcase
    end

endmodule

