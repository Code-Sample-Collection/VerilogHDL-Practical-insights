module top (rst, CS_, OE_, WR_, Addr, data_bus);

input       rst;
input        CS_, OE_, WR_;
input [7:0] Addr;
inout [7:0] data_bus;

wire [7:0] data_in;
wire [7:0] data_out;
wire       my_wr, my_rd;
wire       CS_reg1, CS_reg2, CS_reg3; // the register selection
wire [7:0] reg1, reg2, reg3;          // the register to be read and written

assign data_in = data_bus;

decode decode_u1  (.CS_(CS_), 
                   .OE_(OE_), 
                   .WR_(WR_), 
                   .Addr(Addr), 
                   .my_wr(my_wr), 
                   .my_rd(my_rd), 
                   .CS_reg1(CS_reg1), 
                   .CS_reg2(CS_reg2), 
                   .CS_reg3(CS_reg3)
                   );

write_reg write_reg_u1 (  
                         .rst(rst),
                         .data_in(data_in),  
                         .my_wr(my_wr), 
                         .CS_reg1(CS_reg1), 
                         .CS_reg2(CS_reg2), 
                         .CS_reg3(CS_reg3), 
                         .reg1(reg1), 
                         .reg2(reg2), 
                         .reg3(reg3)
                         );

read_reg read_reg_u1  (  
                         .rst(rst),
                         .data_out(data_out),  
                         .my_rd(my_rd), 
                         .CS_reg1(CS_reg1), 
                         .CS_reg2(CS_reg2), 
                         .CS_reg3(CS_reg3), 
                         .reg1(reg1), 
                         .reg2(reg2), 
                         .reg3(reg3)
                         );


                   
assign data_bus = ((!CS_) && (!OE_))? data_out : 8'bZZZZZZZZ;                    
                    
                    
                    
endmodule
