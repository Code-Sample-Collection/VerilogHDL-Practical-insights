// - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//            Verilog Design & Verification
//            EDA Pioneer
// - - - - - - - - - - - - - - - - - - - - - - - - - - - -
`timescale 1ns/100ps
module NorTestBench ;

//Clock Stimulus generation
parameter FAST_PERIOD = 10 ;
reg Clock ;
initial
begin
Clock = 0;
 forever begin
         # (FAST_PERIOD/2) Clock = ~ Clock ;
     end
end

//Reset Stimulus generation
reg Rst_n ;
initial
begin
Rst_n = 1;
# FAST_PERIOD Rst_n = 0;
# (5*FAST_PERIOD) Rst_n = 1;
end

//Access Timing Stimulus
parameter SLOW_PERIOD = 24 ;
reg [5:0] Mpi_addr ;
reg Mpi_cs_n;
reg Mpi_rw;
reg Mpi_oe;
reg [7:0] Data_out;
reg [7:0] Data_in;
tri [7:0] Mpi_data;

assign Mpi_data = ( Mpi_oe )? Data_out : 8'bz ;

initial 
begin : ACCESS
integer i;
Mpi_addr = 0 ;
Mpi_cs_n = 1 ;
Mpi_rw = 1 ;
Mpi_oe = 0 ;
Data_out = 0 ;
# 222 ;
for ( i=6'b101111; i>= 0; i=i-1 )
    begin
        //write
        # SLOW_PERIOD;
        Data_out = {$random} % 256; //data between 0~255
        Mpi_addr = i ;
        Mpi_rw = 0 ;
        # SLOW_PERIOD;
        Mpi_oe = 1 ;
        # (SLOW_PERIOD/4);
        Mpi_cs_n = 0 ;
        # ((2*SLOW_PERIOD) + (SLOW_PERIOD/2)) ;
        Mpi_cs_n = 1 ;
        
        $display ("Addr: %b -> DataWrite: %d", Mpi_addr, Data_out);
        
        # (SLOW_PERIOD/4);
        Mpi_addr = 0 ;
        Mpi_rw = 1 ;
        Mpi_oe = 0 ;
        
        //bus turnaround from write to read
        # SLOW_PERIOD;
        Mpi_rw = 0 ;

        //read
        # SLOW_PERIOD;
        Mpi_addr = i ;
        Mpi_rw = 1 ;
        # SLOW_PERIOD;
        # (SLOW_PERIOD/4);
        Mpi_cs_n = 0 ;
        # ((2*SLOW_PERIOD) + (SLOW_PERIOD/2)) ;
        Mpi_cs_n = 1 ;
        
        Data_in = Mpi_data; //get datafrom tri-bus
        $display ("Addr: %b -> DataRead: %d", Mpi_addr, Data_in);
        $display ("------------------------");
        
        # (SLOW_PERIOD/4);
        Mpi_addr = 0 ;
        Mpi_rw = 0 ;
        
        //bus turnaround from read to write
        # SLOW_PERIOD;
        Mpi_rw = 1 ;  
    end
$display ("Simulation Stopped!");    
$stop;
end

// Design Module
MPI u_MPI ( 
    .Clock      (Clock), 
    .Rst_n      (Rst_n),
    .Mpi_data   (Mpi_data),
    .Mpi_addr   (Mpi_addr),         
    .Mpi_cs_n   (Mpi_cs_n), 
    .Mpi_rw     (Mpi_rw)
    ) ;

endmodule