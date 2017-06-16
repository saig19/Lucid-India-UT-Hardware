`timescale 1ns / 1ps

module uart_tx(clk_50M,rst,rx,tx,ch);

input wire clk_50M,rst;
input wire rx;
output reg tx;
output reg ch=1'b0;

reg [2:0]bit_position=3'b000;
reg [1:0]state=2'b00;
reg [7:0]data;
wire clk_baud;
integer i=1;

convert_to_baud baud1(clk_50M,rst,clk_baud);

parameter IDLE  = 2'b00;
parameter START = 2'b01;
parameter DATA  = 2'b10;
parameter STOP  = 2'b11;

reg [7:0]data_W = 8'h57;
reg [7:0]data_e = 8'h65;
reg [7:0]data__ = 8'h20;
reg [7:0]data_a = 8'h61;
reg [7:0]data_r = 8'h72;
reg [7:0]data_P = 8'h50;
reg [7:0]data_n = 8'h6E;
reg [7:0]data_v = 8'h76;
reg [7:0]data_d = 8'h64;
reg [7:0]data_R = 8'h52;
reg [7:0]data_m = 8'h6D;
reg [7:0]data_s = 8'h73;
reg [7:0]data_t = 8'h74;
reg [7:0]data_u = 8'h75;
reg [7:0]data_y = 8'h79;
reg [7:0]data_I = 8'h49;
reg [7:0]data_T = 8'h54;
reg [7:0]data_D = 8'h44;
reg [7:0]data_M = 8'h4D;
reg [7:0]data_K = 8'h4B;
reg [7:0]data_c = 8'h63;
reg [7:0]data_h = 8'h68;
reg [7:0]data_p = 8'h70;
reg [7:0]data_dot = 8'h2E;

always@(posedge clk_baud, posedge rst)
begin
	if(rst)
	begin
		state<=IDLE;
		bit_position <= 3'b000;
		tx<=1'b1;
		data<=8'b00000000;
		
		i=1;
	end
	else
	begin
		case(state)
		IDLE:
		begin
			state<=START;
			bit_position<=3'b0;
			if(i == 1)
			data <= data_W;
			else if(i == 2)
			data <= data_e;
			else if(i == 3)
			data <= data__;
			else if(i == 4)
			data <= data_a;
			else if(i == 5)
			data <= data_r;
			else if(i == 6)
			data <= data_e;
			else if(i == 7)
			data <= data__;
			else if(i == 8)
			data <= data_P;
			else if(i == 9)
			data <= data_r;
			else if(i == 10)
			data <= data_a;			
			else if(i == 11)
			data <= data_n;
			else if(i == 12)
			data <= data_a;
			else if(i == 13)
			data <= data_v;
			else if(i == 14)
			data <= data__;
			else if(i == 15)
			data <= data_a;
			else if(i == 16)
			data <= data_n;
			else if(i == 17)
			data <= data_d;
			else if(i == 18)
			data <= data__;
			else if(i == 19)
			data <= data_R;
			else if(i == 20)
			data <= data_a;
			else if(i == 21)
			data <= data_m;
			else if(i == 22)
			data <= data_dot;
			else if(i == 23)
			data <= data_W;
			else if(i == 24)
			data <= data_e;
			else if(i == 25)
			data <= data__;
			else if(i == 26)
			data <= data_s;
			else if(i == 27)
			data <= data_t;
			else if(i == 28)
			data <= data_u;
			else if(i == 29)
			data <= data_d;
			else if(i == 30)
			data <= data_y;
			else if(i == 31)
			data <= data__;
			else if(i == 32)
			data <= data_a;
			else if(i == 33)
			data <= data_t;
			else if(i == 34)
			data <= data__;
			else if(i == 35)
			data <= data_I;
			else if(i == 36)
			data <= data_I;
			else if(i == 37)
			data <= data_I;
			else if(i == 38)
			data <= data_T;
			else if(i == 39)
			data <= data_D;
			else if(i == 40)
			data <= data_M;
			else if(i == 41)
			data <= data__;
			else if(i == 42)
			data <= data_K;
			else if(i == 43)
			data <= data_a;
			else if(i == 44)
			data <= data_n;
			else if(i == 45)
			data <= data_c;
			else if(i == 46)
			data <= data_h;
			else if(i == 47)
			data <= data_e;
			else if(i == 48)
			data <= data_e;
			else if(i == 49)
			data <= data_p;
			else if(i == 50)
			data <= data_u;
			else if(i == 51)
			data <= data_r;
			else if(i == 52)
			data <= data_a;
			else if(i == 53)
			data <= data_m;
			else if(i == 54)
			data <= data_dot;			
		end
		START:
		begin
			tx <= 1'b0;
			state <= DATA;
			ch=1'b1;
		end
		DATA:
		begin
			if(bit_position == 3'b111)
				state<= STOP;
			else
			 
			bit_position <= bit_position + 1;
			tx <= data[bit_position];

		end
		STOP:
		begin
		   ch=1'b0;
			tx<=1'b1;
			if(i == 54)
			begin
				state<=IDLE;
				i=1;
			end
			else
			begin
				i=i+1;
				state<=IDLE;
			end
		end
		default:
		begin
			tx<=1'b1;
			state<=IDLE;
		end
		endcase
	end
end
assign rx=tx;
endmodule
