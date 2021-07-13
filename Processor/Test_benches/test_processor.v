`timescale 1us/1us

module test_processor ();

    reg clk;
    always #25 clk=~clk; // 50MHz clock
    reg start;

    wire finish_process;
    processor Processor(.clk(clk), .start(start), .finish_process(finish_process));

    initial begin
    
        clk = 1;
        start = 1;
        $display("Started");
        while(finish_process !== 1) begin
            if(finish_process === 1)begin
                $display("Time - %0t", $realtime);
            end
            #1;
        end
        $stop;
    end
    
endmodule
