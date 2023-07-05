//2-paragraph method to describe FSM
//Describe sequential state transition in 1 sequential always block
//State transition conditions in the other combinational always block
//Package state output by task. Then register the output
//Westor, Dec. 2006
//Verilog Usage Book
module state2 ( nrst,clk,
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

//sequential state transition
always @ (posedge clk or negedge nrst)
      if (!nrst)            
         CS <= IDLE;        
      else                  
         CS <=NS;           

//combinational condition judgment
always @ (nrst or CS or i1 or i2)
          begin
               NS = 3'bx;
               ERROR_out;
               case (CS)
                    IDLE:     begin
                                   IDLE_out;
                                   if (~i1)           NS = IDLE;
                                   if (i1 && i2)      NS = S1;
                                   if (i1 && ~i2)     NS = ERROR;
                              end
                    S1:       begin
                                   S1_out;
                                   if (~i2)           NS = S1;
                                   if (i2 && i1)      NS = S2;
                                   if (i2 && (~i1))   NS = ERROR;
                              end
                    S2:       begin
                                   S2_out;
                                   if (i2)            NS = S2;
			           if (~i2 && i1)     NS = IDLE;
                                   if (~i2 && (~i1))  NS = ERROR;
                              end
                    ERROR:    begin
                                   ERROR_out;
                                   if (i1)            NS = ERROR;
                                   if (~i1)           NS = IDLE;
                              end
               endcase
         end


//output task
task IDLE_out;
     {o1,o2,err} = 3'b000;
endtask

task S1_out;
     {o1,o2,err} = 3'b100;
endtask

task S2_out;
     {o1,o2,err} = 3'b010;
endtask

task ERROR_out;
     {o1,o2,err} = 3'b111;
endtask

endmodule

