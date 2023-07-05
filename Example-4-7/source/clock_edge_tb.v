module clock_edge_tb ( );

reg        clk_50M_temp, clk_100M, rst_;
wire       clk_50M;
wire [3:0] cnt1, cnt2;

   initial
      begin
        clk_50M_temp = 0;
        clk_100M = 0;
        rst_ = 0;
        # 100 ;
        rst_ = 1;
        # 1000 ;
        $stop;    
      end
clock_edge clock_edge_inst (.clk_50M(clk_50M), 
                            .clk_100M(clk_100M), 
                            .rst_(rst_), 
                            .cnt1(cnt1), 
                            .cnt2(cnt2)
                            );

  always # 10 clk_50M_temp = ~clk_50M_temp;
  assign # 5 clk_50M =  clk_50M_temp;
  always # 5 clk_100M = ~clk_100M;

endmodule