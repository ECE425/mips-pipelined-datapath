`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2017 12:16:54 PM
// Design Name: 
// Module Name: Mux2X1_4Bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux2X1_4Bit (s,a,b,E,out);
input s;
input [3:0]a;
input [3:0]b;
input E;
output [3:0]out;

wire inv_s;
wire [3:0]f1;
wire [3:0]f2;

not not1(inv_s,s);
and and1[3:0](f1,a,inv_s,E);
and and2[3:0](f2,b,s,E);

//Output
or or1[3:0](out,f1,f2);


endmodule

