module top_module (
    input clk,
    input [5:0] IR,
    output  [3:0] A_bus,
    output   Z_Flag,
   // output  [9:0] C_bus,
    output  [15:0] out,
    //output  LDIR,PC_INC,AC_INC,RA_INC,RB_INC,RC_INC,
    output write,
    output [5:0] counter_in,
    output [15:0] AC_out,
    output [15:0] MUX_out,
    output [15:0] PC_out,
    output [15:0] ram_addr  
);
    // reg clk;
    // reg [5:0] IR;
//     wire  [3:0] A_bus1;
    wire [2:0] ALU_to_SM;
    wire [15:0] ram_out = 16'd34;
    wire [15:0] ram_in ;
    //wire [15:0] ram_addr;
    wire [15:0] A =16'b1110000000000000;
    wire [15:0] B =16'b1110000110001100;
    wire SM_to_RU_LDIR ,SM_to_RU_PC_INC,SM_to_RU_AC_INC,SM_to_RU_RA_INC,
    SM_to_RU_RB_INC,SM_to_RU_RC_INC, SM_to_RU_READ;
    wire [9:0]  SM_to_RU_C_BUS;
//     wire [9:0] C_bus1;
//     wire LDIR1,PC_INC1,AC_INC1,RA_INC1,RB_INC1,RC_INC1,read1,write1;

stateMachine SM(.clk(clk), .IR(IR), .A_bus(A_bus), .ALU(ALU_to_SM), .C_bus(SM_to_RU_C_BUS),
                    .LDIR(SM_to_RU_LDIR), .PC_INC(SM_to_RU_PC_INC), .AC_INC(SM_to_RU_AC_INC), .RA_INC(RA_INC),
                    .RB_INC(SM_to_RU_RB_INC), .RC_INC(SM_to_RU_RC_INC), .read(SM_to_RU_READ), .write(write));

alu ALU(.clk(clk), .A(A), .B(B), .select(ALU_to_SM), .z_flag(Z_Flag), .out(out));

registor_unit  RU(.clk(clk), .LDIR(SM_to_RU_LDIR), .PC_INC(SM_to_RU_PC_INC), 
                    .AC_INC(SM_to_RU_AC_INC), .RA_INC(SM_to_RU_RA_INC), 
                    .RB_INC(SM_to_RU_RB_INC),.RC_INC(SM_to_RU_RC_INC),.counter_out(IR),
                    .C_bus_ctrl_sig(SM_to_RU_C_BUS), .c_bus_in(out), .select(A_bus),
                     .counter_in(counter_in), .MUX_out(MUX_out),
                    .ram_in(ram_in), .ram_out(ram_out), .ram_addr(ram_addr),.AC_out(AC_out),
                    .PC_out(PC_out), .read(SM_to_RU_READ));

endmodule