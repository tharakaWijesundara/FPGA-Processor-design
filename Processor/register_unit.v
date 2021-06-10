module register_unit(
    input clk,
    input [5:0] iram_out,
    input [5:0] counter_out,
    input LDIR,
    output [5:0] counter_in,
    input [15:0] C_Bus_data_in,
    input PC_INC,
    input [9:0] C_bus_ctrl_sig,



);

instructionReg IR(.clk(clk), .LDIR(LDIR), .iram_in(iram_out), .counter_in(counter_out), .data_out(counter_in));
registor_with_inc PC(.clk(clk), .data_in(C_Bus_data_in), .inc(PC_INC), .WE(C_bus_ctrl_sig[]));

    
endmodule