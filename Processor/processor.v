module processor (
    input clk,
    input start,
    output reg finish_process
);

localparam INSTRUCTION_LEN = 6;
localparam ALU_SIG_LEN = 3;
localparam C_BUS_SIG_LEN = 11;
localparam DATA_LEN = 16;
localparam SM_SIG_LEN = 6;
localparam MUX_SEL_SIG = 4;
localparam ADDRESS_LEN = 8;

reg start_core_one;
reg start_core_two;
reg start_core_three;

wire read_one;
wire read_two;
wire read_three;

wire write_one;
wire write_two;
wire write_three;

wire [ADDRESS_LEN - 1:0] ram_addr_one; 
wire [DATA_LEN - 1:0] ram_in_one;
wire [DATA_LEN - 1:0] ram_out_one;

wire [ADDRESS_LEN - 1:0] ram_addr_two; 
wire [DATA_LEN - 1:0] ram_in_two;
wire [DATA_LEN - 1:0] ram_out_two;

wire [ADDRESS_LEN - 1:0] ram_addr_three; 
wire [DATA_LEN - 1:0] ram_in_three;
wire [DATA_LEN - 1:0] ram_out_three;

wire finish_core_one;
wire finish_core_two;
wire finish_core_three;

wire [ADDRESS_LEN * 3 - 1:0] address;
wire [DATA_LEN * 3 - 1:0] data_in;
wire [DATA_LEN * 3 - 1:0] data_out;

assign address = {ram_addr_three ,ram_addr_two, ram_addr_one};
assign data_in = {ram_in_three, ram_in_two, ram_in_one};

assign ram_out_one = data_out[DATA_LEN - 1:0];
assign ram_out_two = data_out[2 * DATA_LEN - 1:DATA_LEN];
assign ram_out_three = data_out[3 * DATA_LEN - 1:2 * DATA_LEN];

assign read = read_one ^ read_two ^ read_three;
assign write = write_one ^ write_two ^ write_three;

top_module #(
    .ADDRESS_LEN(ADDRESS_LEN),
    .INSTRUCTION_LEN(INSTRUCTION_LEN),
    .ALU_SIG_LEN(ALU_SIG_LEN),
    .C_BUS_SIG_LEN(C_BUS_SIG_LEN),
    .DATA_LEN(DATA_LEN),
    .SM_SIG_LEN(SM_SIG_LEN),
    .MUX_SEL_SIG(MUX_SEL_SIG)
) 
CORE_ONE
(
    .clk(clk), 
    .start(start_core_one), 
    .read(read_one), 
    .write(write_one), 
    .ram_addr(ram_addr_one), 
    .ram_in(ram_in_one), 
    .ram_out(ram_out_one), 
    .finish(finish_core_one)
);

top_module #(
    .ADDRESS_LEN(ADDRESS_LEN),
    .INSTRUCTION_LEN(INSTRUCTION_LEN),
    .ALU_SIG_LEN(ALU_SIG_LEN),
    .C_BUS_SIG_LEN(C_BUS_SIG_LEN),
    .DATA_LEN(DATA_LEN),
    .SM_SIG_LEN(SM_SIG_LEN),
    .MUX_SEL_SIG(MUX_SEL_SIG)
)
CORE_TWO
(
    .clk(clk), 
    .start(start_core_two), 
    .read(read_two), 
    .write(write_two), 
    .ram_addr(ram_addr_two), 
    .ram_in(ram_in_two), 
    .ram_out(ram_out_two), 
    .finish(finish_core_two)
);

top_module #(
    .ADDRESS_LEN(ADDRESS_LEN),
    .INSTRUCTION_LEN(INSTRUCTION_LEN),
    .ALU_SIG_LEN(ALU_SIG_LEN),
    .C_BUS_SIG_LEN(C_BUS_SIG_LEN),
    .DATA_LEN(DATA_LEN),
    .SM_SIG_LEN(SM_SIG_LEN),
    .MUX_SEL_SIG(MUX_SEL_SIG)
)
CORE_THREE
(
    .clk(clk), 
    .start(start_core_three), 
    .read(read_three), 
    .write(write_three), 
    .ram_addr(ram_addr_three), 
    .ram_in(ram_in_three), 
    .ram_out(ram_out_three), 
    .finish(finish_core_three)
);


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


always @(finish_core_one or finish_core_two or finish_core_three) begin
    if(finish_core_one == 1 && finish_core_two == 1 && finish_core_three == 1)    finish_process <= 1;
end

always @(start) begin
    start_core_one <= 1;
    start_core_two <= 1;
    start_core_three <= 1;
end

always @(address) begin
    if(address == {8'd5, 8'd5, 8'd5}) begin
        start_core_two <= 0;
        start_core_three <= 0;
    end
    else if(address == {8'd5, 8'd5, 8'd23}) begin
        start_core_one <= 0;
        start_core_two <= 1;
    end
    else if(address == {8'd5, 8'd23, 8'd23}) begin
        start_core_two <= 0;
        start_core_three <= 1;
    end
    else if(address == {8'd23, 8'd23, 8'd23}) begin
        start_core_one <= 1;
        start_core_two <= 1;
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