module reg_counter (clock, reset_, cnt_reg_s, cnt_reg_a);

input        clock;
input        reset_;
output [3:0] cnt_reg_s;
output [3:0] cnt_reg_a;

reg [3:0] cnt_reg_s;  //asynchronous reset
always @ (posedge clock or negedge reset_)
   if (!reset_)
      cnt_reg_s <= 4'b0000;
   else
     begin
       cnt_reg_s [2:0] <= cnt_reg_s [2:0] + 1;
       cnt_reg_s [3]   <= ~cnt_reg_s [3];
     end

reg [3:0] cnt_reg_a;  //synchronous reset
always @ (posedge clock)
   if (!reset_)
      cnt_reg_a <= 4'b0000;
   else
     begin
       cnt_reg_a [2:0] <= cnt_reg_a [2:0] + 1;
       cnt_reg_a [3]   <= ~cnt_reg_a [3];
     end


endmodule