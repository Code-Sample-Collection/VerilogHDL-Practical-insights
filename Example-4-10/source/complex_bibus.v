module complex_bibus (clk, rst, sel1, sel2, sel3, data_bus, addr);
input       clk, rst;
input       sel1, sel2, sel3;
input [7:0] addr;
inout [7:0] data_bus;

wire [7:0] data_in;
reg  [7:0] data_out; //use reg type, but not registers
wire [7:0] decode_out;
wire [7:0] cnt_out;

assign data_in = data_bus;


decode decode_inst (.clock (clk),
                    .reset (rst),
                    .data_bus_in (data_in),
                    .addr_bus (addr),
                    .data_bus_out (decode_out)
                    );
                    
counter counter_inst (.clock (clk),
                    .reset (rst),
                    .data_bus_in (data_in),
                    .cnt_out (cnt_out)
                    );
                    
always @ (decode_out or cnt_out or sel1 or sel2 or sel3)
    begin
       case ({sel1, sel2, sel3})
         3'b100:  data_out = decode_out;
         3'b010:  data_out = cnt_out;
         3'b001:  data_out = 8'b11111111;
         default: data_out = 8'bZZZZZZZZ;         
       endcase
    
    end

                    
assign data_bus = data_out;                    
                    
                    
                    
endmodule
