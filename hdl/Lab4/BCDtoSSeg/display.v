`timescale 1ns / 1ps
module display(
    input [15:0] num,
    input clk,
    output [0:6] sseg,
    output reg [3:0] an,
	 input rst,
	 output led
    );



reg [3:0]BCD=0;
//wire [15:0] num=16'h4321;
 
BCDtoSSeg bcdtosseg(.BCD(BCD), .SSeg(sseg));

reg [26:0] cfreq=0; 
wire enable;

// Divisor de frecuecia

assign enable = cfreq[16];
assign led =enable;
always @(posedge clk) begin
  if(rst==1) begin
		cfreq <= 0;
	end else begin
		cfreq <=cfreq+1;
	end
end   //se utiliza cuando se va hacer la configuracion de la FPGA

reg [1:0] count =0;
always @(posedge enable) begin  //primera maquina de estado dependemos del estado del enable
		if(rst==1) begin //reset del sistema, segunda maquina de estado
			count<= 0;
			an<=4'b1111; //corrimiento de los anodos
		end else begin 
			count<= count+1; //contador para el estado de los display
			an<=4'b1101; 
			case (count) 
				2'h0: begin BCD <= num[3:0];   an<=4'b1110; end 
				2'h1: begin BCD <= num[7:4];   an<=4'b1101; end 
				2'h2: begin BCD <= num[11:8];  an<=4'b1011; end 
				2'h3: begin BCD <= num[15:12]; an<=4'b0111; end 
			endcase
		end
end



endmodule
