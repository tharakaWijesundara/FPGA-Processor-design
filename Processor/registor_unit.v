module registor_unit
#(
    parameter ADDRESS_LEN = 8,
    parameter INSTRUCTION_LEN = 6,
    parameter C_BUS_SIG_LEN = 11,
    parameter DATA_LEN = 16,
    parameter MUX_SEL_SIG = 4
)
(
    input clk,
    input reset,
    input LDIR,
    input PC_INC,
    input AC_INC,
    input RA_INC,
    input RB_INC,
    input RC_INC,
    input read,
    input [DATA_LEN - 1:0] ram_out,
    input [INSTRUCTION_LEN - 1:0] counter_out,
    input [C_BUS_SIG_LEN - 1:0] C_bus_ctrl_sig,
    input [DATA_LEN - 1:0] c_bus_in,
    input [MUX_SEL_SIG - 1:0] select,
    output [DATA_LEN - 1:0] ram_in,
    output [ADDRESS_LEN - 1:0] ram_addr,
    output [INSTRUCTION_LEN - 1:0] counter_in,
    output [DATA_LEN - 1:0] AC_out,
    output [DATA_LEN - 1:0] MUX_out
);

wire [DATA_LEN - 1:0] PC_out;
wire [DATA_LEN - 1:0] DR_out;
wire [DATA_LEN - 1:0] R1_out;
wire [DATA_LEN - 1:0] R2_out;
wire [DATA_LEN - 1:0] R3_out;
wire [DATA_LEN - 1:0] RA_out;
wire [DATA_LEN - 1:0] RB_out;
wire [DATA_LEN - 1:0] RC_out;
wire [DATA_LEN - 1:0] RD_out;
assign ram_in = DR_out;

// Instruction Registor
ins_registor #(
    .INSTRUCTION_LEN(INSTRUCTION_LEN),
    .DATA_LEN(DATA_LEN)
)
IR
(
    .clk(clk), 
    .LDIR(LDIR), 
    .DR_out(DR_out), 
    .counter_out(counter_out), 
    .data_out(counter_in)
);

// Program Counter
registor_with_inc #(
    .DATA_LEN(DATA_LEN)
)
PC
(
    .reset(reset),
    .clk(clk), 
    .c_bus_in(c_bus_in), 
    .inc(PC_INC), 
    .WE(C_bus_ctrl_sig[9]), 
    .data_out(PC_out)
);

// Accumilator
registor_with_inc #(
    .DATA_LEN(DATA_LEN)
)
AC
(
    .clk(clk), 
    .c_bus_in(c_bus_in), 
    .inc(AC_INC), 
    .WE(C_bus_ctrl_sig[0]), 
    .data_out(AC_out)
);

// RA Registor
registor_with_inc #(
    .DATA_LEN(DATA_LEN)
)
RA
(
    .clk(clk), 
    .c_bus_in(c_bus_in), 
    .inc(RA_INC), 
    .WE(C_bus_ctrl_sig[8]), 
    .data_out(RA_out)
);

// RB Registor
registor_with_inc #(
    .DATA_LEN(DATA_LEN)
)
RB
(
    .clk(clk), 
    .c_bus_in(c_bus_in), 
    .inc(RB_INC), 
    .WE(C_bus_ctrl_sig[7]), 
    .data_out(RB_out)
);

// RC Registor
registor_with_inc #(
    .DATA_LEN(DATA_LEN)
)
RC
(
    .clk(clk), 
    .c_bus_in(c_bus_in), 
    .inc(RC_INC), 
    .WE(C_bus_ctrl_sig[6]), 
    .data_out(RC_out)
);

// RD Registor
registor_no_inc #(
    .DATA_LEN(DATA_LEN)
)
RD
(
    .clk(clk), 
    .c_bus_in(c_bus_in), 
    .WE(C_bus_ctrl_sig[10]), 
    .data_out(RD_out)
);

// R1 Registor
registor_no_inc #(
    .DATA_LEN(DATA_LEN)
)
R1
(
    .clk(clk), 
    .c_bus_in(c_bus_in), 
    .WE(C_bus_ctrl_sig[5]), 
    .data_out(R1_out)
);

// R2 Registor
registor_no_inc #(
    .DATA_LEN(DATA_LEN)
)
R2
(
    .clk(clk), 
    .c_bus_in(c_bus_in), 
    .WE(C_bus_ctrl_sig[4]), 
    .data_out(R2_out)
);

// R3 Registor
registor_no_inc #(
    .DATA_LEN(DATA_LEN)
)
R3
(
    .clk(clk), 
    .c_bus_in(c_bus_in), 
    .WE(C_bus_ctrl_sig[3]), 
    .data_out(R3_out)
);

// Data Registor
data_registor #(
    .DATA_LEN(DATA_LEN)
)
DR
(
    .clk(clk), 
    .c_bus_in(c_bus_in), 
    .ram_out(ram_out), 
    .WE(C_bus_ctrl_sig[2]), 
    .read(read), 
    .data_out(DR_out)
);

// Address Registor
address_registor #(
    .ADDRESS_LEN(ADDRESS_LEN),
    .DATA_LEN(DATA_LEN)
)
AR
(
    .clk(clk), 
    .c_bus_in(c_bus_in), 
    .WE(C_bus_ctrl_sig[1]), 
    .data_out(ram_addr)
);

// MUX
mux #(
    .DATA_LEN(DATA_LEN),
    .MUX_SEL_SIG(MUX_SEL_SIG)
)
MUX
(
    .clk(clk),
    .select(select),
    .DR(DR_out),
    .R1(R1_out),
    .R2(R2_out),
    .R3(R3_out),
    .RA(RA_out),
    .RB(RB_out),
    .RC(RC_out),
    .RD(RD_out),
    .AC(AC_out),
    .PC(PC_out),
    .data_out(MUX_out)
);

endmodule
