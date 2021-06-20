module ram(
    input clk,
    input read, 
    input write,
    input [15:0] address,
    input [15:0] data_in,
    output reg [15:0] data_out
);

reg [15:0] memory [254:0];


// Instruction RAM
initial begin
    memory[0] = 6'd4;
    memory[1] = 8'h34;

    memory[2] = 6'd36;

    memory[3] = 6'd4;
    memory[4] = 8'h35;

    memory[5] = 6'd37;

    memory[6] = 6'd12;
    memory[7] = 8'h36;

    memory[8] = 6'd14;
    memory[9] = 8'h3A;

    memory[10] = 6'd16;
    memory[11] = 8'h3E;
    
    memory[12] = 6'd18;

    memory[13] = 6'd38;

    memory[14] = 6'd21;

    memory[15] = 6'd51;

    memory[16] = 6'd38;

    memory[17] = 6'd24;

    memory[18] = 6'd41;

    memory[19] = 6'd33;

    memory[20] = 6'd43;

    memory[21] = 6'd44;

    memory[22] = 6'd4;
    memory[23] = 8'h33;

    memory[24] = 6'd48;

    memory[25] = 6'd8;
    memory[26] = 8'h33;

    memory[27] = 6'd46;

    memory[28] = 6'd52;// JPNZ Loop L1
    memory[29] = 8'h0C;

    memory[30] = 6'd42;

    memory[31] = 6'd55;

    memory[32] = 6'd8;
    memory[33] = 8'h33;

    memory[34] = 6'd4;
    memory[35] = 8'h32;

    memory[36] = 6'd48;

    memory[37] = 6'd8;
    memory[38] = 8'h32;

    memory[39] = 6'd45;

    memory[40] = 6'd16;
    memory[41] = 8'h3E;

    memory[42] = 6'd52;// JPNZ Loop L1
    memory[43] = 8'h0C; 

    memory[44] = 6'd56;

    memory[45] = 6'd57;// END
end


// Data RAM

initial begin
    memory[50] = 16'd0;
    memory[51] = 16'd0;
    memory[52] = 16'd2;
    memory[53] = 16'd2;
    memory[54] = 16'd2;
    memory[55] = 16'd1;
    memory[56] = 16'd5;
    memory[57] = 16'd4;
    memory[58] = 16'd34;
    memory[59] = 16'd54;
    memory[60] = 16'd55;
    memory[61] = 16'd67;
    memory[62] = 16'd0;
    memory[63] = 16'd0;
end

always @(posedge clk) begin
    if(read==1) begin
        data_out <= memory[address[7:0]];
    end

    if(write==1) begin
        memory[address[7:0]] <= data_in;
    end
end

endmodule