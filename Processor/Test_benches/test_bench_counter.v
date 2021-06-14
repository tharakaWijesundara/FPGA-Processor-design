`timescale 1ns/1ns

module test_bench_counter();

    reg clk;
    reg [5:0] IRIn;
    reg start;
    wire [5:0] mIR;
    wire [5:0] IROut;

    counter COUNTER(.clk(clk), .IRIn(IRIn), .start(start), .mIR(mIR), .IROut(IROut));
    reg [5:0] addresses [32:0];

    always #25 clk=~clk;
    integer write_data;
    integer j = 0;
    integer i = 0;
    
	initial begin
	    write_data = $fopen("counter_out_TB.txt", "w");

        addresses[0] = 6'd1;
        addresses[1] = 6'd4;
        addresses[2] = 6'd8;
        addresses[3] = 6'd12;
        addresses[4] = 6'd14;
        addresses[5] = 6'd16;
        addresses[6] = 6'd18;
        addresses[7] = 6'd21;
        addresses[8] = 6'd24;
        addresses[9] = 6'd27;
        addresses[10] = 6'd30;
        addresses[11] = 6'd33;
        addresses[12] = 6'd36;
        addresses[13] = 6'd37;
        addresses[14] = 6'd38;
        addresses[15] = 6'd39;
        addresses[16] = 6'd40;
        addresses[17] = 6'd41;
        addresses[18] = 6'd42;
        addresses[19] = 6'd43;
        addresses[20] = 6'd44;
        addresses[21] = 6'd45;
        addresses[22] = 6'd46;
        addresses[23] = 6'd47;
        addresses[24] = 6'd48;
        addresses[25] = 6'd49;
        addresses[26] = 6'd50;
        addresses[27] = 6'd51;
        addresses[28] = 6'd52;
        addresses[29] = 6'd54;
        addresses[30] = 6'd55;
        addresses[31] = 6'd56;
        addresses[32] = 6'd57;

        
        clk = 1;
	    #50;
        start = 1;
        for(j=0; j < 33; j=j+1) begin
            IRIn = addresses[j];
            for(i=0; i< (addresses[j+1] - addresses[j]); i=i+1) begin
		        #5;
                $fdisplay(write_data, "SM - %d", mIR);
                if((addresses[j] != 6'd1) && (i == (addresses[j+1] - addresses[j] - 1))) begin
                    $fdisplay(write_data, "Reset - %d", IROut);
                end
                #45;
            end
        end
        
    end

endmodule