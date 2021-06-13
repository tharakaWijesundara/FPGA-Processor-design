module top_module (
    input clk,
    input [5:0] IR,
    output  [3:0] A_bus,
    output   Z_Flag,
    output  [9:0] C_bus,
    output  [15:0] out,
    output  LDIR,PC_INC,AC_INC,RA_INC,RB_INC,RC_INC,read,write
);
    // reg clk;
    // reg [5:0] IR;
//     wire  [3:0] A_bus1;
    wire [2:0] alu_to_sm;
    wire [15:0] A =16'b1110000000000000;
    wire [15:0] B =16'b1110000110001100;
//     wire [9:0] C_bus1;
//     wire LDIR1,PC_INC1,AC_INC1,RA_INC1,RB_INC1,RC_INC1,read1,write1;

stateMachine SM(.clk(clk), .IR(IR), .A_bus(A_bus), .ALU(alu_to_sm), .C_bus(C_bus),
                    .LDIR(LDIR), .PC_INC(PC_INC), .AC_INC(AC_INC), .RA_INC(RA_INC),
                    .RB_INC(RB_INC), .RC_INC(RC_INC), .read(read), .write(write));

alu ALU(.clk(clk), .A(A), .B(B), .select(alu_to_sm), .z_flag(Z_Flag), .out(out));

endmodule