// - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//            Verilog Design & Verification
//            EDA Pioneer
// - - - - - - - - - - - - - - - - - - - - - - - - - - - -

`timescale 1ns/100ps
module MPI( 
    Clock , 
    Rst_n ,
    // uP interface
    Mpi_data ,
    Mpi_addr ,         
    Mpi_cs_n , //Chip Select
    Mpi_rw  // 1:read; 0:write
    // to/from Storage Part
    ) ;

// clock and reset
input            Clock ;
input            Rst_n ;
inout  [7:0]     Mpi_data ;
input  [5:0]     Mpi_addr ;      
input            Mpi_cs_n ; //Chip Select
input            Mpi_rw ; // 1:read; 0:write

reg              Cs_sample_sync ;
reg              Cs_sample ;
reg              Cs_sample_pipe ;
wire             Mpi_enb ;//

wire             Dataout_enb;
wire [7:0]       Data_in;
wire [7:0]       Data_out;

// gen cs enb 
always @(posedge Clock or negedge Rst_n)
begin
    if (~Rst_n) begin
        Cs_sample_sync <= 1'b1 ; 
        Cs_sample_pipe <= 1'b1 ;
        Cs_sample <= 1'b1 ;
    end
    else begin
        Cs_sample_sync <= Mpi_cs_n ; 
        Cs_sample      <= Cs_sample_sync ;
        Cs_sample_pipe <= Cs_sample ;
    end
end
assign           Mpi_enb = (~Cs_sample) & Cs_sample_pipe ;

//data gen
assign    #6     Dataout_enb = (~Mpi_cs_n) & Mpi_rw ;
assign           Mpi_data =  (Dataout_enb == 1'b1) ? Data_out : 8'bz ;
assign           Data_in = Mpi_data ;   

//Storage Part Module, including 
STM u_STM (
    .Clock    (Clock),
    .Mpi_enb  (Mpi_enb),
    .Rw       (Mpi_rw),
    .Data_in  (Data_in),
    .Data_out (Data_out),
    .Addr_in  (Mpi_addr)
    );

endmodule