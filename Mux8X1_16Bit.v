`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2017 12:01:27 PM
// Design Name: 
// Module Name: Mux8X1_16Bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux8X1_16Bit (s,I0,I1,I2,I3,I4,I5,I6,I7,E,out);
input [2:0]s;
input [15:0]I0,I1,I2,I3,I4,I5,I6,I7;
input E;
output [15:0]out;

// outputs from MUX A [4-1] 
wire [15:0] IA1,IA2,IA3,IA4;

// outputs from MUX B [2-1] 
wire [15:0] IB1,IB2;


//module Mux2X1_16Bit (s,a,b,E,out);
Mux2X1_16Bit MUXA1 (s[0],I0,I1,E,IA1);
Mux2X1_16Bit MUXA2 (s[0],I2,I3,E,IA2);
Mux2X1_16Bit MUXA3 (s[0],I4,I5,E,IA3);
Mux2X1_16Bit MUXA4 (s[0],I6,I7,E,IA4);

Mux2X1_16Bit MUXB1 (s[1],IA1,IA2,E,IB1);
Mux2X1_16Bit MUXB2 (s[1],IA3,IA4,E,IB2);

Mux2X1_16Bit MUXC1 (s[2],IB1,IB2,E,out);

endmodule
