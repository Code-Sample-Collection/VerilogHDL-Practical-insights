// - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//            Verilog Design & Verification
//            EDA Pioneer
// - - - - - - - - - - - - - - - - - - - - - - - - - - - -
`timescale 1ns/100ps
module testcase ;

harness inst_harness ();

reg    [7:0] Data_out;
reg    [7:0] Data_in;

reg    [7:0] DataSource [0:47];
integer      Write_Out_File;

initial 
begin: MYCASE
    integer i;
    # 222 ;
    // testcase 1:
    for ( i=6'b101111; i>= 0; i=i-1 )
        begin
            Data_out = {$random} % 256; //data between 0~255
            inst_harness.inst_BFM.Write(Data_out, i);
            $display ("case1, Addr: %h -> DataWrite: %h", i, Data_out);
            inst_harness.inst_BFM.Read(Data_in, i);
            $display ("case1, Addr: %h -> DataRead: %h", i, Data_in);
            $display ("------------------------");
        end
    
    $readmemh ( "Read_In_File.txt", DataSource ); 
    Write_Out_File = $fopen("Write_Out_File.txt");
    // testcase 2
    for ( i=6'b101111; i>= 0; i=i-1 )
        begin
            Data_out = DataSource[i] ;
            inst_harness.inst_BFM.Write(Data_out, i);
            $display ("case2, Addr: %h -> DataWrite: %h", i, Data_out);
            inst_harness.inst_BFM.Read(Data_in, i);
            $display ("case2, Addr: %h -> DataRead: %h", i, Data_in);
            $display ("------------------------");
            $fdisplay (Write_Out_File, "@%h\n%h", i, Data_in);
        end
    $fclose ( Write_Out_File );
    $display ("Simulation Finished!");    
    $stop;
end

endmodule