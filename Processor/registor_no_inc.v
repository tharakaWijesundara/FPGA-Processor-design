module registor_no_inc(
    input [15:0] data_in,
    input clk,
    input WE,  //Write enable
    output reg [15:0] data_out
);

always @(posedge clk) begin
    if (WE==1) begin
        data_out <= data_in;
    end 
end
    
endmodule
