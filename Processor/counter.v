module counter (
    input clk,
    input [5:0] IRIn,
    input start,
    output reg[5:0] mIR,
    output reg[5:0] IROut
);
reg [1:0] counter = 0;

always @(posedge clk) begin
    case(IRIn)
        6'd1 : begin
            case(counter)
                2'd0 : mIR <= 6'd1;
                2'd1 : mIR <= 6'd2;
                2'd2 : mIR <= 6'd3; 
            endcase
            counter <= counter + 1;
            if(counter == 2'd2)    
            begin
                counter <= 2'd0;  
            end
            
        end
        6'd4 : begin
            case(counter)
                2'd0 : mIR <= 6'd4;
                2'd1 : mIR <= 6'd5;
                2'd2 : mIR <= 6'd6; 
                2'd3 : mIR <= 6'd7; 
            endcase
            counter <= counter + 1;
            if(counter == 2'd3)    
            begin
                counter <= 2'd0;
                IROut <= 6'd1;
            end
        end
        6'd8 : begin
            case(counter)
                2'd0 : mIR <= 6'd8;
                2'd1 : mIR <= 6'd9;
                2'd2 : mIR <= 6'd10; 
                2'd3 : mIR <= 6'd11; 
            endcase
            counter <= counter + 1;
            if(counter == 2'd3)
            begin
                counter <= 2'd0;
                IROut <= 6'd1;
            end
        end
        6'd12 : begin
            case(counter)
                2'd0 : mIR <= 6'd12;
                2'd1 : mIR <= 6'd13;
            endcase
            counter <= counter + 1;
            if(counter == 2'd1)
            begin
                counter <= 2'd0;
                IROut <= 6'd1;
            end
        end
        6'd14 : begin
            case(counter)
                2'd0 : mIR <= 6'd14;
                2'd1 : mIR <= 6'd15; 
            endcase
            counter <= counter + 1;
            if(counter == 2'd1)
            begin
                counter <= 2'd0;
                IROut <= 6'd1;
            end
        end
        6'd16 : begin
            case(counter)
                2'd0 : mIR <= 6'd16;
                2'd1 : mIR <= 6'd17;
            endcase
            counter <= counter + 1;
            if(counter == 2'd1)
            begin
                counter <= 2'd0;
                IROut <= 6'd1;
            end
        end
        6'd18 : begin
            case(counter)
                2'd0 : mIR <= 6'd18;
                2'd1 : mIR <= 6'd19;
                2'd2 : mIR <= 6'd20;
            endcase
            counter <= counter + 1;
            if(counter == 2'd2)
            begin
                counter <= 2'd0;
                IROut <= 6'd1;
            end
        end
        6'd21 : begin
            case(counter)
                2'd0 : mIR <= 6'd21;
                2'd1 : mIR <= 6'd22;
                2'd2 : mIR <= 6'd23;
            endcase
            counter <= counter + 1;
            if(counter == 2'd2)
            begin
                counter <= 2'd0;
                IROut <= 6'd1;
            end
        end
        6'd24 : begin
            case(counter)
                2'd0 : mIR <= 6'd24;
                2'd1 : mIR <= 6'd25;
                2'd2 : mIR <= 6'd26;
            endcase
            counter <= counter + 1;
            if(counter == 2'd2)
            begin
                counter <= 2'd0;
                IROut <= 6'd1;
            end
        end
        6'd27 : begin
            case(counter)
                2'd0 : mIR <= 6'd27;
                2'd1 : mIR <= 6'd28;
                2'd2 : mIR <= 6'd29;
            endcase
            counter <= counter + 1;
            if(counter == 2'd2)
            begin
                counter <= 2'd0;
                IROut <= 6'd1;
            end
        end
        6'd30 : begin
            case(counter)
                2'd0 : mIR <= 6'd30;
                2'd1 : mIR <= 6'd31;
                2'd2 : mIR <= 6'd32;
            endcase
            counter <= counter + 1;
            if(counter == 2'd2)
            begin
                counter <= 2'd0;
                IROut <= 6'd1;
            end
        end
        6'd33 : begin
            case(counter)
                2'd0 : mIR <= 6'd33;
                2'd1 : mIR <= 6'd34;
                2'd2 : mIR <= 6'd35;
            endcase
            counter <= counter + 1;
            if(counter == 2'd2)
            begin
                counter <= 2'd0;
                IROut <= 6'd1;
            end
        end
        6'd36 : begin
            mIR <= 6'd36;
            IROut <= 6'd1;
        end
        6'd37 : begin
            mIR <= 6'd37;
            IROut <= 6'd1;
        end
        6'd38 : begin
            mIR <= 6'd38;
            IROut <= 6'd1;
        end
        6'd39 : begin
            mIR <= 6'd39;
            IROut <= 6'd1;
        end
        6'd40 : begin
            mIR <= 6'd40;
            IROut <= 6'd1;
        end
        6'd41 : begin
            mIR <= 6'd41;
            IROut <= 6'd1;
        end
        6'd42 : begin
            mIR <= 6'd42;
            IROut <= 6'd1;
        end
        6'd43 : begin
            mIR <= 6'd43;
            IROut <= 6'd1;
        end
        6'd44 : begin
            mIR <= 6'd44;
            IROut <= 6'd1;
        end
        6'd45 : begin
            mIR <= 6'd45;
            IROut <= 6'd1;
        end
        6'd46 : begin
            mIR <= 6'd46;
            IROut <= 6'd1;
        end
        6'd47 : begin
            mIR <= 6'd47;
            IROut <= 6'd1;
        end
        6'd48 : begin
            mIR <= 6'd48;
            IROut <= 6'd1;
        end
        6'd49 : begin
            mIR <= 6'd49;
            IROut <= 6'd1;
        end
        6'd50 : begin
            mIR <= 6'd50;
            IROut <= 6'd1;
        end
        6'd51 : begin
            mIR <= 6'd51;
            IROut <= 6'd1;
        end
        6'd52 : begin
            case(counter)
                2'd0 : mIR <= 6'd52;
                2'd1 : mIR <= 6'd53;
            endcase
            counter <= counter + 1;
            if(counter == 2'd1)
            begin
                counter <= 2'd0;
                IROut <= 6'd1;
            end
        end
        6'd54 : begin
            mIR <= 6'd54;
            IROut <= 6'd1;
        end
        6'd55 : begin
            mIR <= 6'd55;
            IROut <= 6'd1;
        end
        6'd56 : begin
            mIR <= 6'd56;
            IROut <= 6'd1;
        end
        default: begin
            counter <= 2'd0;
            IROut <= 6'd1;
            mIR <= 6'd56;
        end
    endcase

end

endmodule