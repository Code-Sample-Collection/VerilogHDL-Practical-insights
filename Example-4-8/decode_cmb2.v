module decode_cmb2 (addr, CS, cs1, cs2, cs3, cs4);

input  [7:0]      addr; // only the 2 MSB bits used
input             CS;  // Low effect
output cs1, cs2, cs3, cs4; // Low effect
wire    cs1, cs2, cs3, cs4;


parameter chip1_decode = 2'b00,
          chip2_decode = 2'b01,
          chip3_decode = 2'b10,
          chip4_decode = 2'b11;

assign cs1 = (!CS && (addr[7:6] == chip1_decode))? 0 : 1 ;  
assign cs2 = (!CS && (addr[7:6] == chip2_decode))? 0 : 1 ;  
assign cs3 = (!CS && (addr[7:6] == chip3_decode))? 0 : 1 ;  
assign cs4 = (!CS && (addr[7:6] == chip4_decode))? 0 : 1 ;  
        

endmodule