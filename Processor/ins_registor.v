module ins_registor
#(
    parameter INSTRUCTION_LEN = 6,
    parameter DATA_LEN = 16
)
(
    input [DATA_LEN - 1:0] DR_out,
    input [INSTRUCTION_LEN - 1:0] counter_out,
    input clk,
    input LDIR,
    output reg [INSTRUCTION_LEN - 1:0] data_out
);



always @(counter_out or LDIR) begin
	if(LDIR==1) begin
        data_out <= DR_out[INSTRUCTION_LEN - 1:0];
    end 
    else if(counter_out != 6'd0) begin
        data_out <= counter_out;
    end
    
end

endmodule
