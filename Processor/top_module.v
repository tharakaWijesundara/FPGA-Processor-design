module top_module 
#(
    parameter ADDRESS_LEN = 8,
    parameter INSTRUCTION_LEN = 6,
    parameter ALU_SIG_LEN = 3,
    parameter C_BUS_SIG_LEN = 11,
    parameter DATA_LEN = 16,
    parameter SM_SIG_LEN = 6,
    parameter MUX_SEL_SIG = 4
)
(
    input clk,
    input start,
    output read,
    output write,
    input [DATA_LEN - 1:0] ram_out,
    output [ADDRESS_LEN - 1:0] ram_addr, 
    output [DATA_LEN - 1:0] ram_in,
    output finish
);
    wire [MUX_SEL_SIG - 1:0] A_bus;
    wire [DATA_LEN - 1:0] ALU_out;
    wire [DATA_LEN - 1:0] AC_out;
    wire [DATA_LEN - 1:0] MUX_out;
    wire [INSTRUCTION_LEN - 1:0] IRIn;
    wire [SM_SIG_LEN - 1:0] smInput;
    wire Z_Flag;
    wire [INSTRUCTION_LEN - 1:0] counter_in;
    wire [ALU_SIG_LEN - 1:0] ALU_to_SM;
    wire SM_to_RU_LDIR;
    wire SM_to_RU_PC_INC;
    wire SM_to_RU_AC_INC;
    wire SM_to_RU_RA_INC;
    wire SM_to_RU_RB_INC;
    wire SM_to_RU_RC_INC;
    wire [C_BUS_SIG_LEN - 1:0] SM_to_RU_C_BUS;


counter #(
    .INSTRUCTION_LEN(INSTRUCTION_LEN),
    .SM_SIG_LEN(SM_SIG_LEN)
)
COUNTER
(
    .clk(clk),//
    .IROut(counter_in),//
    .z_in(Z_Flag),//
    .start(start),//
    .smInput(smInput),//
    .IRIn(IRIn)
);//

state_machine #(
    .INSTRUCTION_LEN(INSTRUCTION_LEN),
    .ALU_SIG_LEN(ALU_SIG_LEN),
    .C_BUS_SIG_LEN(C_BUS_SIG_LEN),
    .MUX_SEL_SIG(MUX_SEL_SIG)
)
SM
(
    .clk(clk), //
    .IR(smInput), //
    .A_bus(A_bus), //
    .ALU(ALU_to_SM), //
    .C_bus(SM_to_RU_C_BUS),//
    .LDIR(SM_to_RU_LDIR), //
    .PC_INC(SM_to_RU_PC_INC), //
    .AC_INC(SM_to_RU_AC_INC), //
    .RA_INC(SM_to_RU_RA_INC),//
    .RB_INC(SM_to_RU_RB_INC), //
    .RC_INC(SM_to_RU_RC_INC), //
    .read(read), //
    .write(write)
);//

alu #(
    .ALU_SIG_LEN(ALU_SIG_LEN),
    .DATA_LEN(DATA_LEN)
)
ALU
(
    .clk(clk), //
    .A(MUX_out), //
    .B(AC_out), //
    .select(ALU_to_SM), //
    .z_flag(Z_Flag), //
    .out(ALU_out),//
    .finish(finish)
);//

registor_unit #(
    .ADDRESS_LEN(ADDRESS_LEN),
    .INSTRUCTION_LEN(INSTRUCTION_LEN),
    .C_BUS_SIG_LEN(C_BUS_SIG_LEN),
    .DATA_LEN(DATA_LEN),
    .MUX_SEL_SIG(MUX_SEL_SIG)
)
RU
(
    .clk(clk),//
    .LDIR(SM_to_RU_LDIR), //
    .PC_INC(SM_to_RU_PC_INC), //
    .AC_INC(SM_to_RU_AC_INC), //
    .RA_INC(SM_to_RU_RA_INC), //
    .RB_INC(SM_to_RU_RB_INC),//
    .RC_INC(SM_to_RU_RC_INC),//
    .counter_out(IRIn),//
    .C_bus_ctrl_sig(SM_to_RU_C_BUS), //
    .c_bus_in(ALU_out), //
    .select(A_bus),//
    .counter_in(counter_in), //
    .MUX_out(MUX_out),//
    .ram_in(ram_in),//
    .ram_out(ram_out), //
    .ram_addr(ram_addr),//
    .AC_out(AC_out),//
    .read(read)
);//

endmodule

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// module top_module (
//     input clk,
//     input start,
//     output finish
// );
//     wire [3:0] A_bus;
//     wire [15:0] ram_addr;
//     wire [15:0] ALU_out;
//     wire [15:0] AC_out;
//     wire [15:0] MUX_out;
//     wire [5:0] IRIn;
//     wire [5:0] smInput;
//     wire Z_Flag;
//     wire [5:0] counter_in;
//     wire [2:0] ALU_to_SM;
//     wire [15:0] ram_out;
//     wire [15:0] ram_in;
//     wire SM_to_RU_LDIR;
//     wire SM_to_RU_PC_INC;
//     wire SM_to_RU_AC_INC;
//     wire SM_to_RU_RA_INC;
//     wire SM_to_RU_RB_INC;
//     wire SM_to_RU_RC_INC;
//     wire read; 
//     wire write;
//     wire [10:0] SM_to_RU_C_BUS;


// ram RAM(.clk(clk), //
//         .read(read),//
//         .write(write),//
//         .address(ram_addr),//
//         .data_in(ram_in),//
//         .data_out(ram_out));//

// counter COUNTER(.clk(clk),//
//                 .IROut(counter_in),//
//                 .z_in(Z_Flag),//
//                 .start(start),//
//                 .smInput(smInput),//
//                 .IRIn(IRIn));//

// state_machine SM(.clk(clk), //
//                 .IR(smInput), //
//                 .A_bus(A_bus), //
//                 .ALU(ALU_to_SM), //
//                 .C_bus(SM_to_RU_C_BUS),//
//                 .LDIR(SM_to_RU_LDIR), //
//                 .PC_INC(SM_to_RU_PC_INC), //
//                 .AC_INC(SM_to_RU_AC_INC), //
//                 .RA_INC(SM_to_RU_RA_INC),//
//                 .RB_INC(SM_to_RU_RB_INC), //
//                 .RC_INC(SM_to_RU_RC_INC), //
//                 .read(read), //
//                 .write(write));//

// alu ALU(.clk(clk), //
//         .A(MUX_out), //
//         .B(AC_out), //
//         .select(ALU_to_SM), //
//         .z_flag(Z_Flag), //
//         .out(ALU_out),//
//         .finish(finish));//

// registor_unit RU(.clk(clk),//
//                  .LDIR(SM_to_RU_LDIR), //
//                  .PC_INC(SM_to_RU_PC_INC), //
//                  .AC_INC(SM_to_RU_AC_INC), //
//                  .RA_INC(SM_to_RU_RA_INC), //
//                  .RB_INC(SM_to_RU_RB_INC),//
//                  .RC_INC(SM_to_RU_RC_INC),//
//                  .counter_out(IRIn),//
//                  .C_bus_ctrl_sig(SM_to_RU_C_BUS), //
//                  .c_bus_in(ALU_out), //
//                  .select(A_bus),//
//                  .counter_in(counter_in), //
//                  .MUX_out(MUX_out),//
//                  .ram_in(ram_in),//
//                  .ram_out(ram_out), //
//                  .ram_addr(ram_addr),//
//                  .AC_out(AC_out),//
//                  .read(read));//

// endmodule