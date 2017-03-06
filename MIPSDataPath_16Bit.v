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
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//THE WHOLE ENCHILADA TOP TOP

module MIPSDataPath_16Bit(clk,reset);
input clk;
input reset;
wire [15:0]pc_instr;// current program counter
wire [15:0]new_pc;// incremented/modified program counter selected from MUX
wire [15:0]offset;// sign extended off set 

wire [15:0]new_pc_inc;// incremented program counter by 1
wire [15:0]new_pc_offset;// incremented program counter and they
wire pc_V,pc_V_offset;
wire pc_cout,pc_cout_offset;




//*** 1. Fetch Instruction and Increment PC
// Purpose:fetch the instructions. 
// input: Takes in the next instruction address(new_pc) from ProgramCounterIncrement for an increase by 1. 
//        Input can also be a jmp address or from the offset when BNE. 
// output: Output will be the current program counter instrcution (pc_instr)and take it to the instruction 
//         memory and to PCIncrement for increaseing count by 1. 
//module PC(pc,clk,reset,new_pc);
//output [15:0]pc input clk input reset input [15:0] new_pc
PC ProgramCounter (pc_instr,clk,reset,new_pc);//***new_pc will be the output from a MUX 

// Purpose: Increment PC by 1
//module Full_Adder_2s_16Bits(output [15:0]S, output V,cout,input [15:0]X,Y, input cin);
Full_Adder_2s_16Bits PCIncrement (new_pc_inc,pc_V,pc_cout,pc_instr,16'b0000_0000_0000_0001,1'b0);
// Purpose: Increment PC by 1 and add offset
Full_Adder_2s_16Bits PCOffset (new_pc_offset,pc_V_offset,pc_cout_offset,new_pc_inc,offset);


//***ALU

//***ALUControl

//***SignExtend

//***Branch
endmodule
