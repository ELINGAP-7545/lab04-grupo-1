`timescale 1ns / 1ps


module BCDtoSSeg_TB;
		reg [15:0] num;
		reg clk2;
		reg rst;

	// Outputs
		wire [0:6] sseg;
		wire [3:0] an;


	initial begin
	clk2= 0;
		rst = 1;
		#10 rst =0;
		
		num = 16'h4321;

		BCD = 0; #10;
		BCD = 1; #10;
		BCD = 2; #10;
		BCD = 3; #10;
		BCD = 4; #10;
		BCD = 5; #10;
		BCD = 6; #10;
		BCD = 7; #10;
		BCD = 8; #10;
		BCD = 9; #10;

	end

   initial begin: TEST_CASE
     $dumpfile("BCDtoSSeg_TB.vcd");
     #(200) $finish;
   end

endmodule
