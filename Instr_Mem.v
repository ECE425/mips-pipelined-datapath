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

//////////////////////////////////////////////////////////////////////////////////
//**** OPCODE ****
//ADD Rd,Rs,Rt   (Rd=Rs+Rt)                 0010
//SUB Rd,Rs,Rt   (Rd=Rs-Rt)                 0110
//AND Rd,Rs,Rt   (Rd=Rs'*'Rt)               0000
//OR  Rd,Rs,Rt   (Rd=Rs'+'Rt)               0001
//SLT Rd,Rs,Rt   (if(Rs<Rt)Rd=1 else Rd=0)  0111
//LW  Rt,off(Rs) (Rt=M[off+Rs])             1000
//SW  Rt,off(Rs) (M[off+Rs]=Rt)             1010
//BNE Rs,Rt<off> (if(Rs!=Rt) pc=pc+off+4)    1110

module Instr_Mem(Instr,PCaddr);
output [15:0] Instr;
input [15:0] PCaddr;

reg[15:0] Instr;
reg[15:0] instr_mem [0:63];

initial 
    begin 
    // Rt=Rs*Rd 
    // opcod(4bits),RS(4bits),Rt(4bits),Rd(4bits) ADDRESSES
    //R1[1010]
    //R2[1011]
    //R3[1000]
    //R4[0100]
    //R5[1100]
    //R6[0110]
    //             opcod  R6   R1  offset
    instr_mem[0]=16'b1000_0110_1010_0000;//LW R1, offset(R6);  Load the value of 4 into register file from Data Memory  
    //             opcod  R6   R2  offset
    instr_mem[1]=16'b1000_0110_1011_0001;//LW R2, offset(R6);  Load the value of 7 into register file from Data Memory  
    //             opcod  R0   R0   R3
    instr_mem[2]=16'b0010_0000_0000_1000;//ADD R0, R0, R3;     Initialize R3 to zero to be used for stroing addition values 
    //             opcod  R0   R2   R4
    instr_mem[3]=16'b0010_0000_1011_0100;//ADD R0, R2, R4;     Initialize R4 with value R2=7 to act as a counter 
    //             opcod  R3   R1   R3
    instr_mem[4]=16'b0010_1000_1010_1000;//ADD R3, R1, R3;     Store the addition values that is incremented each time by loop 
    //             opcod  R4   R5   R4
    instr_mem[5]=16'b0110_0100_1100_0100;//SUB R3, R5, R4;     Decrement the counter value R4 by one (R5) 
    //             opcod  R4   R0   off     
    instr_mem[6]=16'b1110_0100_0000_0011;//BNE R4, R0(offset); If counter(R4)=0 end loop else go to PC[4] 
    //                                                         The offset = R0 + signext(0011) in 2's comp operation
    //                                                         The branch address will then be PC=PC+offset+1=> PC[4]  
    instr_mem[7]=16'b0001_0000_0000_0000;//N/A
    instr_mem[8]=16'b0010_0000_0000_0000;//N/A
    instr_mem[9]=16'b0010_0000_0000_0000;//N/A 
    instr_mem[10]=16'b0010_0000_0000_0000;//N/A
    
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
