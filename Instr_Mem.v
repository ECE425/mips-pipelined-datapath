`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2017 09:15:03 PM
// Design Name: 
// Module Name: Instr_Mem
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
//**** OPCODE ****
//ADD Rd=Rs+Rt     0010
//SUB Rd=Rs-Rt     0110
//AND Rd=Rs'*'Rt   0000
//OR  Rd=Rs'+'Rt   0001
//SLT if(Rs<Rt)Rd=1 else Rd=0   0111
//LW Rd=M[off+Rs]  1000
//SW M[off+Rs]=Rt  1010
//BNE if(Rs!=Rt) pc=pc+off+4    1110

module Instr_Mem(Instr,PCaddr);
output [15:0] Instr;
input [15:0] PCaddr;

reg[15:0] Instr;
reg[15:0] instr_mem [0:63];

initial 
    begin 
    // I ONLY UNCLUDED OPCODE FOW NOW, I WILL STILL NEED TO HAVE THE ADDRESS FOR THE OTHERS
    // THIS is wher Rt=Rs*Rd will go 
    // opcod(4bits),RS(4bits),Rt(4bits),Rd(4bits) ADDRESSES
    instr_mem[0]=16'b0010_0110_0010_0100;//ADD
    instr_mem[1]=16'b0110_0110_0010_0111;//SUB
    instr_mem[2]=16'b0000_0000_0000_0000;//AND
    instr_mem[3]=16'b0001_0000_0000_0000;//OR
    instr_mem[4]=16'b0111_0000_0000_0000;//SLT
    instr_mem[5]=16'b1000_0000_0000_0000;//LW
    instr_mem[6]=16'b1010_0000_0000_0000;//SW
    instr_mem[7]=16'b1110_0000_0000_0000;//BNE
    instr_mem[8]=16'b0010_0000_0000_0000;
    instr_mem[9]=16'b0010_0000_0000_0000;
    instr_mem[10]=16'b0010_0000_0000_0000;
    
    end
    
always @(PCaddr)
    begin
        Instr= instr_mem[PCaddr];
    end
    
//***Instr output datapath destination 
//[15-12] Instr => Contorl Unit 
//[11-8] Instr  => Read Reg 1 (Rs)
//[7-4] Instr   => Read Reg 2 (Rt)
//[3-0] Instr   => Sign Extend 

endmodule
