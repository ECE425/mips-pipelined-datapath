`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2017 10:57:56 PM
// Design Name: 
// Module Name: ControlUnit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 

//////////////////////////////////////////////////////////////////////////////////
//  ALUopcode bits [5:3] of opcode
//T2|T1|T0|Output
// 0  0  0  ALU_Unsigned_ADD (S0)
// 0  0  1  ALU_2s_Arith (S1)
// 0  1  0  ALUand (AND)
// 0  1  1  ALUor (OR)
// 1  0  0  ALUlt (Pass out lt flag and arithmetic)(LT)
// 1  0  1  ALUbne(Pass out eq flag externally, no arithetic result should be outputted)
// 1  1  0  N/A 16'b0
// 1  1  1  N/A 16'b0
module ControlUnit(control,opcode);
output reg[10:0] control;
input[3:0] opcode;

always @(*)

case(opcode)

    // AND
    0: assign control= 11'b010_0010_0001;
    // OR
    1: assign control= 11'b010_0011_0001;
    // ADD
    2: assign control= 11'b010_0000_0001;
    // SUB
    6: assign control= 11'b010_0001_0001;
    // SLT
    7: assign control= 11'b010_0100_0001;
    // LW
    8: assign control= 11'b011_0001_1100;
    // SW
    10: assign control= 11'b001_1001_0000;
    // BNE
    14: assign control= 11'b000_0101_0010;
endcase
 
endmodule
