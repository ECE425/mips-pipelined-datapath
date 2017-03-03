`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ECE 425: Cal Poly Pomona
// Engineer: Matthew Novoa
// 
// Create Date: 02/21/2017 10:03:15 PM: 
// Module Name: ALU
// Project Name: RISC_MicroProcessor
// Target Devices: N/A
// Tool Versions: 
// Description: Replicating instruction narrative from "Computer Organization and Design"  
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(X,Y,out,Cin,Cout,lt,eq,gt,V,opcod);
input[15:0] X, Y;               // 16 bit X and Y inputs
output[15:0]out;                // result 
input Cin;                      // Carry in value
output Cout;                    // Carryout
output lt;                      // comparator indicator less than 
output eq;                      // comparator indicator equal to 
output gt;                      // comparator indicator greater than
output V;                       // overflow
input [2:0]opcod;               // Operation Select

wire [15:0] Z4,Z5,Zeq,Zlt;// output from each operation

 
wire [15:0] S0,S1;             // Wire outputs from Unsigned Add (S0) and Signed 2's (S1)
wire [15:0] AND, OR;          // Wire outputs from AND Gate, OR Gate and Carry_Adder_Sub_op
wire [15:0] Lt;               // Wire outputs for Set on LT instruction

wire [15:0] Xinvert, Yinvert;

//******Pre-Instruction Operations******
//Purpose: Invert the signal X or Y (16bits) to be used for branch instruction and 2's comp subtraction 
//invertor A(Xinvert,X);
//invertor B(Yinvert,Y);
//Purpose: Mux will select between inverted x or inverted y; select x and y; 
//invertMUXop Xin(Xa,X,Xinvert,opcod);              // opcod will need to be defined as specific bits 
//invertMUXop Yin(Ya,Y,Yinvert,opcod);              // opcod will need to be defined as specific bits

//*****Instruction Operations******

//operation 000: unsigned Addition
//Purpsoe: Will do arithmetic for ADD,SUB in 2's comp of 16-bit number
//module Full_Adder_2s_16Bits(output [15:0]S, output V,cout,input [15:0]X,Y, input cin);
Full_Adder_2s_16Bits ALU_Unsigned_ADD(S0,V,Cout,X,Y,1'b0);

//operation 001: Signed 2's complement arithmetic
//Purpose: Will do the arithmetic for unsigned addition of 16-bit number
Full_Adder_2s_16Bits ALU_2s_Arith(S1,V,Cout,X,Y,1'b1);

//operation 010: Bitwise AND
//Purpose: AND gate will be used for one of the ALU Instructions 
andop ALUand(AND,X,Y);

//operation 011: Bitwise OR
//Purpose: OR gate will be used for one of the ALU Instructions
orop ALUor(OR, X,Y);

//operation 100: Set on less than 
//Puspose: Check to see if (X>Y). If (X>Y or X=Y) Lt=16'b0 else (X<Y) Lt=16'b1.
LessThan ALUlt(Lt,X,Y);

//operation 101: Branch if not Equal 
//Purpose: Check to see if (X=Y). If X=Y reult will send out eq flag= True(0), else eq flag=False(1) 
BranchNotEqual ALUbne(bneqF,X,Y);





//*****Selection for output*****
//Purpose: MUX 8X1 will select which instructions computation to output depending on Opcod

//S2|S0|S1|Output
// 0  0  0  ALU_Unsigned_ADD
// 0  0  1  ALU_2s_Arith
// 0  1  0  ALUand
// 0  1  1  ALUor
// 1  0  0  ALUlt (Pass out lt flag externally)
// 1  0  1  ALUbne(Pass out eq flag externally, but no arithetic result should be outputted)
// 1  1  0  N/A 16'b0
// 1  1  1  N/A 16'b0
//module Mux8X1_16Bit (s(3bits),(16bits)I0,I1,I2,I3,I4,I5,I6,I7,E,(16bits)out);
Mux8X1_16Bit ALUouputs (opcod,S0,S1,AND,OR,Lt,16'b0,16'b0,16'b0,out);


endmodule
