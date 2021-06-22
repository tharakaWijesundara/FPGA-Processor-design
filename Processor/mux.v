module mux (
    input clk,
    output reg [15:0] data_out,
    input [3:0] select,
    input [15:0] DR, //0110
    input [15:0] R1, //0011
    input [15:0] R2, //0100
    input [15:0] R3, //0101
    input [15:0] RA, //0000
    input [15:0] RB, //0001
    input [15:0] RC, //0010
    input [15:0] RD, //0111
    input [15:0] AC, //1001
    input [15:0] PC  //1010
);

always @(select) begin
    // $display("#########");
    // $display(select);
    case (select)
        4'b0110: data_out <= DR;
        4'b0011: data_out <= R1;
        4'b0100: data_out <= R2;
        4'b0101: data_out <= R3;
        4'b0000: data_out <= RA;
        4'b0001: data_out <= RB;
        4'b0010: data_out <= RC;
        4'b0111: data_out <= RD;
        4'b1001: data_out <= AC;
        4'b1010: data_out <= PC;
    endcase
    // $display("///////");
    // $display(DR);
    // $display(R1);
    // $display(R2);
    // $display(R3);
    // $display(RA);
    // $display(RB);
    // $display(RC);
    // $display(AC);
    // $display(PC);
    // $display("%%%%%%");
    // $display(data_out);
end
    
endmodule