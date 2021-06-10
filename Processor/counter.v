module counter (
    input clk,
    input [5:0] IRIn,
    input start,
    output reg[5:0] mIR,
    output [5:0] IROut
);
reg counter = 0;
parameter [5:0] FETCH [2 : 0]   = {6'd1, 6'd2, 6'd3};
parameter [5:0] LDAC [3 : 0]   = {6'd4, 6'd5, 6'd6, 6'd7};
parameter [5:0] STAC [3 : 0]   = {6'd8, 6'd9, 6'd10, 6'd11};
parameter [5:0] LDRA [1 : 0]   = {6'd12, 6'd13};
parameter [5:0] LDRB [1 : 0]   = {6'd14, 6'd15};
parameter [5:0] LDRC [1 : 0]   = {6'd16, 6'd17};
parameter [5:0] LDACRA [2 : 0]   = {6'd18, 6'd19, 6'd20};
parameter [5:0] LDACRB [2 : 0]   = {6'd21, 6'd22, 6'd23};
parameter [5:0] LDACRC [2 : 0]   = {6'd24, 6'd25, 6'd26};
parameter [5:0] STACRA [2 : 0]   = {6'd27, 6'd28, 6'd29};
parameter [5:0] STACRB [2 : 0]   = {6'd30, 6'd31, 6'd32};
parameter [5:0] STACRC [2 : 0]   = {6'd33, 6'd34, 6'd35};
parameter [5:0] MVACR1 [0]   = {6'd36};
parameter [5:0] MVACR2 [0]   = {6'd37};
parameter [5:0] MVACR3 [0]   = {6'd38};
parameter [5:0] ADD1 [0]   = {6'd39};
parameter [5:0] ADD2 [0]   = {6'd40};
parameter [5:0] ADD3 [0]   = {6'd41};
parameter [5:0] INCRA [0]   = {6'd42};
parameter [5:0] INCRB [0]   = {6'd43};
parameter [5:0] INCRC [0]   = {6'd44};
parameter [5:0] SUB1 [0]   = {6'd45};
parameter [5:0] SUB2 [0]   = {6'd46};
parameter [5:0] SUB3 [0]   = {6'd47};
parameter [5:0] INAC [0]   = {6'd48};
parameter [5:0] MULT1 [0]   = {6'd49};
parameter [5:0] MULT2 [0]   = {6'd50};
parameter [5:0] MULT3 [0]   = {6'd51};
parameter [5:0] JPNZY [1 : 0]   = {6'd52, 6'd53};
parameter [5:0] JPNZN [0]   = {6'd54};
parameter [5:0] CLAC [0]   = {6'd55};
parameter [5:0] NOP [0]   = {6'd56};

always @(posedge clk) begin
    case(IRIn)
        6'd1 : begin
            mIR <= FETCH[counter];
            counter <= counter + 1;
            if(counter == FETCH.size()-1)    
            begin
                counter <= 0;
                
            end
            
        end
        6'd4 : begin
            mIR <= LDAC[counter];
            counter <= counter + 1;
            if(counter == LDAC.size()-1)    
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd8 : begin
            mIR <= STAC[counter];
            counter <= counter + 1;
            if(counter == STAC.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd12 : begin
            mIR <= LDRA[counter];
            counter <= counter + 1;
            if(counter == LDRA.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd14 : begin
            mIR <= LDRB[counter];
            counter <= counter + 1;
            if(counter == LDRB.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd16 : begin
            mIR <= LDRC[counter];
            counter <= counter + 1;
            if(counter == LDRC.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd18 : begin
            mIR <= LDACRA[counter];
            counter <= counter + 1;
            if(counter == LDACRA.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd21 : begin
            mIR <= LDACRB[counter];
            counter <= counter + 1;
            if(counter == LDACRB.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd24 : begin
            mIR <= LDACRC[counter];
            counter <= counter + 1;
            if(counter == LDACRC.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd27 : begin
            mIR <= STACRA[counter];
            counter <= counter + 1;
            if(counter == STACRA.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd30 : begin
            mIR <= STACRB[counter];
            counter <= counter + 1;
            if(counter == STACRB.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd33 : begin
            mIR <= STACRC[counter];
            counter <= counter + 1;
            if(counter == STACRC.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd36 : begin
            mIR <= MVACR1[counter];
            counter <= counter + 1;
            if(counter == MVACR1.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd37 : begin
            mIR <= MVACR2[counter];
            counter <= counter + 1;
            if(counter == MVACR2.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd38 : begin
            mIR <= MVACR3[counter];
            counter <= counter + 1;
            if(counter == MVACR3.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd39 : begin
            mIR <= ADD1[counter];
            counter <= counter + 1;
            if(counter == ADD1.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd40 : begin
            mIR <= ADD2[counter];
            counter <= counter + 1;
            if(counter == ADD2.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd41 : begin
            mIR <= ADD3[counter];
            counter <= counter + 1;
            if(counter == ADD3.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd42 : begin
            mIR <= INCRA[counter];
            counter <= counter + 1;
            if(counter == INCRA.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd43 : begin
            mIR <= INCRB[counter];
            counter <= counter + 1;
            if(counter == INCRB.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd44 : begin
            mIR <= INCRC[counter];
            counter <= counter + 1;
            if(counter == INCRC.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd45 : begin
            mIR <= SUB1[counter];
            counter <= counter + 1;
            if(counter == SUB1.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd46 : begin
            mIR <= SUB2[counter];
            counter <= counter + 1;
            if(counter == SUB2.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd47 : begin
            mIR <= SUB3[counter];
            counter <= counter + 1;
            if(counter == SUB3.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd48 : begin
            mIR <= INAC[counter];
            counter <= counter + 1;
            if(counter == INAC.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd49 : begin
            mIR <= MULT1[counter];
            counter <= counter + 1;
            if(counter == MULT1.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd50 : begin
            mIR <= MULT2[counter];
            counter <= counter + 1;
            if(counter == MULT2.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd51 : begin
            mIR <= MULT3[counter];
            counter <= counter + 1;
            if(counter == MULT3.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd52 : begin
            mIR <= JPNZY[counter];
            counter <= counter + 1;
            if(counter == JPNZY.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd54 : begin
            mIR <= JPNZN[counter];
            counter <= counter + 1;
            if(counter == JPNZN.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd55 : begin
            mIR <= CLAC[counter];
            counter <= counter + 1;
            if(counter == CLAC.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        6'd56 : begin
            mIR <= NOP[counter];
            counter <= counter + 1;
            if(counter == NOP.size()-1)
            begin
                counter <= 0;
                IROut <= 6'd1;
            end
        end
        default: counter <= 0;
    endcase

end


    
endmodule