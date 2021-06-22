module processor (
    input clk,
    input start,
    output reg finish_process
);

reg start_core_one;
reg start_core_two;
reg start_core_three;

wire read_one;
wire read_two;
wire read_three;

wire write_one;
wire write_two;
wire write_three;

wire [15:0] ram_addr_one; 
wire [15:0] ram_in_one;
wire [15:0] ram_out_one;

wire [15:0] ram_addr_two; 
wire [15:0] ram_in_two;
wire [15:0] ram_out_two;

wire [15:0] ram_addr_three; 
wire [15:0] ram_in_three;
wire [15:0] ram_out_three;

wire finish_core_one;
wire finish_core_two;
wire finish_core_three;

wire [47:0] address;
wire [47:0] data_in;
wire [47:0] data_out;

assign address = {ram_addr_three ,ram_addr_two, ram_addr_one};
assign data_in = {ram_in_three, ram_in_two, ram_in_one};

assign ram_out_one = data_out[15:0];
assign ram_out_two = data_out[31:16];
assign ram_out_three = data_out[47:32];

assign read = read_one ^ read_two ^ read_three;
assign write = write_one ^ write_two ^ write_three;

top_module CORE_ONE(.clk(clk), 
                    .start(start_core_one), 
                    .read(read_one), 
                    .write(write_one), 
                    .ram_addr(ram_addr_one), 
                    .ram_in(ram_in_one), 
                    .ram_out(ram_out_one), 
                    .finish(finish_core_one));

top_module CORE_TWO(.clk(clk), 
                    .start(start_core_two), 
                    .read(read_two), 
                    .write(write_two), 
                    .ram_addr(ram_addr_two), 
                    .ram_in(ram_in_two), 
                    .ram_out(ram_out_two), 
                    .finish(finish_core_two));

top_module CORE_THREE(.clk(clk), 
                    .start(start_core_three), 
                    .read(read_three), 
                    .write(write_three), 
                    .ram_addr(ram_addr_three), 
                    .ram_in(ram_in_three), 
                    .ram_out(ram_out_three), 
                    .finish(finish_core_three));


ram RAM(.clk(clk), 
        .read(read),
        .write(write),
        .address(address),
        .data_in(data_in),
        .data_out(data_out));


always @(finish_core_one or finish_core_two or finish_core_three) begin
    if(finish_core_one == 1 && finish_core_two == 1 && finish_core_three == 1)    finish_process <= 1;
end

always @(start) begin
    start_core_one <= 1;
    start_core_two <= 1;
    start_core_three <= 1;
end

always @(address) begin
    if(address == {16'd5, 16'd5, 16'd5}) begin
        start_core_two <= 0;
        start_core_three <= 0;
    end
    else if(address == {16'd5, 16'd5, 16'd23}) begin
        start_core_one <= 0;
        start_core_two <= 1;
    end
    else if(address == {16'd5, 16'd23, 16'd23}) begin
        start_core_two <= 0;
        start_core_three <= 1;
    end
    else if(address == {16'd23, 16'd23, 16'd23}) begin
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