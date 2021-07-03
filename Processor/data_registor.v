module data_registor #(
    parameter DATA_LEN = 16
)
(
    input [DATA_LEN - 1:0] c_bus_in,
    input [DATA_LEN - 1:0] ram_out,
    input clk,
    input WE,
    input read,
    output reg [DATA_LEN - 1:0] data_out
);

always @(c_bus_in or ram_out) begin
    if(WE==1) begin
        data_out <= c_bus_in;
    end
    else begin
        if(read==1)    data_out <= ram_out;
    end 
end

endmodule


