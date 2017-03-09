`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2017 12:23:02 PM
// Design Name: 
// Module Name: MIPSDataPath_16Bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
//THE WHOLE ENCHILADA TOP TOP

module MIPSDataPath_16Bit(clk,reset,new_pc,new_pc_offset,new_pc_inc,pc_instr,Instr,control);
input clk;
input reset;

//wire [15:0]offset;// sign extended offset 
//***Program Counter Wires
wire [15:0]pc_instr;// current program counter from PC
wire [15:0]new_pc;// incremented/modified program counter selected from MUX
wire [15:0]new_pc_inc;// incremented program counter by 1
wire [15:0]new_pc_offset;// incremented program counter by offset addition
wire pc_V,pc_V_offset;// Overflow
wire pc_cout,pc_cout_offset;//cout 

//***Instruction from Instrcution Memory 
wire [15:0]Instr;// Output from Instruction Memory, carying insstruction

wire[3:0] Caddr;// address of C ontent

//File Register
wire [15:0] A,B;// File reg outputs (Read Data 1&2)
wire [15:0] B_ALU_data;// Output from MUX that selects sign extend or B (Read Data 2)going into ALU
wire [15:0]C;// output from data memory into File_Reg, this is data not an address

//Control Unit
wire [10:0] control;

//ALU
wire [15:0]ALUresult;
wire cin;// IDK if used 
wire ALUcout;// cout from alu 
wire ALUlt;// less than flag
wire ALUeq;// BNE flag
wire ALUv;// overflow indicator
wire ALUgt;// greater than flag

//signExtend
wire [15:0]SignExtOffset;

//DataMemory
wire [15:0]ReadData;// Read the data from data memory 

//Branch
wire BranchFlag;// Out put from AND gate if ALUeq and control[1] are true 

//*****Testing Outputs ONLY*****
output[15:0] new_pc,new_pc_inc,new_pc_offset,pc_instr;
output[15:0]Instr;
output[15:0] control;
//**** ControlUnit****
//Purpose:
//input:
//output:
ControlUnit MIPScontrol(control,Instr[15:12]);

//*** 1. Fetch Instruction and Increment PC
// Purpose:fetch the instructions. 
// input: Takes in the next instruction address(new_pc) from ProgramCounterIncrement for an increase by 1. 
//        Input can also be a jmp address or from the offset when BNE. 
// output: Output will be the current program counter instrcution (pc_instr)and take it to the instruction 
//         memory and to PCIncrement for increaseing count by 1. 
//module PC(pc,clk,reset,new_pc);
//output [15:0]pc, input clk input reset input [15:0] new_pc
PC ProgramCounter (pc_instr,clk,reset,new_pc);//***new_pc will be the output from a MUX 

// Purpose: Increment PC by 1
//module Full_Adder_2s_16Bits(output [15:0]S, output V,cout,input [15:0]X,Y, input cin);
Full_Adder_2s_16Bits PCIncrement (new_pc_inc,pc_V,pc_cout,pc_instr,16'b0000_0000_0000_0001,1'b0);
// Purpose: Increment PC by 1 and add OFFSET
Full_Adder_2s_16Bits PCOffset (new_pc_offset,pc_V_offset,pc_cout_offset,new_pc_inc,SignExtOffset,1'b0);


//*** 2. Load PC Instruction (pc_instr) into Data memory 
//Purpose: The Program counter will load its address and it would output the instruction to be executed. 
//input: It will input PC Instruction (pc_instr) which is outputted from the PC (ProgramCounter). NOTE: PC is the 
//       output after determining if there was a BNE, JMP or just a regular Plus 1 increment.
//output: The out put will be the instruction that laods the instruction into various devices in the design. 
//***Instr output datapath destination 
//[15-12] Instr => Contorl Unit 
//[11-8] Instr  => Read Reg 1 (Rs)
//[7-4] Instr   => Read Reg 2 (Rt)
//[3-0] Instr   => Sign Extend 
// Instr_Mem(Instr,PCaddr)
// output [15:0]Instr input [15:0]pc_instr
Instr_Mem InstructionMemory(Instr,pc_instr);


//*** 3. RegDst Mux2x1_4bit
//Purpose: Destination of address for register to recieve to have the address where contenet will be written too 
//input: Rt=Instr[7:4] Rd=Instr[3:0]
//output: Will be detrimined by s (select)which is an output form the control unit
//        if S=0 Caddr=Instr[7:4]  S=1 Caddr=Instr[3:0]
//module Mux2X1_4Bit (s,a,b,E,out);
//input s"select" a(4bits) b(4bits) E"enable" , output out(4bit)"Caddr"
Mux2X1_4Bit RegDst_Mux(control[0],Instr[7:4],Instr[3:0],1'b1,Caddr);


//*** 4. Register File and Sign Extend
//Purpose:
//input:
//output:
//module Register_File(A,       B,          Aaddr,            Baddr,     Caddr, C,clr,load, clk);
//          output A(16bits) B(16bits), input Instr(4bits) Instr(4bits) Caddr, C,  control[9]
//STILL NEED TO FIX C clr !!!
//control[9]=load=RegWrite in datapath 
Register_File RegFile(A,B,Instr[11:8], Instr[7:4], Caddr, C,control[9], clk);

//Sign Extend 
//Purpose:
//input: 
//output:
//module SignExt_4to16(Dout16,Din4);
SignExt_4to16 SignExtend(SignExtOffset,Instr[3:0]);


//*** 5. ALU Source and Execution 
// AluSrc Selection
//Purpose:Select between Read Data 2 (B) from Reg_File or SignExtOffset (16bits)
//input: 
//output:
//module Mux2X1_16Bit (s,a,b,E,out);
Mux2X1_16Bit ALUsrc_Mux(control[8],B,SignExtOffset,1'b1,B_ALU_data);

//***ALU
//Purpose:Select between Read Data 2 (B) from Reg_File or SignExtOffset (16bits)
//input: 
//output:
//module ALU(X,Y,out,Cout,lt,eq,gt,V,opcod);
ALU MIPSalu(A,B_ALU_data,ALUresult,ALUcout,ALUlt,ALUeq,ALUgt,ALUv,control[6:4]);
//***ALUControl


//***6. Data Memory and Memory to Register  
//Purpose:
//input: 
//output:
//module DataMemory(ReadData,ALUresultAddr,WriteData,MemWrite,MemRead,clk);
DataMemory DataMem(ReadData,ALUresult,B,control[7],control[2],clk);

//MemtoReg
//Purpose:
//input: 
//output:Output is C (data) it is passed back into the Reg_File to write the content into Reg_File on Caddr
//module Mux2X1_16Bit (s,a,b,E,out);
Mux2X1_16Bit MemtoReg_Mux(control[3],ALUresult,ReadData,1'b1,C);

//**7. Branch 
//Purpose:
//input: The Branch Contorl and the ALUeq fag are And'ed together. If both are true(equal to 1) then a Branch 
//       flag will be inputed into the Branch-MUX. 
//output:The output will be the BranchFlag that will go into the Branch_Mux. From there it will choose between 
//       a regular PC increment(new_pc_inc) or a Sign Extended Offset (SignExtOffset) Added with the PC increment (new_pc_offset).
//       The final out put will be new_pc which goes to the PC ProgramCounter
and(BranchFlag,control[1],ALUeq);

Mux2X1_16Bit BranchORIncrement_Mux(BranchFlag,new_pc_inc,new_pc_offset,1'b1,new_pc);

//***8. Jump 
// awating implimintation
endmodule
