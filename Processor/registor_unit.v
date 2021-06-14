module registor_unit(
    input clk,
    input LDIR,
    input PC_INC,
    input AC_INC,
    input RA_INC,
    input RB_INC,
    input RC_INC,
    input [15:0] ram_out,
    input [15:0] ram_in,
    input [5:0] counter_out,
    input [9:0] C_bus_ctrl_sig,
    input [15:0] c_bus_in,
    input [3:0] select;
    output reg [5:0] counter_in,
    output reg [15:0] AC_out,
    output reg [15:0] MUX_out,

);

reg [15:0] DR_out;
reg [15:0] R1_out;
reg [15:0] R2_out;
reg [15:0] R3_out;
reg [15:0] RA_out;
reg [15:0] RB_out;
reg [15:0] RC_out;
reg [15:0] AC_out;

instructionReg IR(.clk(clk), .LDIR(LDIR), .DR_in(DR_out), .counter_in(counter_out), .data_out(counter_in));
registor_with_inc PC(.clk(clk), .c_bus_in(c_bus_in), .inc(PC_INC), .WE(C_bus_ctrl_sig[9]), .data_out(PC_out));
registor_with_inc AC(.clk(clk), .c_bus_in(c_bus_in), .inc(AC_INC), .WE(C_bus_ctrl_sig[0]), .data_out(AC_out));
registor_with_inc RA(.clk(clk), .c_bus_in(c_bus_in), .inc(RA_INC), .WE(C_bus_ctrl_sig[8]), .data_out(RA_out));
registor_with_inc RB(.clk(clk), .c_bus_in(c_bus_in), .inc(RB_INC), .WE(C_bus_ctrl_sig[7]), .data_out(RB_out));
registor_with_inc RC(.clk(clk), .c_bus_in(c_bus_in), .inc(RC_INC), .WE(C_bus_ctrl_sig[6]), .data_out(RC_out));
registor_no_inc R1(.clk(clk), .c_bus_in(c_bus_in), .WE(C_bus_ctrl_sig[5]), .data_out(R1_out));
registor_no_inc R2(.clk(clk), .c_bus_in(c_bus_in), .WE(C_bus_ctrl_sig[4]), .data_out(R2_out));
registor_no_inc R3(.clk(clk), .c_bus_in(c_bus_in), .WE(C_bus_ctrl_sig[3]), .data_out(R3_out));
data_register DR(.clk(clk), .c_bus_in(c_bus_in), .ram_in(ram_out), .WE(C_bus_ctrl_sig[2]), .read(read), .data_out(DR_out));
registor_no_inc AR(.clk(clk), .c_bus_in(c_bus_in), .WE(C_bus_ctrl_sig[1]), .data_out(ram_in));

mux MUX(.select(select), 
        .DR(DR_out), 
        .R1(R1_out), 
        .R2(R2_out), 
        .R3(R3_out), 
        .RA(RA_out), 
        .RB(RB_out), 
        .RC(RC_out), 
        .AC(AC_out), 
        .PC(PC_out)
        .data_out(MUX_out));

  
endmodule