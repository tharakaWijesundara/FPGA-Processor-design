module address_registor #(
    parameter DATA_LEN = 16,
    parameter ADDRESS_LEN = 8
)
(
    input [DATA_LEN - 1:0] c_bus_in,
    input clk,
    input WE,  //Write enable
    output reg [ADDRESS_LEN - 1:0] data_out
);

always @(c_bus_in or WE) begin
    if (WE==1) begin
        data_out <= c_bus_in[ADDRESS_LEN - 1:0];
    end 
end
    
endmodule
