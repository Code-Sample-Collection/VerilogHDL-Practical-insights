`timescale 1ns/100ps 
module decode_cmb_tb;

reg  [7:0]      addr; // only the 2 MSB bits used
reg             CS;  // Low effect
wire cs1a, cs2a, cs3a, cs4a; // Low effect
wire cs1b, cs2b, cs3b, cs4b; // Low effect

   initial
      begin
        CS   = 1;
        addr = 0;
        # 100;
        CS   = 0;
        addr = 8'b00xxxxxx;
        # 100;
        CS   = 0;
        addr = 8'b10xxxxxx;
        # 100;
        CS   = 0;
        addr = 8'b11xxxxxx;     
        # 100;
        CS   = 0;
        addr = 8'b01xxxxxx;  
        # 100;
        CS   = 1;
        $stop;
      end




decode_cmb decode_cmb_inst   (.addr(addr), .CS(CS), 
                              .cs1(cs1a), .cs2(cs2a), .cs3(cs3a), .cs4(cs4a)
                              );

decode_cmb2 decode_cmb2_inst (.addr(addr), .CS(CS), 
                              .cs1(cs1b), .cs2(cs2b), .cs3(cs3b), .cs4(cs4b)
                              );

endmodule