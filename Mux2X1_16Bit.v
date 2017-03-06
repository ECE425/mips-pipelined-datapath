`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2017 02:39:42 AM
// Design Name: 
// Module Name: Mux2X1_16Bit
// Purpose: Structural model for a 16-bit 2-to-1 MUX 
//////////////////////////////////////////////////////////////////////////////////


module Mux2X1_16Bit (s,a,b,E,out);
input s;
input [15:0]a;
input [15:0]b;
input E;
output [15:0]out;

wire inv_s;
wire [15:0]f1;
wire [15:0]f2;

not not1(inv_s,s);
and and1[15:0](f1,a,inv_s,E);
and and2[15:0](f2,b,s,E);

//Output
or or1[15:0](out,f1,f2);


endmodule

