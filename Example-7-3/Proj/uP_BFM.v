// - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//            Verilog HDL Design & Verification
//            EDA Pioneer
// - - - - - - - - - - - - - - - - - - - - - - - - - - - -
`timescale 1ns/100ps
module uP_BFM (uP_data,uP_addr,uP_cs_n,uP_rw);
inout  [7:0] uP_data;
output [5:0] uP_addr;
output       uP_cs_n;
output       uP_rw; 
 
reg    [5:0] uP_addr;
reg          uP_cs_n;
reg          uP_rw; 

reg    [7:0] Data_out;
reg          Data_oe;

initial
begin
    Data_out = 0; 
    uP_addr = 0 ;
    uP_rw = 1 ;
    uP_cs_n = 1;
    Data_oe = 0 ;
end

assign uP_data = (Data_oe)? Data_out : 8'bz ;

parameter SLOW_PERIOD = 24 ;

// write task
task Write ; 
input [ 7:0] Wtask_Data ;//data write in
input [ 5:0] Wtask_Addr ;
begin
    uP_rw = 1 ;
    # SLOW_PERIOD;
    Data_out = Wtask_Data; 
    uP_addr  = Wtask_Addr ;
    uP_rw = 0 ;
    # SLOW_PERIOD;
    Data_oe = 1 ;
    # (SLOW_PERIOD/4);
    uP_cs_n = 0 ;
    # ((2*SLOW_PERIOD) + (SLOW_PERIOD/2)) ;
    uP_cs_n = 1 ;
    # (SLOW_PERIOD/4);
    uP_addr = 0 ;
    uP_rw = 1 ;
    Data_oe = 0 ;
    # SLOW_PERIOD;
end
endtask
    
// read task
task Read ; 
output [ 7:0] Rtask_Data ;//data read out
input  [ 5:0] Rtask_Addr ;
begin
    uP_rw = 0 ;
    # SLOW_PERIOD;
    uP_addr = Rtask_Addr ;
    uP_rw = 1 ;
    # SLOW_PERIOD;
    # (SLOW_PERIOD/4);
    uP_cs_n = 0 ;
    # ((2*SLOW_PERIOD) + (SLOW_PERIOD/2)) ;
    uP_cs_n = 1 ;
    Rtask_Data = uP_data;
    # (SLOW_PERIOD/4);
    uP_addr = 0 ;
    uP_rw = 0 ;
    # SLOW_PERIOD;
end
endtask

endmodule
