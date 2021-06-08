module mux (
    output reg [15:0] data,
    input [3:0] select,
    input [15:0] AR, //0000
    input [15:0] DR, //0001
    input [15:0] R1, //0010
    input [15:0] R2, //0011
    input [15:0] R3, //0100
    input [15:0] RA, //0101
    input [15:0] RB, //0110
    input [15:0] RC, //0111
    input [15:0] AC, //1000
    input [15:0] IR  //1010
);

always @(select) begin
    case (select)
        4'b0000: data <= AR;
        4'b0001: data <= DR;
        4'b0010: data <= R1;
        4'b0011: data <= R2;
        4'b0100: data <= R3;
        4'b0101: data <= RA;
        4'b0110: data <= RB;
        4'b0111: data <= RC;
        4'b1000: data <= AC;
        4'b1010: data <= IR;
    endcase
end
    
endmodule