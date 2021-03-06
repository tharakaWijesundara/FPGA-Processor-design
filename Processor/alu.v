//000  Add
//001  Sub
//010  Mullt
//011  Pass A
//100  Pass B
module alu (
    input clk,
    input [15:0] A,
    input [15:0] B,
    input [2:0] select,
    output reg z_flag,
    output reg [15:0] out,
    output reg finish
);

always @(A or select) begin
    // $display(select);
    case (select)
        3'b000 : begin
            out <= A + B;
            if(B + A == 0)  z_flag <= 1;
            else            z_flag <= 0;
        end
        3'b001 : begin
            out <= A - B;
            if(A - B == 0)  z_flag <= 1; 
            else            z_flag <= 0;
        end
        3'b010 : begin
            out <= B * A;
        end
        3'b011 : begin
            out <= A;
        end
        3'b100 : begin
            out <= B;
        end
        3'b101 : begin
            out <= 16'd0;
        end
        3'b110 : begin
            finish <= 1;
        end
    endcase  
end
    
endmodule
