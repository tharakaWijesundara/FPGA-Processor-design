module dmux (
    input [15:0] data,
    input [3:0] select,
    output [15:0] reg AR, //0000
    output [15:0] reg DR, //0001
    output [15:0] reg R1, //0010
    output [15:0] reg R2, //0011
    output [15:0] reg R3, //0100
    output [15:0] reg RA, //0101
    output [15:0] reg RB, //0110
    output [15:0] reg RC, //0111
    output [15:0] reg AC, //1000
    output [15:0] reg IR  //1010
);

always @(select) begin
    case (select)
        4'b0000: AR <= data;
        4'b0001: DR <= data;
        4'b0010: R1 <= data;
        4'b0011: R2 <= data;
        4'b0100: R3 <= data;
        4'b0101: RA <= data;
        4'b0110: RB <= data;
        4'b0111: RC <= data;
        4'b1000: AC <= data;
        4'b1010: IR <= data;
    endcase
end
    
endmodule