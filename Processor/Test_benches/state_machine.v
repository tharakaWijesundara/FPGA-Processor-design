
module state_machine (
    input clk,
    input [5:0] IR,
    output reg [3:0] A_bus,
    output reg [2:0] ALU,
    output reg [9:0] C_bus,
    output reg LDIR,PC_INC,AC_INC,RA_INC,RB_INC,RC_INC,read,write

);

always @(posedge clk) begin
    case (IR)
    //FETCH1
        6'b000001: begin
            A_bus <= 4'b1010;
            ALU <= 3'b011;
            C_bus <= 10'b0000000010;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //FETCH2
        6'b000010: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 1;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //FETCH3
        6'b000011: begin
            A_bus <= 4'b1010;
            ALU <= 3'b011;
            C_bus <= 10'b0000000010;
            LDIR <= 1;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //LDAC1
        6'b000100: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 1;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //LDAC2
        6'b000101: begin
            A_bus <= 4'b0110;
            ALU <= 3'b011;
            C_bus <= 10'b0000000010;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //LDAC3
        6'b000110: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //LDAC4
        6'b000111: begin
            A_bus <= 4'b0110;
            ALU <= 3'b011;
            C_bus <= 10'b0000000001;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //STAC1
        6'b001000: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 1;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //STAC2
        6'b001001: begin
            A_bus <= 4'b0110;
            ALU <= 3'b011;
            C_bus <= 10'b0000000010;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //STAC3
        6'b001010: begin
            A_bus <= 4'b1001;
            ALU <= 3'b011;
            C_bus <= 10'b0000000100;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 1;
        end
    //STAC4
        6'b001011: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 1;
        end
    //LDRA1
        6'b001100: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 1;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //LDRA2
        6'b001101: begin
            A_bus <= 4'b0110;
            ALU <= 3'b011;
            C_bus <= 10'b0100000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //LDRB1
        6'b001110: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 1;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //LDRB2
        6'b001111: begin
            A_bus <= 4'b0110;
            ALU <= 3'b011;
            C_bus <= 10'b0010000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //LDRC1
        6'b010000: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 1;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //LDRC2
        6'b010001: begin
            A_bus <= 4'b0110;
            ALU <= 3'b011;
            C_bus <= 10'b0001000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //LDACRA1
        6'b010010: begin
            A_bus <= 4'b0000;
            ALU <= 3'b011;
            C_bus <= 10'b0000000010;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //LDACRA2
        6'b010011: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //LDACRA3
        6'b010100: begin
            A_bus <= 4'b0110;
            ALU <= 3'b011;
            C_bus <= 10'b0000000001;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //LDACRB1
        6'b010101: begin
            A_bus <= 4'b0001;
            ALU <= 3'b011;
            C_bus <= 10'b0000000010;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //LDACRB2
        6'b010110: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //LDACRB3
        6'b010111: begin
            A_bus <= 4'b0110;
            ALU <= 3'b011;
            C_bus <= 10'b0000000001;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //LDACRC1
        6'b011000: begin
            A_bus <= 4'b0010;
            ALU <= 3'b011;
            C_bus <= 10'b0000000010;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //LDACRC2
        6'b011001: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //LDACRC3
        6'b011010: begin
            A_bus <= 4'b0110;
            ALU <= 3'b011;
            C_bus <= 10'b0000000001;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //STACRA1
        6'b011011: begin
            A_bus <= 4'b0000;
            ALU <= 3'b011;
            C_bus <= 10'b0000000010;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //STACRA2
        6'b011100: begin
            A_bus <= 4'b1001;
            ALU <= 3'b011;
            C_bus <= 10'b0000000100;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 1;
        end
    //STACRA3
        6'b011101: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 1;
        end
    //STACRB1
        6'b011110: begin
            A_bus <= 4'b0001;
            ALU <= 3'b011;
            C_bus <= 10'b0000000010;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //STACRB2
        6'b011111: begin
            A_bus <= 4'b1001;
            ALU <= 3'b011;
            C_bus <= 10'b0000000100;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 1;
        end
    //STACRB3
        6'b100000: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 1;
        end
    //STACRC1
        6'b100001: begin
            A_bus <= 4'b0010;
            ALU <= 3'b011;
            C_bus <= 10'b0000000010;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //STACRC2
        6'b100010: begin
            A_bus <= 4'b1001;
            ALU <= 3'b011;
            C_bus <= 10'b0000000100;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 1;
        end
    //STACRC3
        6'b100011: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 1;
        end
    //MVACR1 1
        6'b100100: begin
            A_bus <= 4'b1001;
            ALU <= 3'b011;
            C_bus <= 10'b0000100000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //MVACR2 1
        6'b100101: begin
            A_bus <= 4'b1001;
            ALU <= 3'b011;
            C_bus <= 10'b0000010000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //MVACR3 1
        6'b100110: begin
            A_bus <= 4'b1001;
            ALU <= 3'b011;
            C_bus <= 10'b0000001000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //ADD1
        6'b100111: begin
            A_bus <= 4'b0011;
            ALU <= 3'b000;
            C_bus <= 10'b0000000001;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //ADD2
        6'b101000: begin
            A_bus <= 4'b0100;
            ALU <= 3'b000;
            C_bus <= 10'b0000000001;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //ADD3
        6'b101001: begin
            A_bus <= 4'b0101;
            ALU <= 3'b000;
            C_bus <= 10'b0000000001;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //INCRA
        6'b101010: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 1;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //INCRB
        6'b101011: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 1;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //INCRC
        6'b101100: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 1;
            read <= 0;
            write <= 0;
        end
    //SUB1
        6'b101101: begin
            A_bus <= 4'b0011;
            ALU <= 3'b001;
            C_bus <= 10'b0000000001;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //SUB2
        6'b101110: begin
            A_bus <= 4'b0100;
            ALU <= 3'b001;
            C_bus <= 10'b0000000001;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //SUB3
        6'b101111: begin
            A_bus <= 4'b0101;
            ALU <= 3'b001;
            C_bus <= 10'b0000000001;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //INAC
        6'b110000: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 1;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //MULT1
        6'b110001: begin
            A_bus <= 4'b0011;
            ALU <= 3'b010;
            C_bus <= 10'b0000000001;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //MULT2
        6'b110010: begin
            A_bus <= 4'b0100;
            ALU <= 3'b010;
            C_bus <= 10'b0000000001;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //MULT3
        6'b110011: begin
            A_bus <= 4'b0101;
            ALU <= 3'b010;
            C_bus <= 10'b0000000001;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //JPNZY1
        6'b110100: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 1;
            write <= 0;
        end
    //JPNZY2
        6'b110101: begin
            A_bus <= 4'b0110;
            ALU <= 3'b011;
            C_bus <= 10'b1000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //JPNZN1
        6'b110110: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 1;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //CLAC1
        6'b110111: begin
            A_bus <= 4'b1111;
            ALU <= 3'b101;
            C_bus <= 10'b0000000001;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //NOP
        6'b111000: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    //NOP
        default: begin
            A_bus <= 4'b1111;
            ALU <= 3'b111;
            C_bus <= 10'b0000000000;
            LDIR <= 0;
            PC_INC <= 0;
            AC_INC <= 0;
            RA_INC <= 0;
            RB_INC <= 0;
            RC_INC <= 0;
            read <= 0;
            write <= 0;
        end
    endcase
    
end
    
endmodule