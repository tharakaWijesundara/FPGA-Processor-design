module address_registor(
    input [15:0] c_bus_in,
    input clk,
    input WE,  //Write enable
    output reg [15:0] data_out
);

initial begin
    data_out = 16'd0;
end


always @(c_bus_in or WE) begin
    if (WE==1) begin
        data_out <= c_bus_in;
    end 
end
    
endmodule
