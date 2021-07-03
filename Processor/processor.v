module processor (
    input clk,
    input start,
    output reg finish_process
);

localparam NO_OF_CORES = 2;
reg[2:0] NO_OF_ROWS = 3;

localparam INSTRUCTION_LEN = 6;
localparam ALU_SIG_LEN = 3;
localparam C_BUS_SIG_LEN = 11;
localparam DATA_LEN = 16;
localparam SM_SIG_LEN = 6;
localparam MUX_SEL_SIG = 4;
localparam ADDRESS_LEN = 8;



reg [NO_OF_CORES - 1:0] start_cores;
wire [NO_OF_CORES - 1:0] finish_cores;
wire [NO_OF_CORES - 1:0] read_signal;
wire [NO_OF_CORES - 1:0] write_signal;
reg [NO_OF_CORES - 1:0] reset_signals;


wire [ADDRESS_LEN * NO_OF_CORES - 1:0] address;
wire [DATA_LEN * NO_OF_CORES - 1:0] data_in;
wire [DATA_LEN * NO_OF_CORES - 1:0] data_out;

reg read;
reg write;

integer running_cores;

integer k;

always @(read_signal) begin
    for(k=0; k<running_cores; k=k+1) begin
        if (k == 0) read = read_signal[k];
        else        read = read & read_signal[k];
    end
end

always @(write_signal) begin
    for(k=0; k<running_cores; k=k+1) begin
        if (k == 0) write = write_signal[k];
        else        write = write | write_signal[k];
    end
end

genvar c;

generate 
    for(c=0; c<NO_OF_CORES; c=c+1) begin : CORE
        top_module #(
                .ADDRESS_LEN(ADDRESS_LEN),
                .INSTRUCTION_LEN(INSTRUCTION_LEN),
                .ALU_SIG_LEN(ALU_SIG_LEN),
                .C_BUS_SIG_LEN(C_BUS_SIG_LEN),
                .DATA_LEN(DATA_LEN),
                .SM_SIG_LEN(SM_SIG_LEN),
                .MUX_SEL_SIG(MUX_SEL_SIG)
            ) 
            INS
            (
                .clk(clk), 
                .start(start_cores[c]), 
                .read(read_signal[c]), 
                .write(write_signal[c]), 
                .ram_addr(address[ADDRESS_LEN*c +: ADDRESS_LEN]), 
                .ram_in(data_in[DATA_LEN*c +: DATA_LEN]), 
                .ram_out(data_out[DATA_LEN*c +: DATA_LEN]), 
                .finish(finish_cores[c]),
                .reset(reset_signals[c])
            );
    end
endgenerate

ram #(
    .DATA_LEN(DATA_LEN),
    .ADDRESS_LEN(ADDRESS_LEN)
)
RAM(
    .clk(clk), 
    .read(read),
    .write(write),
    .address(address),
    .data_in(data_in),
    .data_out(data_out)
);



integer i;


always @(start) begin
    if(NO_OF_ROWS >= NO_OF_CORES) begin
        for(i=0; i<NO_OF_CORES; i=i+1)begin
            start_cores[i] <= 1'b1;
        end
        running_cores <= NO_OF_CORES;
        NO_OF_ROWS <= NO_OF_ROWS - NO_OF_CORES;
    end
    else begin
        for(i=0; i<NO_OF_ROWS; i=i+1)begin
            start_cores[i] <= 1'b1;
        end
        running_cores <= NO_OF_ROWS;
        NO_OF_ROWS <= 0;
    end
end
integer j;

integer round = 1;

always @(address or finish_cores) begin

    if(round == 1)begin : round_one
        for(j = 0; j<running_cores; j=j+1)begin
            if(address[j * 8 +: 8] != {8'd5})  disable round_one;
        end
        for(j = 1; j<running_cores; j=j+1) begin
            start_cores[j] = 0;
        end
        round = round + 1;
    end
    else if (round == 0) begin : round_end
        for(j = 0; j<running_cores; j=j+1)begin
            if(finish_cores[j] !== 1'b1)  disable round_end;
        end
        
        if(NO_OF_ROWS > 0) begin
            if(NO_OF_ROWS > NO_OF_CORES) begin
                for(j=0; j<NO_OF_CORES; j=j+1)begin
                    reset_signals[j] = 1;
                end
                running_cores = NO_OF_CORES;
                NO_OF_ROWS = NO_OF_ROWS - NO_OF_CORES;
            end    
            else begin
                for(j=0; j<NO_OF_ROWS; j=j+1)begin
                    reset_signals[j] = 1;
                end
                for(j=NO_OF_ROWS; j<NO_OF_CORES; j=j+1)begin
                    start_cores[j] = 0;
                end
                running_cores = NO_OF_ROWS;
                NO_OF_ROWS = 0;
            end
            round = 1;

        end
        else if(&finish_cores == 1)    finish_process <= 1;
    end
    else begin
        if(address[(round-2)*8 +: 8] == 8'd23) begin
            if(round - 1 == running_cores) begin
                for(j = 0; j<running_cores; j=j+1) begin
                    start_cores[j] = 1;
                end
                round = 0;
            end
            else begin
                start_cores[round - 2] = 0;
                start_cores[round - 1] = 1;
                round = round + 1;
            end
        end

    end
end

endmodule

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// module processor (
//     input clk,
//     input start,
//     output finish
// );

// wire read;
// wire write;
// wire [15:0] ram_addr;
// wire [15:0] ram_in;
// wire [15:0] ram_out;

// top_module CORE_ONE(.clk(clk), 
//                     .start(start), 
//                     .read(read), 
//                     .write(write), 
//                     .ram_addr(ram_addr), 
//                     .ram_in(ram_in), 
//                     .ram_out(ram_out), 
//                     .finish(finish));

// ram RAM(.clk(clk), 
//         .read(read),
//         .write(write),
//         .address(ram_addr),
//         .data_in(ram_in),
//         .data_out(ram_out));

    
// endmodule