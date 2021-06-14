module registor_no_inc(
    input [15:0] c_bus_in,
    input clk,
    input WE,  //Write enable
    output reg [15:0] data_out
);

always @(posedge clk) begin
    if (WE==1) begin
        data_out <= c_bus_in;
    end 
end
    
endmodule
