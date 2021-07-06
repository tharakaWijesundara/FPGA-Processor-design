module counter 
#(
   parameter INSTRUCTION_LEN = 6,
   parameter SM_SIG_LEN = 6
)
(
    input clk,
    input [INSTRUCTION_LEN - 1:0] IROut,
    input z_in,
    input start,
    input reset,
    output reg[SM_SIG_LEN - 1:0] smInput,
    output reg[INSTRUCTION_LEN - 1:0] IRIn
);
reg [1:0] counter = 0;
reg reset_registor;

initial begin
    reset_registor = 1;
end

always @(posedge clk) begin
    if(reset == 1)  reset_registor <= 0;
    else            reset_registor <= 1;
end


always @(posedge clk) begin
	if (reset == 1 && reset_registor == 1) begin
        counter <= 2'd0;
        IRIn <= 6'd1;
    end 
    else if(start == 1) begin
        case(IROut)
            6'd1 : begin
                case(counter)
                    2'd0 : begin
                        smInput <= 6'd1;
                        IRIn <= 6'd0;
                    end
                    2'd1 : smInput <= 6'd2;
                    2'd2 : smInput <= 6'd3; 
                    // 2'd3 : smInput <= 6'd57; // FETCH NOP
                endcase
                counter <= counter + 1;
                if(counter == 2'd2)    
                begin
                    counter <= 2'd0;  
                end
                
            end
            6'd4 : begin
                case(counter)
                    2'd0 : smInput <= 6'd4;
                    2'd1 : smInput <= 6'd5;
                    2'd2 : smInput <= 6'd6; 
                    2'd3 : smInput <= 6'd7; 
                endcase
                counter <= counter + 1;
                if(counter == 2'd3)    
                begin
                    counter <= 2'd0;
                    IRIn <= 6'd1;
                end
            end
            6'd8 : begin
                case(counter)
                    2'd0 : smInput <= 6'd8;
                    2'd1 : smInput <= 6'd9;
                    2'd2 : smInput <= 6'd10; 
                    2'd3 : smInput <= 6'd11; 
                endcase
                counter <= counter + 1;
                if(counter == 2'd3)
                begin
                    counter <= 2'd0;
                    IRIn <= 6'd1;
                end
            end
            6'd12 : begin
                case(counter)
                    2'd0 : smInput <= 6'd12;
                    2'd1 : smInput <= 6'd13;
                endcase
                counter <= counter + 1;
                if(counter == 2'd1)
                begin
                    counter <= 2'd0;
                    IRIn <= 6'd1;
                end
            end
            6'd14 : begin
                case(counter)
                    2'd0 : smInput <= 6'd14;
                    2'd1 : smInput <= 6'd15; 
                endcase
                counter <= counter + 1;
                if(counter == 2'd1)
                begin
                    counter <= 2'd0;
                    IRIn <= 6'd1;
                end
            end
            6'd16 : begin
                case(counter)
                    2'd0 : smInput <= 6'd16;
                    2'd1 : smInput <= 6'd17;
                endcase
                counter <= counter + 1;
                if(counter == 2'd1)
                begin
                    counter <= 2'd0;
                    IRIn <= 6'd1;
                end
            end
            6'd18 : begin
                case(counter)
                    2'd0 : smInput <= 6'd18;
                    2'd1 : smInput <= 6'd19;
                    2'd2 : smInput <= 6'd20;
                endcase
                counter <= counter + 1;
                if(counter == 2'd2)
                begin
                    counter <= 2'd0;
                    IRIn <= 6'd1;
                end
            end
            6'd21 : begin
                case(counter)
                    2'd0 : smInput <= 6'd21;
                    2'd1 : smInput <= 6'd22;
                    2'd2 : smInput <= 6'd23;
                endcase
                counter <= counter + 1;
                if(counter == 2'd2)
                begin
                    counter <= 2'd0;
                    IRIn <= 6'd1;
                end
            end
            6'd24 : begin
                case(counter)
                    2'd0 : smInput <= 6'd24;
                    2'd1 : smInput <= 6'd25;
                    2'd2 : smInput <= 6'd26;
                endcase
                counter <= counter + 1;
                if(counter == 2'd2)
                begin
                    counter <= 2'd0;
                    IRIn <= 6'd1;
                end
            end
            6'd27 : begin
                case(counter)
                    2'd0 : smInput <= 6'd27;
                    2'd1 : smInput <= 6'd28;
                    2'd2 : smInput <= 6'd29;
                endcase
                counter <= counter + 1;
                if(counter == 2'd2)
                begin
                    counter <= 2'd0;
                    IRIn <= 6'd1;
                end
            end
            6'd30 : begin
                case(counter)
                    2'd0 : smInput <= 6'd30;
                    2'd1 : smInput <= 6'd31;
                    2'd2 : smInput <= 6'd32;
                endcase
                counter <= counter + 1;
                if(counter == 2'd2)
                begin
                    counter <= 2'd0;
                    IRIn <= 6'd1;
                end
            end
            6'd33 : begin
                case(counter)
                    2'd0 : smInput <= 6'd33;
                    2'd1 : smInput <= 6'd34;
                    2'd2 : smInput <= 6'd35;
                endcase
                counter <= counter + 1;
                if(counter == 2'd2)
                begin
                    counter <= 2'd0;
                    IRIn <= 6'd1;
                end
            end
            6'd36 : begin
                smInput <= 6'd36;
                IRIn <= 6'd1;
            end
            6'd37 : begin
                smInput <= 6'd37;
                IRIn <= 6'd1;
            end
            6'd38 : begin
                smInput <= 6'd38;
                IRIn <= 6'd1;
            end
            6'd39 : begin
                smInput <= 6'd39;
                IRIn <= 6'd1;
            end
            6'd40 : begin
                smInput <= 6'd40;
                IRIn <= 6'd1;
            end
            6'd41 : begin
                smInput <= 6'd41;
                IRIn <= 6'd1;
            end
            6'd42 : begin
                smInput <= 6'd42;
                IRIn <= 6'd1;
            end
            6'd43 : begin
                smInput <= 6'd43;
                IRIn <= 6'd1;
            end
            6'd44 : begin
                smInput <= 6'd44;
                IRIn <= 6'd1;
            end
            6'd45 : begin
                smInput <= 6'd45;
                IRIn <= 6'd1;
            end
            6'd46 : begin
                smInput <= 6'd46;
                IRIn <= 6'd1;
            end
            6'd47 : begin
                smInput <= 6'd47;
                IRIn <= 6'd1;
            end
            6'd48 : begin
                smInput <= 6'd48;
                IRIn <= 6'd1;
            end
            6'd49 : begin
                smInput <= 6'd49;
                IRIn <= 6'd1;
            end
            6'd50 : begin
                smInput <= 6'd50;
                IRIn <= 6'd1;
            end
            6'd51 : begin
                smInput <= 6'd51;
                IRIn <= 6'd1;
            end
            6'd52 : begin
                if(z_in == 0) begin
                    case(counter)
                        2'd0 : smInput <= 6'd52;
                        2'd1 : smInput <= 6'd56;///// To remove conflicts
                        2'd2 : smInput <= 6'd53;
                        2'd3 : smInput <= 6'd56;///// To remove conflicts
                    endcase
                    counter <= counter + 1;
                    if(counter == 2'd3)
                    begin
                        counter <= 2'd0;
                        IRIn <= 6'd1;
                    end
                end
                else begin
                    case(counter) 
                        2'd0 : smInput <= 6'd54;
                        2'd1 : smInput <= 6'd56;///// To remove conflicts
                    endcase
                    counter <= counter + 1;
                    if(counter == 2'd1)
                    begin
                        counter <= 2'd0;
                        IRIn <= 6'd1;
                    end
                end

            end
            6'd58 : begin
                smInput <= 6'd58;
                IRIn <= 6'd1;
            end
            6'd59 : begin
                smInput <= 6'd59;
                IRIn <= 6'd1;
            end
            6'd55 : begin
                smInput <= 6'd55;
                IRIn <= 6'd1;
            end
            6'd56 : begin
                smInput <= 6'd56;
                IRIn <= 6'd1;
            end
            6'd57 : begin
                smInput <= 6'd57;
                IRIn <= 6'd57;
            end
            default: begin
                counter <= 2'd0;
                IRIn <= 6'd1;
                smInput <= 6'd56;
            end
        endcase
    end
end

endmodule