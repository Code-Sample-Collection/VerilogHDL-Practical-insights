// - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//            Verilog Design & Verification
//            EDA Pioneer
// - - - - - - - - - - - - - - - - - - - - - - - - - - - -
`timescale 1ns/100ps
module STM(
    Clock ,
    Mpi_enb,
    Rw,
    Data_in,
    Data_out,
    Addr_in
    );
input    Clock ;
input    Mpi_enb;
input    Rw;
input [7:0]   Data_in;
output [7:0]   Data_out;
input [5:0]   Addr_in ;

wire Ram_enb;
wire [7:0] Data_from_ram;
assign Ram_enb =  Mpi_enb & (~Addr_in[5]);//0,00000~0,11111
SPRAM	u_SPRAM (
	.address ( Addr_in[4:0] ),
	.clken   ( Ram_enb ),
	.clock   ( Clock ),
	.data    ( Data_in ),
	.wren    ( ~Rw ),
	.q       ( Data_from_ram )
	);    

reg [7:0] MyRegister [0:15] ;  //1,00000~1,01111
always @( posedge Clock )
begin
    if ( Mpi_enb & Addr_in[5] & (~Rw) )
        MyRegister[Addr_in[3:0]] <= Data_in;
end

assign Data_out = (Addr_in[5])? MyRegister[Addr_in[3:0]] : Data_from_ram ;
    
endmodule