//1-paragraph method to decribe FSM
//Describe state transition, state output, state input condition in only 1 always block
//Westor, Dec. 2006
//Verilog Usage Book

module state1 ( nrst,clk,
                i1,i2,
                o1,o2,
                err
               );
             
input          nrst,clk;
input          i1,i2;
output         o1,o2,err;
reg            o1,o2,err;

reg    [2:0]   NS; //NextState

parameter [2:0]      //one hot with zero idle
      IDLE   = 3'b000,
      S1     = 3'b001,
      S2     = 3'b010,
      ERROR  = 3'b100;


//1 always block to describe state transition, state output, state input condition
always @ (posedge clk or negedge nrst)
 if (!nrst)
    begin
       NS         <= IDLE;
      {o1,o2,err} <= 3'b000;
    end
 else
    begin
       NS         <=  3'bx;
      {o1,o2,err} <=  3'b000;
      case (NS)
        IDLE:  begin
                 if (~i1)         begin{o1,o2,err}<=3'b000;NS <= IDLE; end
                 if (i1 && i2)    begin{o1,o2,err}<=3'b100;NS <= S1;   end
                 if (i1 && ~i2)   begin{o1,o2,err}<=3'b111;NS <= ERROR;end
               end
        S1:    begin
                 if (~i2)         begin{o1,o2,err}<=3'b100;NS <= S1;   end
                 if (i2 && i1)    begin{o1,o2,err}<=3'b010;NS <= S2;   end
                 if (i2 && (~i1)) begin{o1,o2,err}<=3'b111;NS <= ERROR;end
               end
        S2:    begin
                 if (i2)          begin{o1,o2,err}<=3'b010;NS <= S2;   end
                 if (~i2 && i1)   begin{o1,o2,err}<=3'b000;NS <= IDLE; end
                 if (~i2 && (~i1))begin{o1,o2,err}<=3'b111;NS <= ERROR;end
               end
        ERROR: begin
                 if (i1)          begin{o1,o2,err}<=3'b111;NS <= ERROR;end
                 if (~i1)         begin{o1,o2,err}<=3'b000;NS <= IDLE; end
               end
      endcase
   end
   
endmodule

