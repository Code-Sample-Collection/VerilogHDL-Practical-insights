
module counter     ( clock,
                     reset,
                     data_bus_in,
                     cnt_out
                    );


input       clock, reset;
input  [7:0] data_bus_in;

output [7:0] cnt_out;

reg    [7:0] cnt_out;

always @ (posedge clock or posedge reset)
      if (reset)
         cnt_out <= 8'b00000000;
      else
         cnt_out <= data_bus_in + 1;
                 
endmodule
