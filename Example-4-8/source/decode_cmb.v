module decode_cmb (addr, CS, cs1, cs2, cs3, cs4);

input  [7:0]      addr; // only the 2 MSB bits used
input             CS;  // Low effect
output cs1, cs2, cs3, cs4; // Low effect
reg    cs1, cs2, cs3, cs4;


parameter chip1_decode = 2'b00,
          chip2_decode = 2'b01,
          chip3_decode = 2'b10,
          chip4_decode = 2'b11;

    always @ (CS or addr)
       if (CS)
          {cs1, cs2, cs3, cs4} = 4'b 1111;
       else
          begin
             case (addr[7:6])
                chip1_decode: {cs1, cs2, cs3, cs4} = 4'b 0111;
                chip2_decode: {cs1, cs2, cs3, cs4} = 4'b 1011;
                chip3_decode: {cs1, cs2, cs3, cs4} = 4'b 1101;
                chip4_decode: {cs1, cs2, cs3, cs4} = 4'b 1110;
             endcase                       
          end
          
        

endmodule