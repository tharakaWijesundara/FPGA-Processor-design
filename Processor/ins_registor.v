module ins_registor(
    input [15:0] DR_in,
    input [5:0] counter_in,
    input clk,
    input LDIR,
    output reg [5:0] data_out
);

always @(posedge clk) begin
    if(LDIR)    data_out <= DR_in[5:0];
    else        data_out <= counter_in;
end

endmodule
