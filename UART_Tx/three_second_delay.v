`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:16:17 02/26/2017 
// Design Name: 
// Module Name:    three_second_delay 
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
module three_second_delay(clk,rst,clk_out);
input clk,rst;
output clk_out;
reg[27:0] counter;

always@(posedge clk,posedge rst)
begin
if(!rst)
counter<=28'd0;
else
if(counter==28'd150000000)
counter<=28'd0;
else
counter<=counter+1;
end

assign out_clk=counter[27];

endmodule
