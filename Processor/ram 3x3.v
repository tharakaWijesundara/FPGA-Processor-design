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
    memory[7] = 8'h49;

    memory[8] = 6'd16;
    memory[9] = 8'h52;

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

    memory[55] = 6'd57;// END
end


// Data RAM

initial begin
    memory[60] = 16'd0;
    memory[61] = 16'd0;
    memory[62] = 16'd3;
    memory[63] = 16'd3;
    memory[64] = 16'd2;
    memory[65] = 16'd1;
    memory[66] = 16'd45;
    memory[67] = 16'd5;
    memory[68] = 16'd4;
    memory[69] = 16'd46;
    memory[70] = 16'd44;
    memory[71] = 16'd33;
    memory[72] = 16'd12;
    memory[73] = 16'd34;
    memory[74] = 16'd54;
    memory[75] = 16'd65;
    memory[76] = 16'd55;
    memory[77] = 16'd67;
    memory[78] = 16'd33;
    memory[79] = 16'd12;
    memory[80] = 16'd43;
    memory[81] = 16'd55;
    memory[82] = 16'd0;
    memory[83] = 16'd0;
    memory[84] = 16'd0;
    memory[85] = 16'd0;
    memory[86] = 16'd0;
    memory[87] = 16'd0;
    memory[88] = 16'd0;
    memory[89] = 16'd0;
    memory[90] = 16'd0;
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// module ram(
//     input clk,
//     input read, 
//     input write,
//     input [15:0] address,
//     input [15:0] data_in,
//     output reg [15:0] data_out
// );

// reg [15:0] memory [254:0];


// // Instruction RAM
// initial begin
//     memory[0] = 6'd4;
//     memory[1] = 8'h3E;

//     memory[2] = 6'd36;

//     memory[3] = 6'd4;
//     memory[4] = 8'h3F;

//     memory[5] = 6'd37;

//     memory[6] = 6'd14;
//     memory[7] = 8'h49;

//     memory[8] = 6'd16;
//     memory[9] = 8'h52;

//     memory[10] = 6'd12;
//     memory[11] = 8'h40;

//     memory[12] = 8'd58;

//     memory[13] = 6'd4;
//     memory[14] = 8'd11;

//     memory[15] = 8'd40;

//     memory[16] = 6'd8;
//     memory[17] = 8'd11;

//     memory[18] = 6'd4;
//     memory[19] = 8'd9;

//     memory[20] = 8'd40;

//     memory[21] = 6'd8;
//     memory[22] = 8'd9;
    
//     memory[23] = 6'd18;

//     memory[24] = 6'd38;

//     memory[25] = 6'd21;

//     memory[26] = 6'd51;

//     memory[27] = 6'd38;

//     memory[28] = 6'd24;

//     memory[29] = 6'd41;

//     memory[30] = 6'd33;

//     memory[31] = 6'd43;

//     memory[32] = 6'd44;

//     memory[33] = 6'd4;
//     memory[34] = 8'h3D;

//     memory[35] = 6'd48;

//     memory[36] = 6'd8;
//     memory[37] = 8'h3D;

//     memory[38] = 6'd46;

//     memory[39] = 6'd52;// JPNZ Loop L1
//     memory[40] = 8'h17;

//     memory[41] = 6'd42;

//     memory[42] = 6'd55;

//     memory[43] = 6'd8;
//     memory[44] = 8'h3D;

//     memory[45] = 6'd4;
//     memory[46] = 8'h3C;

//     memory[47] = 6'd48;

//     memory[48] = 6'd8;
//     memory[49] = 8'h3C;

//     memory[50] = 6'd45;

//     // memory[51] = 6'd16;
//     // memory[52] = 8'h3E;

//     memory[51] = 6'd59;

//     memory[52] = 6'd52;// JPNZ Loop L1
//     memory[53] = 8'h17;

//     memory[54] = 6'd56;

//     memory[55] = 6'd57;// END
// end


// // Data RAM

// initial begin
//     memory[60] = 16'd0;
//     memory[61] = 16'd0;
//     memory[62] = 16'd3;
//     memory[63] = 16'd3;
//     memory[64] = 16'd2;
//     memory[65] = 16'd1;
//     memory[66] = 16'd45;
//     memory[67] = 16'd5;
//     memory[68] = 16'd4;
//     memory[69] = 16'd46;
//     memory[70] = 16'd44;
//     memory[71] = 16'd33;
//     memory[72] = 16'd12;
//     memory[73] = 16'd34;
//     memory[74] = 16'd54;
//     memory[75] = 16'd65;
//     memory[76] = 16'd55;
//     memory[77] = 16'd67;
//     memory[78] = 16'd33;
//     memory[79] = 16'd12;
//     memory[80] = 16'd43;
//     memory[81] = 16'd55;
//     memory[82] = 16'd0;
//     memory[83] = 16'd0;
//     memory[84] = 16'd0;
//     memory[85] = 16'd0;
//     memory[86] = 16'd0;
//     memory[87] = 16'd0;
//     memory[88] = 16'd0;
//     memory[89] = 16'd0;
//     memory[90] = 16'd0;
// end

// always @(posedge clk) begin
//     if(read==1) begin
//         data_out <= memory[address[7:0]];
//     end

//     if(write==1) begin
//         memory[address[7:0]] <= data_in;
//     end
// end

// endmodule