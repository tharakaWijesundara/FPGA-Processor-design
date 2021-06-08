module registor_with_inc(
    input [15:0] data_in,
    input clk,
    input RW,
    input inc,
    output reg [15:0] data_out
);

reg [15:0] stored_data;
//Read - 1 ,write - 0

always @(posedge clk) begin
    if (inc) begin
        stored_data <= data_in + 1;
    end
    
    else begin
        if (RW==1) begin
            data_out <= stored_data;
        end else begin
            stored_data <= data_in;
        end 
    end
end
    
endmodule 