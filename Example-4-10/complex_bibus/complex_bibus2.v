module complex_bibus (clk, rst, sel1, sel2, sel3, data_bus, addr);
input       clk, rst;
input       sel1, sel2, sel3;
input [7:0] addr;
inout [7:0] data_bus;

wire [7:0] data_in;
//wire [7:0] data_out; //use wire type
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
                    
                    
assign data_bus = (sel1)? decode_out : ((sel2)? cnt_out : ((sel3)? 8'b11111111: 8'bZZZZZZZZ));                    
                    
                    
                    
endmodule
