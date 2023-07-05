module asyn_rst (clk, rst_, cnt1, cnt2);

input        clk;
input        rst_;
output [4:0] cnt1 , cnt2;
reg    [4:0] cnt1 , cnt2;


always @ (posedge clk or negedge rst_)
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