`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:52:35 05/17/2017 
// Design Name: 
// Module Name:    ttllogicctr 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ttllogicctr(ip,op,ch,clk,reset);

input clk;
input wire ip;
reg prev = 1'b0;
input wire reset;
output reg op=1'b0;
output wire ch;
reg [3:0] ctr=4'b0000;
reg [7:0] ctr1;


baudcon baud1(clk_50M,rst,clk_baud);

assign ch=op;

always @(posedge clk,posedge reset)
	begin
	  if (reset)
		 op=1'b0;
	  else
		 begin
		 if(ip==1 && prev ==0)
		 begin
		 ctr=ctr+4'b0001;
		 prev=ip;
		 if(ctr==4'b0101)
			begin
			op=1'b1;
			ctr=4'b0000;
			ctr1=ctr1+8'b00000001;
			end
		 else
			op=1'b0;
		 end
		 else
		 prev=ip;
	end
		end
		

		
endmodule
