module ram #(
    parameter DATA_LEN = 16,
    parameter ADDRESS_LEN = 8
)
(
    input clk,
    input read, 
    input write,
    input [ADDRESS_LEN * 3 - 1:0] address,
    input [DATA_LEN * 3 - 1:0] data_in,
    output reg [DATA_LEN * 3 - 1:0] data_out
);

reg [DATA_LEN - 1:0] memory [2 ** ADDRESS_LEN - 1:0];


// Instruction RAM
initial begin
    memory[0] = 6'd4;
    memory[1] = 8'h3E;

    memory[2] = 6'd36;

    memory[3] = 6'd4;
    memory[4] = 8'h3F;

    memory[5] = 6'd37;

    memory[6] = 6'd14;
    memory[7] = 8'h50;

    memory[8] = 6'd16;
    memory[9] = 8'h60;

    memory[10] = 6'd12;
    memory[11] = 8'h40;

    memory[12] = 8'd58;

    memory[13] = 6'd4;
    memory[14] = 8'd11;

    memory[15] = 8'd40;

    memory[16] = 6'd8;
    memory[17] = 8'd11;

    memory[18] = 6'd4;
    memory[19] = 8'd9;

    memory[20] = 8'd40;

    memory[21] = 6'd8;
    memory[22] = 8'd9;
    
    memory[23] = 6'd18;

    memory[24] = 6'd38;

    memory[25] = 6'd21;

    memory[26] = 6'd51;

    memory[27] = 6'd38;

    memory[28] = 6'd24;

    memory[29] = 6'd41;

    memory[30] = 6'd33;

    memory[31] = 6'd43;

    memory[32] = 6'd44;

    memory[33] = 6'd4;
    memory[34] = 8'h3D;

    memory[35] = 6'd48;

    memory[36] = 6'd8;
    memory[37] = 8'h3D;

    memory[38] = 6'd46;

    memory[39] = 6'd52;// JPNZ Loop L1
    memory[40] = 8'h17;

    memory[41] = 6'd42;

    memory[42] = 6'd55;

    memory[43] = 6'd8;
    memory[44] = 8'h3D;

    memory[45] = 6'd4;
    memory[46] = 8'h3C;

    memory[47] = 6'd48;

    memory[48] = 6'd8;
    memory[49] = 8'h3C;

    memory[50] = 6'd45;

    // memory[51] = 6'd16;
    // memory[52] = 8'h3E;

    memory[51] = 6'd59;

    memory[52] = 6'd52;// JPNZ Loop L1
    memory[53] = 8'h17;

    memory[54] = 6'd56;

    memory[55] = 6'd55;

    memory[56] = 6'd8;
    memory[57] = 8'h3C;

    memory[58] = 6'd57;// END
end


// Data RAM

initial begin
    memory[60] = 16'd0;
    memory[61] = 16'd0;
    memory[62] = 16'd4;
    memory[63] = 16'd4;
    memory[64] = 16'd23;
    memory[65] = 16'd45;
    memory[66] = 16'd44;
    memory[67] = 16'd56;
    memory[68] = 16'd66;
    memory[69] = 16'd77;
    memory[70] = 16'd3;
    memory[71] = 16'd45;
    memory[72] = 16'd11;
    memory[73] = 16'd32;
    memory[74] = 16'd34;
    memory[75] = 16'd53;
    memory[76] = 16'd3;
    memory[77] = 16'd56;
    memory[78] = 16'd12;
    memory[79] = 16'd23;
    memory[80] = 16'd66;
    memory[81] = 16'd12;
    memory[82] = 16'd55;
    memory[83] = 16'd11;
    memory[84] = 16'd34;
    memory[85] = 16'd43;
    memory[86] = 16'd4;
    memory[87] = 16'd32;
    memory[88] = 16'd56;
    memory[89] = 16'd67;
    memory[90] = 16'd5;
    memory[91] = 16'd33;
    memory[92] = 16'd98;
    memory[93] = 16'd91;
    memory[94] = 16'd90;
    memory[95] = 16'd56;
    memory[96] = 16'd0;
    memory[97] = 16'd0;
    memory[98] = 16'd0;
    memory[99] = 16'd0;
    memory[100] = 16'd0;
    memory[101] = 16'd0;
    memory[102] = 16'd0;
    memory[103] = 16'd0;
    memory[104] = 16'd0;
    memory[105] = 16'd0;
    memory[106] = 16'd0;
    memory[107] = 16'd0;
    memory[108] = 16'd0;
    memory[109] = 16'd0;
    memory[110] = 16'd0;
    memory[111] = 16'd0;


end

always @(posedge clk) begin
    if(read==1) begin
        data_out <= {
            memory[address[ADDRESS_LEN * 3 - 1:ADDRESS_LEN * 2]],
            memory[address[ADDRESS_LEN * 2 - 1:ADDRESS_LEN]], 
            memory[address[ADDRESS_LEN - 1:0]]
            };
    end

    else if(write==1) begin
        memory[address[ADDRESS_LEN - 1:0]] <= data_in[DATA_LEN - 1:0];
        memory[address[ADDRESS_LEN * 2 - 1:ADDRESS_LEN]] <= data_in[DATA_LEN * 2 - 1:DATA_LEN];
        memory[address[ADDRESS_LEN * 3 - 1:ADDRESS_LEN * 2]] <= data_in[DATA_LEN * 3 - 1:DATA_LEN * 2];
    end
end

endmodule

