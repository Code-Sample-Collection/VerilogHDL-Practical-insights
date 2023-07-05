// - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//            Verilog HDL Design & Verification
//            EDA Pioneer
// - - - - - - - - - - - - - - - - - - - - - - - - - - - -
`timescale 1ns/100ps
module harness ;

// Clock Stimulus generation
parameter FAST_PERIOD = 10 ;
reg Clock ;
initial
begin
Clock = 0;
 forever begin
         # (FAST_PERIOD/2) Clock = ~ Clock ;
     end
end

// Reset Stimulus generation
reg Rst_n ;
initial
begin
Rst_n = 1;
# FAST_PERIOD Rst_n = 0;
# (5*FAST_PERIOD) Rst_n = 1;
end

tri  [7:0] Mpi_data;
wire [5:0] Mpi_addr ;
wire       Mpi_cs_n;
wire       Mpi_rw;

// MPI Bus Functional Module
uP_BFM inst_BFM (
    .uP_data    (Mpi_data),
    .uP_addr    (Mpi_addr),
    .uP_cs_n    (Mpi_cs_n),
    .uP_rw      (Mpi_rw)
    );

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