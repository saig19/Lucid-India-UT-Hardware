`timescale 1ns / 1ps

module convert_to_baud(clk,rst,clk_out);
input clk,rst;
output reg clk_out=1'b0;
reg[15:0] counter=16'b0000000000000000;

always@(posedge clk,posedge rst)
	begin
		if(rst)
		  counter<=16'b0000000000000000;
		else
			begin
			if(counter==16'd2604)
				begin
				clk_out=clk_out^1'b1;
				counter<=16'b0000000000000000;
				end
			else
			counter<=counter+16'b0000000000000001;
			end
	end

endmodule
