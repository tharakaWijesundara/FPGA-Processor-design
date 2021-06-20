`timescale 1ns/1ns

module test_bench_processor();
    wire finish_core_1;
    wire finish_core_2;
    wire finish_core_3;

    top_module Core_1(.clk(clk), .start(start), .finish(finish_core_1));
    top_module Core_2(.clk(clk), .start(start), .finish(finish_core_2));
    top_module Core_3(.clk(clk), .start(start), .finish(finish_core_3));
    
    always #50 clk=~clk;

    always @(posedge clk) begin
        if(finish == 1)     $display("Done");
        $stop;
    end
    

endmodule
