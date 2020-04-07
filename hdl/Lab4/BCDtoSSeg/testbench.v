`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:17:21 09/05/2019
// Design Name:   display
// Module Name:   C:/Users/UECCI/Desktop/ejer01/display_7segx4/testbench.v
// Project Name:  display_7segx4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg [15:0] num;
	reg clk2;
	reg rst;
	reg [3:0] BCD;
	

	// Outputs
	wire [0:6] sseg;
	wire [3:0] an;
	

	// Instantiate the Unit Under Test (UUT)
	display uut ( .num(num), .clk(clk2), .sseg(sseg), .an(an), .rst(rst), .BCD(BCD));

	initial begin
		// Initialize Inputs
		clk2= 0;
		rst = 1;
		#10 rst =0;
		
		for (BCD=0;BCD<16;BCD=BCD+1) 
		clk2=0;
		rst=1;
		#10 rst=0;
		
		num = 16'h4321;
		
		BCD = 0; #16;
		BCD = 1; #16;
		BCD = 2; #16;
		BCD = 3; #16;
		BCD = 4; #16;
		BCD = 5; #16;
		BCD = 6; #16;
		BCD = 7; #16;
		BCD = 8; #16;
		BCD = 9; #16;
		BCD = 10; #16;
		BCD = 11; #16;
		BCD = 12; #16;
		BCD = 13; #16;
		BCD = 14; #16;
		BCD = 15; #16;


        

	end
	
  initial begin: TEST_CASE
     $dumpfile("testbench.vcd");
     #(200) $finish;
   end
	
endmodule 