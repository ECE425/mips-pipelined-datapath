`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ECE 425
// Engineer: 
// 
// Create Date: 03/03/2017 12:39:23 PM
// Module Name: LessThan
// Project Name: 
// Description: Device will do subtraction of two input numbers. If (X>Y or X=Y) output will be S 16'b0= False. If (X<Y) output will be
//              S 16'b1=True. This indicates x-y =Negative. This devices uses Full_Adder_2s_16Bits
// 
//
// 
//////////////////////////////////////////////////////////////////////////////////


module LessThan(lt,S,X,Y);
output lt;// 1 bit Less Than Signal Flag 
output [15:0]S;
input [15:0] X;
input [15:0] Y;


//wire lt;// wire out from LessThanFlag gate to detrmine if it was negative 
wire V;// wire for overflow of operation 
wire coutLT;// Final cout for the FA_LessThan 
wire[15:0]S;// output arithmetic value from FA 
//module Full_Adder_2s_16Bits(output [15:0]S, output V,cout,input [15:0]X,Y, input cin);
//                                S(16bit), overflow, coutLT, XY(16bits), 1( to do subtraction)
Full_Adder_2s_16Bits FA_LessThan ( S, V, coutLT, X, Y, 1'b1);

// if MSB(signedbit) of S is equal to 1 (X<Y)   else if S is equal to 0 (X=Y or X>Y)
//                  lt=1                                        lt=0
and LessThanFlag(lt,1'b1,S[15]);

//16 bit masked flag output of S 16'b0 == FALSE, 16'b1 == TRUE
and AND_16flagout[15:0] (S,1'b1,lt);
endmodule
