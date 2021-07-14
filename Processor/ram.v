
module ram #(
    parameter DATA_LEN = 16,
    parameter ADDRESS_LEN = 8,
    parameter NO_OF_CORES = 3
)
(
    input clk,
    input read, 
    input write,
    input [ADDRESS_LEN * NO_OF_CORES - 1:0] address,
    input [DATA_LEN * NO_OF_CORES - 1:0] data_in,
    output reg [DATA_LEN * NO_OF_CORES - 1:0] data_out
);
reg [DATA_LEN - 1:0] memory [2 ** ADDRESS_LEN - 1:0];
initial begin
	memory[0] = 6'd4;
	memory[1] = 12'd10;
	memory[2] = 6'd36;
	memory[3] = 6'd4;
	memory[4] = 12'd11;
	memory[5] = 6'd60;
	memory[6] = 6'd8;
	memory[7] = 12'd12;
	memory[8] = 6'd57;
end 
 
initial begin
	memory[10] = 16'd10;
	memory[11] = 16'd20;
	memory[12] = 16'd0;
end

integer i;
always @(posedge clk) begin
    if(read==1) begin
        for(i=0; i<NO_OF_CORES; i=i+1) begin
             data_out[DATA_LEN*i +: DATA_LEN] <= memory[address[ADDRESS_LEN*i +: ADDRESS_LEN]];
         end
    end
    else if(write==1) begin
         for(i=0; i<NO_OF_CORES; i=i+1) begin
             memory[address[ADDRESS_LEN*i +: ADDRESS_LEN]] <= data_in[DATA_LEN*i +: DATA_LEN];
         end
    end
end
endmodule