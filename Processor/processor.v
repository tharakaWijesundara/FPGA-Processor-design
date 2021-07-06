module processor (
    input clk,
    input start,
    output reg finish_process
);
reg begin_process = 0;
localparam NO_OF_CORES = 6;
reg[4:0] NO_OF_ROWS = 19;

localparam INSTRUCTION_LEN = 6;
localparam ALU_SIG_LEN = 3;
localparam C_BUS_SIG_LEN = 11;
localparam DATA_LEN = 16;
localparam SM_SIG_LEN = 6;
localparam MUX_SEL_SIG = 4;
localparam ADDRESS_LEN = 12;



reg [NO_OF_CORES - 1:0] start_cores;
wire [NO_OF_CORES - 1:0] finish_cores;
wire [NO_OF_CORES - 1:0] read_signal;
wire [NO_OF_CORES - 1:0] write_signal;
reg [NO_OF_CORES - 1:0] reset_signals;


wire [ADDRESS_LEN * NO_OF_CORES - 1:0] address;
wire [DATA_LEN * NO_OF_CORES - 1:0] data_in;
wire [DATA_LEN * NO_OF_CORES - 1:0] data_out;

reg read;
reg write;

reg [2:0] running_cores = 0;

integer k;

always @(read_signal) begin
	read = 1;
    for(k=0; k<running_cores; k=k+1) begin
        if(k < NO_OF_CORES) begin
            read = read & read_signal[k];
        end
    end
end

always @(write_signal) begin
	write = 0;
    for(k=0; k<running_cores; k=k+1) begin
        if(k < NO_OF_CORES) begin
            write = write | write_signal[k];
        end
    end
end

genvar c;

generate 
    for(c=0; c<NO_OF_CORES; c=c+1) begin : CORE
        top_module #(
                .ADDRESS_LEN(ADDRESS_LEN),
                .INSTRUCTION_LEN(INSTRUCTION_LEN),
                .ALU_SIG_LEN(ALU_SIG_LEN),
                .C_BUS_SIG_LEN(C_BUS_SIG_LEN),
                .DATA_LEN(DATA_LEN),
                .SM_SIG_LEN(SM_SIG_LEN),
                .MUX_SEL_SIG(MUX_SEL_SIG)
            ) 
            INS
            (
                .clk(clk), 
                .start(start_cores[c]), 
                .read(read_signal[c]), 
                .write(write_signal[c]), 
                .ram_addr(address[ADDRESS_LEN*c +: ADDRESS_LEN]), 
                .ram_in(data_in[DATA_LEN*c +: DATA_LEN]), 
                .ram_out(data_out[DATA_LEN*c +: DATA_LEN]), 
                .finish(finish_cores[c]),
                .reset(reset_signals[c])
            );
    end
endgenerate

ram #(
    .DATA_LEN(DATA_LEN),
    .ADDRESS_LEN(ADDRESS_LEN),
    .NO_OF_CORES(NO_OF_CORES)
)
RAM(
    .clk(clk), 
    .read(read),
    .write(write),
    .address(address),
    .data_in(data_in),
    .data_out(data_out)
);

integer round;
integer start_rest = 0;

always @(posedge clk) begin
	if(start == 1  && start_rest==0)	begin
		if(begin_process == 1)		begin_process <= 0;
		else						begin_process <= 1;
	end
end

integer i;
integer j;



