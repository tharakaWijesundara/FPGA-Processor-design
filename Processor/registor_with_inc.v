module registor_with_inc(
    input [15:0] data_in,
    input clk,
    input WE,  //Write enable
    input inc, 
    output reg [15:0] data_out
);

always @(posedge clk) begin
    if (inc) begin
        data_out <= data_out + 1;
    end
    
    else begin
        if (WE==1) begin
            data_out <= data_in;
        end
    end
end
    
endmodule 