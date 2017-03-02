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
input Cin;                      // Carry in value
input [2:0]opcod;               // Operation Select
output[15:0]out;                // result 
output V;                       // overflow
output Cout;                    // Carryout
output lt;                      // comparator indicator less than 
output eq;                      // comparator indicator equal to 
output gt;                      // comparator indicator greater than 

wire [15:0] AND, OR, S;         // Wire outputs from AND Gate, OR Gate and Carry_Adder_Sub_op
wire [15:0] Xa, Ya;         // Wire outputs from MUX Invertor Xin and Yin, to determine if x or y will be determined
wire Less;                      // Wire for SLT instruction
wire [15:0] Xinvert, Yinvert;

//******Pre-Instruction Operations******
//Purpose: Invert the signal X or Y (16bits) to be used for branch instruction and 2's comp subtraction 
invertor A(Xinvert,X);
invertor B(Yinvert,Y);
//Purpose: Mux will select between inverted x or inverted y; select x and y; 
invertMUXop Xin(Xa,X,Xinvert,opcod);              // opcod will need to be defined as specific bits 
invertMUXop Yin(Ya,Y,Yinvert,opcod);              // opcod will need to be defined as specific bits

//*****Instruction Operations******
//Purpose: AND gate will be used for one of the ALU Instructions 
andop ALUand(AND,Xa,Ya);
//Purpose: OR gate will be used for one of the ALU Instructions
orop ALUor(OR, Xa,Ya);
//Purpose: Will do the arithmetic for ADD,SUB both 2's comp and unsigned and signed 16bits
Full_Adder_16Bits ALUadder(out,V,X,Y,Cin);

//*****Selection for output*****
//Purpose: MUX 4X1 will select which instructions computation to output depending on Opcod



endmodule
