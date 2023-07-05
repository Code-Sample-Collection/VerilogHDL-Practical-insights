module ram_basic (clk, CS, WR, addr, data_in, data_out, en);
 input         clk;
 input         CS;  //CS = 1, RAM enable
 input         WR;  //WR =1 then WRite enable; WR = 0 then read enable
 input         en;  //data_out enable, convert the data sequency
 input  [5:0]  addr;
 input  [7:0]  data_in;
 output [7:0]  data_out;

 reg [7:0] RAM8x64 [0:63];
 reg [7:0] mem_data;
 
     always @ (posedge clk)
         if (WR && CS) //WRite
            RAM8x64 [addr] <= data_in [7:0];
         else if (~WR && CS ) // read
            mem_data <= RAM8x64 [addr]; 
         
  assign data_out = (en)? mem_data[7:0] : {~mem_data[7], mem_data[6:0]};
         


endmodule