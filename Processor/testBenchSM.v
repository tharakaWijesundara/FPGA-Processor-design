`timescale 1ns/1ns

module testBenchSM();
    reg clk;
    reg [5:0] IR;
    wire  [3:0] A_bus;
    wire [2:0] ALU;
    wire [9:0] C_bus;
    wire LDIR,PC_INC,AC_INC,RA_INC,RB_INC,RC_INC,read,write;

    reg[5:0] read_data [0:55];
    integer i;
    integer write_data;

    stateMachine SM(.clk(clk), .IR(IR), .A_bus(A_bus), .ALU(ALU), .C_bus(C_bus),
                    .LDIR(LDIR), .PC_INC(PC_INC), .AC_INC(AC_INC), .RA_INC(RA_INC),
                    .RB_INC(RB_INC), .RC_INC(RC_INC), .read(read), .write(write));
    
    // always 
    //     begin
    //         clk = 1'b1; 
    //         #25;

    //         clk = 1'b0;
    //         #25;
    //     end
    always #25 clk=~clk;
    initial
        begin
	        clk = 1;
            write_data = $fopen("output_signals.txt");
            $readmemb("Instructions.txt", read_data);
            for(i=0 ; i < 56 ; i=i+1)
                begin
                    IR = read_data[i];
                    $display(read_data[i]);
                    $fdisplay(write_data, "%b_%b_%b_%b_%b_%b_%b_%b_%b_%b_%b",
                             A_bus, ALU, C_bus, LDIR, PC_INC, AC_INC, RA_INC, RB_INC, RC_INC, read, write);
                    #50;
                end
        end

endmodule
