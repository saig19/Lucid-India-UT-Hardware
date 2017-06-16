////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: ttllogicctr_synthesis.v
// /___/   /\     Timestamp: Mon May 22 22:52:49 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim ttllogicctr.ngc ttllogicctr_synthesis.v 
// Device	: xc6slx9-3-csg324
// Input file	: ttllogicctr.ngc
// Output file	: C:\Users\jani\Desktop\LUCID intern\ise projects\ttllogic ctr\ttlctr\netgen\synthesis\ttllogicctr_synthesis.v
// # of Modules	: 1
// Design Name	: ttllogicctr
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module ttllogicctr (
  ip, clk, reset, op
);
  input ip;
  input clk;
  input reset;
  output op;
  wire ip_IBUF_0;
  wire clk_BUFGP_1;
  wire reset_IBUF_2;
  wire prev_3;
  wire op_OBUF_4;
  wire _n0026;
  wire prev_rstpot_14;
  wire ctr_0_rstpot_15;
  wire ctr_1_rstpot_16;
  wire ctr_2_rstpot_17;
  wire ctr_3_rstpot_18;
  wire N4;
  wire GND_1_o_GND_1_o_AND_1_o1_cepot;
  wire op_dpot_21;
  wire N6;
  wire N7;
  wire [3 : 0] ctr;
  FDCE #(
    .INIT ( 1'b0 ))
  op_1 (
    .C(clk_BUFGP_1),
    .CE(GND_1_o_GND_1_o_AND_1_o1_cepot),
    .CLR(reset_IBUF_2),
    .D(op_dpot_21),
    .Q(op_OBUF_4)
  );
  IBUF   ip_IBUF (
    .I(ip),
    .O(ip_IBUF_0)
  );
  IBUF   reset_IBUF (
    .I(reset),
    .O(reset_IBUF_2)
  );
  OBUF   op_OBUF (
    .I(op_OBUF_4),
    .O(op)
  );
  FD #(
    .INIT ( 1'b0 ))
  prev (
    .C(clk_BUFGP_1),
    .D(prev_rstpot_14),
    .Q(prev_3)
  );
  FD #(
    .INIT ( 1'b0 ))
  ctr_0 (
    .C(clk_BUFGP_1),
    .D(ctr_0_rstpot_15),
    .Q(ctr[0])
  );
  FD #(
    .INIT ( 1'b0 ))
  ctr_1 (
    .C(clk_BUFGP_1),
    .D(ctr_1_rstpot_16),
    .Q(ctr[1])
  );
  FD #(
    .INIT ( 1'b0 ))
  ctr_2 (
    .C(clk_BUFGP_1),
    .D(ctr_2_rstpot_17),
    .Q(ctr[2])
  );
  FD #(
    .INIT ( 1'b0 ))
  ctr_3 (
    .C(clk_BUFGP_1),
    .D(ctr_3_rstpot_18),
    .Q(ctr[3])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  _n00261_SW0 (
    .I0(ip_IBUF_0),
    .I1(reset_IBUF_2),
    .O(N4)
  );
  LUT6 #(
    .INIT ( 64'h0000000000100000 ))
  _n00261 (
    .I0(N4),
    .I1(ctr[2]),
    .I2(ctr[3]),
    .I3(ctr[1]),
    .I4(ctr[0]),
    .I5(prev_3),
    .O(_n0026)
  );
  LUT5 #(
    .INIT ( 32'h0000FB04 ))
  ctr_0_rstpot (
    .I0(reset_IBUF_2),
    .I1(ip_IBUF_0),
    .I2(prev_3),
    .I3(ctr[0]),
    .I4(_n0026),
    .O(ctr_0_rstpot_15)
  );
  LUT6 #(
    .INIT ( 64'h00000000F0F0B4F0 ))
  ctr_1_rstpot (
    .I0(reset_IBUF_2),
    .I1(ip_IBUF_0),
    .I2(ctr[1]),
    .I3(ctr[0]),
    .I4(prev_3),
    .I5(_n0026),
    .O(ctr_1_rstpot_16)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  prev_rstpot (
    .I0(reset_IBUF_2),
    .I1(ip_IBUF_0),
    .I2(prev_3),
    .O(prev_rstpot_14)
  );
  LUT6 #(
    .INIT ( 64'h55555D5500000800 ))
  op_dpot (
    .I0(ip_IBUF_0),
    .I1(ctr[0]),
    .I2(ctr[1]),
    .I3(ctr[3]),
    .I4(ctr[2]),
    .I5(op_OBUF_4),
    .O(op_dpot_21)
  );
  LUT6 #(
    .INIT ( 64'hAAAAAA6AAAAAAAAA ))
  ctr_2_rstpot (
    .I0(ctr[2]),
    .I1(ctr[1]),
    .I2(ctr[0]),
    .I3(prev_3),
    .I4(reset_IBUF_2),
    .I5(ip_IBUF_0),
    .O(ctr_2_rstpot_17)
  );
  MUXF7   ctr_3_rstpot (
    .I0(N6),
    .I1(N7),
    .S(ctr[2]),
    .O(ctr_3_rstpot_18)
  );
  LUT5 #(
    .INIT ( 32'hAAAAAA8A ))
  ctr_3_rstpot_F (
    .I0(ctr[3]),
    .I1(ctr[1]),
    .I2(ctr[0]),
    .I3(prev_3),
    .I4(N4),
    .O(N6)
  );
  LUT6 #(
    .INIT ( 64'hAAAAAA6AAAAAAAAA ))
  ctr_3_rstpot_G (
    .I0(ctr[3]),
    .I1(ip_IBUF_0),
    .I2(ctr[0]),
    .I3(prev_3),
    .I4(reset_IBUF_2),
    .I5(ctr[1]),
    .O(N7)
  );
  BUFGP   clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_1)
  );
  INV   GND_1_o_GND_1_o_AND_1_o1_cepot_INV_0 (
    .I(prev_3),
    .O(GND_1_o_GND_1_o_AND_1_o1_cepot)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

