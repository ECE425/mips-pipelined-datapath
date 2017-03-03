`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ECE 425
// Engineer: 
// 
// Create Date: 03/03/2017 1:35:23 PM
// Module Name: BranchNotEqual
// Project Name: RISC_MicroProcessor
// Description: 
// 
//
// 
//////////////////////////////////////////////////////////////////////////////////


module BranchNotEqual (bneqF,X,Y);
output bneqF;// Not equal Flag, pass out flag not arithmetic results
//output [15:0]S;// NOT SURE IF CORRECT. Defining S as output reults, nothing is outputed. It is all or'ed to check S= 16'b0.
input [15:0] X;
input [15:0] Y;

wire V;
wire coutBNE;
wire [15:0]S;// Output the results from FA_BNE to be Or'ed to check if X=Y

//module Full_Adder_2s_16Bits(output [15:0]S, output V,cout,input [15:0]X,Y, input cin);
//                                S(16bit), overflow, coutLT, XY(16bits), 1( to do subtraction)
Full_Adder_2s_16Bits FA_BNE ( S, V, coutBNE, X, Y, 1'b1);

// if X-Y=0 bneqF will result in 0, else if X-Y!=0 bneqFwill reult in 1
or checkifEqual(bneqF,S[0],S[1],S[2],S[3],S[4],S[5],S[6],S[7],S[8],S[9],S[10],S[11],S[12],S[13],S[14],S[15]);


endmodule
