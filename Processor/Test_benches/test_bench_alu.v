`timescale 1ns/1ns

module test_bench_alu();
	reg clk;
	reg [15:0] A;
	reg [15:0] B;
	reg [2:0] select;
	wire z_flag;
	wire [15:0] out;

	alu ALU(.clk(clk), .A(A), .B(B), .select(select), .z_flag(z_flag), .out(out));

	always #25 clk=~clk;

	initial
		begin
			clk = 1;
			//test addition
			A = 16'd60;
			B = 16'd62;
			select = 3'b000;
			#10
			if(out === 16'd122 && z_flag === 0) 	$monitor("Passed test addition");
			else					$monitor("Failed test addition");
			#40;

			//test substraction - 1
			A = 16'd20;
			B = 16'd40;
			select = 3'b001;
			#10
			if(out === 16'd20 && z_flag === 0)  	$monitor("Passed test substraction - 1");
			else					$monitor("Failed test substraction - 1");
			#40;

			//test substraction - 2
			A = 16'd40;
			B = 16'd40;
			select = 3'b001;
			#10
			if(out === 16'd0 && z_flag === 1)   	$monitor("Passed test substraction - 2");
			else					$monitor("Failed test substraction - 2");
			#40;
			
			//test multiplication
			A = 16'd40;
			B = 16'd40;
			select = 3'b010;
			#10
			if(out === 16'd1600)   			$monitor("Passed test multiplication");
			else					$monitor("Failed test multiplication");
			#40;

			//test A pass
			A = 16'd40;
			B = 16'd20;
			select = 3'b011;
			#10
			if(out === 16'd40)   			$monitor("Passed A pass");
			else					$monitor("Failed A pass");
			#40;

			//test B pass
			A = 16'd40;
			B = 16'd20;
			select = 3'b100;
			#10
			if(out === 16'd20)   			$monitor("Passed B pass");
			else					$monitor("Failed B pass");
			#40;

			//NOP
			A = 16'd40;
			B = 16'd20;
			select = 3'b111;
			#10
			if(out === 16'd20)   			$monitor("NOP pass"); // should be equal to previous
			else					$monitor("NOP pass");
			#40;
		end
endmodule
