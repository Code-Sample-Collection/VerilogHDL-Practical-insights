module decode (clock, reset, data_bus_in, addr_bus, data_bus_out);

input       clock, reset;
input  [7:0] data_bus_in;
input  [7:0] addr_bus;

output [7:0] data_bus_out;

reg    [7:0] data_bus_out;

always @ (posedge clock or posedge reset)
      if (reset)
         data_bus_out <= 8'b00000000;
      else
         case (addr_bus)
          8'b 11110000: data_bus_out <= 8'b00001111;
          8'b 00001111: data_bus_out <= 8'b11110000;
          8'b 10100000: data_bus_out <= 8'b11111111;
          default:      data_bus_out <= data_bus_in;
		 endcase
                 
endmodule
