'''| a b c d |   | a b c |   | a b |
   | e f g h |   | d e f |   | c d |
   | i j k l |   | g h i |
   | m n o p |                     3*2 2*1 '''


fh = open("ram.v", "w")
mat_1 = [1, 3, 1, 5, 3, 4]
mat_2 = [1, 3]
M = 1
N = 2


try:
    fh.write('''
module ram #(
    parameter DATA_LEN = 16,
    parameter ADDRESS_LEN = 8
)
(
    input clk,
    input read, 
    input write,
    input [ADDRESS_LEN * 3 - 1:0] address,
    input [DATA_LEN * 3 - 1:0] data_in,
    output reg [DATA_LEN * 3 - 1:0] data_out
);

reg [DATA_LEN - 1:0] memory [2 ** ADDRESS_LEN - 1:0];\n''')

    fh.write(''' initial begin
        memory[0] = 6'd4;
        memory[1] = 8'h3E;
        memory[2] = 6'd36;
        memory[3] = 6'd4;
        memory[4] = 8'h3F;
        memory[5] = 6'd37;
        memory[6] = 6'd14;\n\n''')

    temp = ""
    temp += "\t\tmemory[7] = 8'h"+(hex(64+len(mat_1))[2:]).upper()+";\n\n"

    temp += "\t\tmemory[8] = 6'd16;\n"
    temp += "\t\tmemory[9] = 8'h" + \
        (hex(64+len(mat_1)+len(mat_2))[2:]).upper()+";\n\n"
    temp += "\t\tmemory[10] = 6'd12;\n"
    temp += "\t\tmemory[11] = 6'h40;\n"
    
    fh.write(temp)

    fh.write('''  
            memory[12] = 8'd58;
            memory[13] = 6'd4;
            memory[14] = 8'd11;
            memory[15] = 8'd39;
            memory[16] = 6'd8;
            memory[17] = 8'd11;
            memory[18] = 6'd4;
            memory[19] = 8'd9;
            memory[20] = 8'd40;
            memory[21] = 6'd8;
            memory[22] = 8'd9;
            memory[23] = 6'd18;
            memory[24] = 6'd38;
            memory[25] = 6'd21;
            memory[26] = 6'd51;
            memory[27] = 6'd38;
            memory[28] = 6'd24;
            memory[29] = 6'd41;
            memory[30] = 6'd33;
            memory[31] = 6'd43;
            memory[32] = 6'd44;
            memory[33] = 6'd4;
            memory[34] = 8'h3D;
            memory[35] = 6'd48;
            memory[36] = 6'd8;
            memory[37] = 8'h3D;
            memory[38] = 6'd46;
            memory[39] = 6'd52;
            memory[40] = 8'h17;
            memory[41] = 6'd42;
            memory[42] = 6'd55;
            memory[43] = 6'd8;
            memory[44] = 8'h3D;
            memory[45] = 6'd4;
            memory[46] = 8'h3C;
            memory[47] = 6'd48;
            memory[48] = 6'd8;
            memory[49] = 8'h3C;
            memory[50] = 6'd45;
            memory[51] = 6'd59;
            memory[52] = 6'd52;
            memory[53] = 8'h17;
            memory[54] = 6'd56;
            memory[55] = 6'd55;
            memory[56] = 6'd8;
            memory[57] = 8'h3C;
            memory[58] = 6'd57;
    end \n ''')
    fh.write('''
        initial begin
        memory[60] = 16'd0;
        memory[61] = 16'd0;\n
''')
    temp = ""
    temp += "\t\tmemory[62] = 6'h" + str(N) +";\n"
    temp += "\t\tmemory[63] = 6'h" + str(M) +";\n"
    counter = 64
    for i in range(len(mat_1)):
        counter = 64+i
        temp += "\t\tmemory["+str(counter)+"] =16'd"+str(mat_1[i])+";\n"
    temp += "\n"
    fh.write(temp)
    temp = ""
    counter += 1
    for i in range(len(mat_2)):
        counter = counter+i
        temp += "\t\tmemory["+str(counter)+"] =16'd"+str(mat_2[i])+";\n"
    temp += "\n"
    fh.write(temp)
    temp = ""
    counter += 1
    for i in range(int((len(mat_1)/N)*M)):
        counter = counter+i
        temp += "\t\tmemory["+str(counter)+"] =16'd0;\n"
    temp += "end\n"
    fh.write(temp)
    temp = ""
    counter += 1

    fh.write(
        '''
always @(posedge clk) begin
    if(read==1) begin
        data_out <= {
            memory[address[ADDRESS_LEN * 3 - 1:ADDRESS_LEN * 2]],
            memory[address[ADDRESS_LEN * 2 - 1:ADDRESS_LEN]], 
            memory[address[ADDRESS_LEN - 1:0]]
            };
    end

    else if(write==1) begin
        memory[address[ADDRESS_LEN - 1:0]] <= data_in[DATA_LEN - 1:0];
        memory[address[ADDRESS_LEN * 2 - 1:ADDRESS_LEN]] <= data_in[DATA_LEN * 2 - 1:DATA_LEN];
        memory[address[ADDRESS_LEN * 3 - 1:ADDRESS_LEN * 2]] <= data_in[DATA_LEN * 3 - 1:DATA_LEN * 2];
    end
end

endmodule''')

finally:
    fh.close()



