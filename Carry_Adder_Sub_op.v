`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2017 10:34:42 PM
// Design Name: 
// Module Name: Carry_Adder_Sub_op
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


module Carry_Adder_Sub_op(S,Cout,Xa,Ya, Cin);
input Cin;
input Xa;
input Ya;           
output Cout;
output S;

wire w1,w2,w3,w4;
xor xor1 (w1.Xa,Ya);
xor xor2 (S,w1,Cin);
and and1 (w2,Xa,cin);
and and2 (w3,Ya,cin);
and and3 (w4,Xa,Ya);
or or1  (Cout,w2,w3,w4);

endmodule
