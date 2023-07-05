module asyn_rst_syn_release(clk, rst_, cnt1, cnt2);

input        clk;
input        rst_;
output [4:0] cnt1 , cnt2;
reg    [4:0] cnt1 , cnt2;

// reset release circuit
reg reset_reg;
always @ (posedge clk)
     reset_reg <= rst_;
always @ (posedge clk or negedge reset_reg)
   if (!rst_)
      begin
        cnt1 <= 4'b0;
        cnt2 <= 4'b0;
      end
   else
      begin
        if (cnt1 < 2'b11)
            cnt1 <= cnt1 + 1;
        else
            cnt1 <= cnt1;                
        cnt2 <= cnt1 - 1;      
      end


endmodule