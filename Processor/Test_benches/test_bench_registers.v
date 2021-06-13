`timescale 1ns/1ns

module test_bench_registors();
    reg [15:0] DR_in;
    reg [15:0] c_bus_in;
    reg [15:0] ram_in;
    reg [5:0] counter_in;
    reg clk;
    reg LDIR;
    reg WE;
    reg read;
    reg inc;
    wire [5:0] IR_data_out;
    wire [15:0] data_out;

    parameter check_reg = 3; // 0 - IR, 1 - DR, 2 - REG, 3 - REG_INC

    if(check_reg == 0)          ins_registor IR(.DR_in(DR_in), .counter_in(counter_in), .clk(clk), .LDIR(LDIR), .data_out(IR_data_out));
    else if(check_reg == 1)     data_registor DR(.c_bus_in(c_bus_in), .ram_in(ram_in), .clk(clk), .WE(WE), .read(read), .data_out(data_out));
    else if(check_reg == 2)     registor_no_inc REG(.c_bus_in(c_bus_in), .clk(clk), .WE(WE), .data_out(data_out));
    else if(check_reg == 3)     registor_with_inc REG_INC(.c_bus_in(c_bus_in), .clk(clk), .WE(WE), .data_out(data_out), .inc(inc));
    
    always #25 clk=~clk;

    initial begin
        clk = 1;

        if(check_reg == 0) begin
            DR_in = 16'd55;
            counter_in = 6'd25;

            // Test 1
            LDIR = 1;
            #5;
            if(IR_data_out == DR_in[5:0])   $monitor("Passed Test 1");
            else                            $monitor("Failed Test 1");
            #45;

            // Test 2
            LDIR = 0;
            #5;
            if(IR_data_out == counter_in)   $monitor("Passed Test 2");
            else                            $monitor("Failed Test 2");
            #45;

        end

        else if(check_reg == 1) begin
            c_bus_in = 16'd264;
            ram_in = 16'd546;
            WE = 1;

            // Test 3
            read = 1;
            #5;
            if(data_out == ram_in)          $monitor("Passed Test 3");
            else                            $monitor("Failed Test 3");
            #45;   

            // Test 4
            read = 0;
            #5;
            if(data_out == c_bus_in)        $monitor("Passed Test 4");
            else                            $monitor("Failed Test 4");  
            #45; 

        end

        else if(check_reg == 2) begin
            WE = 1;
            c_bus_in = 16'd155;
            
            // Test 5
            #5;
            if(data_out == c_bus_in)        $monitor("Passed Test 5");
            else                            $monitor("Failed Test 5");  
            #45;             
        end
        else begin
            WE = 1;
            c_bus_in = 16'd463;
            
            // Test 6
            inc = 0;
            #5;
            if(data_out == c_bus_in)        $monitor("Passed Test 6");
            else                            $monitor("Failed Test 6");  
            #45;

            // Test 7
            inc = 1;
            #5;
            if(data_out == c_bus_in + 1)    $monitor("Passed Test 7");
            else                            $monitor("Failed Test 7");  
            #45;
        end
    end

endmodule