module registor_no_inc #(
    parameter DATA_LEN = 16
)
(
    input [DATA_LEN - 1:0] c_bus_in,
    input clk,
    input WE,  //Write enable
    output reg [DATA_LEN - 1:0] data_out
);

initial begin
    data_out = 16'd0;
end

always @(posedge clk) begin
    if (WE==1) begin
        data_out <= c_bus_in;
    end 
end
    
endmodule
