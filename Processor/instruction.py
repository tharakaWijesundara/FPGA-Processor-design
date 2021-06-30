'''| a b c d |   | a b c |   | a b |
   | e f g h |   | d e f |   | c d |
   | i j k l |   | g h i |
   | m n o p |                     3*2 2*1 '''


fh = open("ram1.v", "w")
mat_1 = [1, 3, 1, 5, 3, 4]
mat_2 = [1, 3]
M = 1
N = 2


try:
    fh.write('''module ram(
        input clk,
        input read,
        input write,
        input [15:0] address,
        input [15:0] data_in,
        output reg [15:0] data_out
        );

        reg [15:0] memory [254:0];\n'''
             )

    fh.write(''' initial begin
        memory[0] = 6'd4;
        memory[1] = 8'h34;

        memory[2] = 6'd36;

        memory[3] = 6'd4;
        memory[4] = 8'h35;

        memory[5] = 6'd37;


        memory[6] = 6'd12;
        memory[7] = 8'h36;\n\n''')
    temp = ""
    temp += "\t\tmemory[8] = 6'd14;\n"
    temp += "\t\tmemory[9] = 8'h"+(hex(54+len(mat_1))[2:]).upper()+";\n\n"

    temp += "\t\tmemory[10] = 6'd16;\n"
    temp += "\t\tmemory[11] = 8'h" + \
        (hex(54+len(mat_1)+len(mat_2))[2:]).upper()+";\n\n"
    fh.write(temp)

    fh.write('''        
        memory[12] = 6'd18;

        memory[13] = 6'd38;

        memory[14] = 6'd21;

        memory[15] = 6'd51;

        memory[16] = 6'd38;

        memory[17] = 6'd24;

        memory[18] = 6'd41;

        memory[19] = 6'd33;

        memory[20] = 6'd43;

        memory[21] = 6'd44;

        memory[22] = 6'd4;
        memory[23] = 8'h33;

        memory[24] = 6'd48;

        memory[25] = 6'd8;
        memory[26] = 8'h33;

        memory[27] = 6'd46;

        memory[28] = 6'd52;// JPNZ Loop L1
        memory[29] = 8'h0C;

        memory[30] = 6'd42;

        memory[31] = 6'd55;

        memory[32] = 6'd8;
        memory[33] = 8'h33;

        memory[34] = 6'd4;
        memory[35] = 8'h32;

        memory[36] = 6'd48;

        memory[37] = 6'd8;
        memory[38] = 8'h32;

        memory[39] = 6'd45;

        memory[40] = 6'd16;
        memory[41] = 8'h56;

        memory[42] = 6'd52;// JPNZ Loop L1
        memory[43] = 8'h0C; 

        memory[44] = 6'd56;

        memory[45] = 6'd57;// END
    end \n ''')
    fh.write('''
        initial begin
        memory[50] = 16'd0;
        memory[51] = 16'd0;


        memory[52] = 16'd2;
        memory[53] = 16'd2;\n
''')
    temp = ""
    counter = 54
    for i in range(len(mat_1)):
        counter = 54+i
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
        '''always @(posedge clk) begin
                if(read==1) begin
                    data_out <= memory[address[7:0]];
                end

                if(write==1) begin
                    memory[address[7:0]] <= data_in;
                end
            end

    endmodule''')

finally:
    fh.close()
