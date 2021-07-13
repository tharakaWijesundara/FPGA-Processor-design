'''| a b c d |   | a b c |   | a b |
   | e f g h |   | d e f |   | c d |
   | i j k l |   | g h i |
   | m n o p |                     3*10 10*2 '''


import numpy as np

fh = open("ram.v", "w")

M1_ROWS = 23
M1M2_COMMON = 24
M2_COLS = 16

VAL_RANGE = 50

mat_1 = np.random.randint(VAL_RANGE, size=(M1_ROWS, M1M2_COMMON))
mat_2 = np.random.randint(VAL_RANGE, size=(M1M2_COMMON, M2_COLS))

print("MATRIX 1 \n")
print(mat_1)
print("----------------------------")
print("MATRIX 2 \n")
print(mat_2)



try:
    fh.write('''
module ram #(
    parameter DATA_LEN = 16,
    parameter ADDRESS_LEN = 8,
    parameter NO_OF_CORES = 3
)
(
    input clk,
    input read, 
    input write,
    input [ADDRESS_LEN * NO_OF_CORES - 1:0] address,
    input [DATA_LEN * NO_OF_CORES - 1:0] data_in,
    output reg [DATA_LEN * NO_OF_CORES - 1:0] data_out
);
reg [DATA_LEN - 1:0] memory [2 ** ADDRESS_LEN - 1:0];\n''')

    fh.write(''' initial begin
        memory[0] = 6'd4;
        memory[1] = 12'h3E;
        memory[2] = 6'd36;
        memory[3] = 6'd4;
        memory[4] = 12'h3F;
        memory[5] = 6'd37;
        memory[6] = 6'd14;\n\n''')

    temp = ""

    temp += "\t\tmemory[7] = 12'h" + \
        (hex(64+M1_ROWS*M1M2_COMMON)[2:]).upper()+";\n\n"

    temp += "\t\tmemory[8] = 6'd16;\n"
    temp += "\t\tmemory[9] = 12'h" + \
        (hex(64+(M1_ROWS*M1M2_COMMON)+(M1M2_COMMON*M2_COLS))[2:]).upper()+";\n\n"
    temp += "\t\tmemory[10] = 6'd12;\n"
    temp += "\t\tmemory[11] = 12'h40;\n"

    fh.write(temp)

    fh.write('''
            memory[12] = 12'd58;
            memory[13] = 6'd4;
            memory[14] = 12'd11;
            memory[15] = 12'd39;
            memory[16] = 6'd8;
            memory[17] = 12'd11;
            memory[18] = 6'd4;
            memory[19] = 12'd9;
            memory[20] = 12'd40;
            memory[21] = 6'd8;
            memory[22] = 12'd9;
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
            memory[34] = 12'h3D;
            memory[35] = 6'd48;
            memory[36] = 6'd8;
            memory[37] = 12'h3D;
            memory[38] = 6'd46;
            memory[39] = 6'd52;
            memory[40] = 12'h17;
            memory[41] = 6'd42;
            memory[42] = 6'd55;
            memory[43] = 6'd8;
            memory[44] = 12'h3D;
            memory[45] = 6'd4;
            memory[46] = 12'h3C;
            memory[47] = 6'd48;
            memory[48] = 6'd8;
            memory[49] = 12'h3C;
            memory[50] = 6'd45;
            memory[51] = 6'd59;
            memory[52] = 6'd52;
            memory[53] = 12'h17;
            memory[54] = 6'd56;
            memory[55] = 6'd55;
            memory[56] = 6'd8;
            memory[57] = 12'h3C;
            memory[58] = 6'd57;
    end \n ''')
    fh.write('''
        initial begin
        memory[60] = 16'd0;
        memory[61] = 16'd0;\n
''')
    temp = ""
    temp += "\t\tmemory[62] = 16'd" + str(M1M2_COMMON) + ";\n"
    temp += "\t\tmemory[63] = 16'd" + str(M2_COLS) + ";\n"
    counter = 63
    for i in range(M1_ROWS):
        for j in range(M1M2_COMMON):
            counter = counter+1
            temp += "\t\tmemory["+str(counter)+"] =16'd"+str(mat_1[i][j])+";\n"
    temp += "\n"
    fh.write(temp)
    temp = ""

    for i in range(M1M2_COMMON):
        for j in range(M2_COLS):
            counter = counter+1
            temp += "\t\tmemory["+str(counter)+"] =16'd"+str(mat_2[i][j])+";\n"
    temp += "\n"
    fh.write(temp)
    temp = ""

    for i in range(M1_ROWS*M2_COLS):
        counter = counter+1
        temp += "\t\tmemory["+str(counter)+"] =16'd0;\n"
    temp += "end\n"
    fh.write(temp)
    temp = ""

    fh.write(
        '''
integer i;
always @(posedge clk) begin
    if(read==1) begin
        for(i=0; i<NO_OF_CORES; i=i+1) begin
             data_out[DATA_LEN*i +: DATA_LEN] <= memory[address[ADDRESS_LEN*i +: ADDRESS_LEN]];
         end
    end
    else if(write==1) begin
         for(i=0; i<NO_OF_CORES; i=i+1) begin
             memory[address[ADDRESS_LEN*i +: ADDRESS_LEN]] <= data_in[DATA_LEN*i +: DATA_LEN];
         end
    end
end
endmodule''')

finally:
    fh.close()


result = [[0 for x in range(M2_COLS)] for y in range(M1_ROWS)]
# iterate through rows of X
for i in range(M1_ROWS):
    # iterate through columns of Y
    for j in range(M2_COLS):
        # iterate through rows of Y
        for k in range(M1M2_COMMON):
            result[i][j] += mat_1[i][k] * mat_2[k][j]

for r in result:
    print(r)





