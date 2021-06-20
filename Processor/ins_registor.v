module ins_registor(
    input [15:0] DR_in,
    input [5:0] counter_out,
    input clk,
    input LDIR,
    output reg [5:0] data_out
);

always @(LDIR) begin
    if(LDIR==1) begin
        data_out <= DR_in[5:0];
        $display("%d", data_out);
    end 
end


always @(counter_out) begin
    if(counter_out != 6'd0) begin
        data_out <= counter_out;
    end
    
end

endmodule
