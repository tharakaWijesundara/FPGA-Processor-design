module ins_registor
#(
    parameter INSTRUCTION_LEN = 6,
    parameter DATA_LEN = 16
)
(
    input [DATA_LEN - 1:0] DR_in,
    input [INSTRUCTION_LEN - 1:0] counter_out,
    input clk,
    input LDIR,
    output reg [INSTRUCTION_LEN - 1:0] data_out
);

always @(LDIR) begin
    if(LDIR==1) begin
        data_out <= DR_in[INSTRUCTION_LEN - 1:0];
        $display("%d", data_out);
    end 
end


always @(counter_out) begin
    if(counter_out != 6'd0) begin
        data_out <= counter_out;
    end
    
end

endmodule
