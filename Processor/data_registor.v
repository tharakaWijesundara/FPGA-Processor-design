module data_registor(
    input [15:0] c_bus_in,
    input [15:0] ram_in,
    input clk,
    input WE,
    input read,
    output reg [15:0] data_out
);

always @(c_bus_in or ram_in) begin
    if(WE==1) begin
        data_out <= c_bus_in;
    end
    else begin
        if(read==1)    data_out <= ram_in;
    end 
end

endmodule

