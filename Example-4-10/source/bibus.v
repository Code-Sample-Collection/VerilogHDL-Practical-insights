module bibus (clk, rst, sel, data_bus, addr);
input       clk, rst, sel;
input [7:0] addr;
inout [7:0] data_bus;
wire [7:0] data_in, data_out;

assign data_in = data_bus;
assign data_bus = (sel) ? data_out : 8'bZ;

decode decode_inst (.clock (clk),
                    .reset (rst),
                    .data_bus_in (data_in),
                    .addr_bus (addr),
                    .data_bus_out (data_out)
                    );
endmodule