always @(address or finish_cores or begin_process) begin

    if(begin_process  && start_rest==0 ) begin
        if(NO_OF_ROWS >= NO_OF_CORES) begin
            for(i=0; i<NO_OF_CORES; i=i+1)begin
                start_cores[i] = 1'b1;
            end
            running_cores = NO_OF_CORES;
            NO_OF_ROWS = NO_OF_ROWS - NO_OF_CORES;
        end
        else begin
            for(i=0; i<NO_OF_ROWS; i=i+1)begin
                if(i<NO_OF_CORES)	start_cores[i] = 1'b1;
            end
            running_cores = NO_OF_ROWS;
            NO_OF_ROWS = 0;
        end
        // begin_process <= 0;
        round = 1;
        start_rest = 1;
    end
    else begin
        
        if(start_rest == 1) begin
            if(round == 1)begin : round_one
                ///// set the reset signlas to 0 /////
                // if(NO_OF_ROWS > NO_OF_CORES) begin
                //     for(j=0; j<NO_OF_CORES; j=j+1)begin
                //         reset_signals[j] = 0;
                //     end
                // end
                // else begin
                   
                //     for(j=0; j<NO_OF_ROWS; j=j+1)begin
                //         if(j<NO_OF_CORES)	reset_signals[j] = 0;  
                //     end
                // end   
                if(address[ADDRESS_LEN - 1:0] === 12'd0) begin
                    for(j=0; j<running_cores; j=j+1)begin
                        if(j<NO_OF_CORES)	reset_signals[j] = 0;  
                    end
                end

  
                //////////////////////////////////////
                for(j = 0; j<running_cores; j=j+1)begin
					if(j < NO_OF_CORES) begin
                        if(address[j * ADDRESS_LEN +: ADDRESS_LEN] !== {12'd5})  disable round_one;
				    end
                end
                
                for(j = 1; j<running_cores; j=j+1) begin
					if(j < NO_OF_CORES) begin
                        start_cores[j] = 0;
					end
                end
                round = round + 1;
            end
            else if (round == 0) begin : round_end
                for(j = 0; j<running_cores; j=j+1)begin
					if(j < NO_OF_CORES) begin
                        if(finish_cores[j] !== 1'b1)  disable round_end;
				    end
                end
                
                if(NO_OF_ROWS > 0) begin
                    if(NO_OF_ROWS > NO_OF_CORES) begin
                        for(j=0; j<NO_OF_CORES; j=j+1)begin
                            reset_signals[j] = 1;
                        end
                        running_cores = NO_OF_CORES;
                        NO_OF_ROWS = NO_OF_ROWS - NO_OF_CORES;
                    end    
                    else begin
                        for(j=0; j<NO_OF_ROWS; j=j+1)begin
                            if(j<NO_OF_CORES)	reset_signals[j] = 1;
                            
                        end
                        for(j=0; j<NO_OF_CORES; j=j+1)begin 
                            if(j >= NO_OF_ROWS)     start_cores[j] = 0;
                        end
                        running_cores = NO_OF_ROWS;
                        NO_OF_ROWS = 0;
                        
                    end
                    round = 1;

                end
                else if(&finish_cores == 1)    finish_process <= 1;
            end
            else begin
                if(address[(round-2)*ADDRESS_LEN +: ADDRESS_LEN] === {12'd23}) begin
                    if(round - 1 == running_cores) begin
                        for(j = 0; j<running_cores; j=j+1) begin
                            if(j < NO_OF_CORES)		start_cores[j] = 1;
                        end
                        round = 0;
                    end
                    else begin
                        start_cores[round - 2] = 0;
                        start_cores[round - 1] = 1;
                        round = round + 1;
                    end
                end

            end
        end
        
    end
end

endmodule

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// module processor (
//     input clk,
//     input start,
//     output finish
// );

// wire read;
// wire write;
// wire [15:0] ram_addr;
// wire [15:0] ram_in;
// wire [15:0] ram_out;

// top_module CORE_ONE(.clk(clk), 
//                     .start(start), 
//                     .read(read), 
//                     .write(write), 
//                     .ram_addr(ram_addr), 
//                     .ram_in(ram_in), 
//                     .ram_out(ram_out), 
//                     .finish(finish));

// ram RAM(.clk(clk), 
//         .read(read),
//         .write(write),
//         .address(ram_addr),
//         .data_in(ram_in),
//         .data_out(ram_out));

    
// endmodule