module data_registor(
    input [15:0] c_bus_in,
    input [15:0] ram_in,
    input clk,
    input WE,
    input read,
    output reg [15:0] data_out
);

always @(posedge clk) begin
    if(WE==1) begin
        if(read==1)     data_out <= ram_in;
        else            data_out <= c_bus_in;
    end
end

endmodule

