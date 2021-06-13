module top_module (
    input clk,
    input [5:0] IR,
    output  [3:0] A_bus,
    output  [2:0] ALU,
    output  [9:0] C_bus,
    output  LDIR,PC_INC,AC_INC,RA_INC,RB_INC,RC_INC,read,write
);
    // reg clk;
    // reg [5:0] IR;
//     wire  [3:0] A_bus1;
//     wire [2:0] ALU1;
//     wire [9:0] C_bus1;
//     wire LDIR1,PC_INC1,AC_INC1,RA_INC1,RB_INC1,RC_INC1,read1,write1;

stateMachine SM(.clk(clk), .IR(IR), .A_bus(A_bus), .ALU(ALU), .C_bus(C_bus),
                    .LDIR(LDIR), .PC_INC(PC_INC), .AC_INC(AC_INC), .RA_INC(RA_INC),
                    .RB_INC(RB_INC), .RC_INC(RC_INC), .read(read), .write(write));

endmodule