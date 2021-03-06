`timescale 1ns/1ns

module test_bench_SM();
    reg clk;
    reg [5:0] IR;
    wire  [3:0] A_bus;
    wire [2:0] ALU;
    wire [9:0] C_bus;
    wire [15:0] out;
    wire LDIR,PC_INC,AC_INC,RA_INC,RB_INC,RC_INC,read,write,Z_Flag;

    reg[5:0] read_data [0:55];
    integer i;
    integer write_data;
    integer fin_pointer;

    state_machine SM(.clk(clk), .IR(IR), .A_bus(A_bus), .ALU(ALU), .C_bus(C_bus),
                    .LDIR(LDIR), .PC_INC(PC_INC), .AC_INC(AC_INC), .RA_INC(RA_INC),
                    .RB_INC(RB_INC), .RC_INC(RC_INC), .read(read), .write(write));
    
    always #25 clk=~clk;
    initial
        begin
	        clk = 1;
            write_data = $fopen("output_signals.txt", "w");
            $readmemb("Instructions.txt", read_data);
            for(i=0 ; i < 56 ; i=i+1)
                begin
                    //IR = read_data[i];
		    IR = 6'b111001;
                    $display(IR);//read_data[i]
                    $fdisplay(write_data, "%b_%b_%b_%b_%b_%b_%b_%b_%b_%b_%b",
                             A_bus, ALU,  C_bus,  LDIR, PC_INC, AC_INC, RA_INC, RB_INC, RC_INC, read, write);
                    #50;
                end
        end

endmodule
