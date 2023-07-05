module latch (cond_1, data_in, data_out);

input cond_1;
input data_in;
output data_out;

reg data_out;

always @(cond_1 or data_in)
  begin
    if (cond_1)
        data_out <= data_in;
  end

endmodule