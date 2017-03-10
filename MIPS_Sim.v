`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2017 08:28:07 PM
// Design Name: 
// Module Name: MIPS_Sim
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


module MIPS_Sim();

reg clk;
reg reset;
//wire [15:0]new_pc_inc,new_pc_offset,new_pc;
wire [15:0]pc_instr;
wire [15:0] Instr;
wire [10:0] Control;
wire [3:0] Caddr;
wire [15:0] A,B,B_ALU_data;
wire [15:0] ALUresult;
wire [15:0] ReadData;
wire [15:0] C;
//module MIPSDataPath_16Bit(clk,reset,new_pc,new_pc_offset,new_pc_inc);
MIPSDataPath_16Bit DataPath(clk,reset,new_pc,new_pc_offset,new_pc_inc,pc_instr,Instr,Control,Caddr,A,B,B_ALU_data,ALUresult,ReadData,C);

initial begin 
clk=0;
reset=1'b0;
#5 reset=1'b1;
#5 reset=1'b0;
end

always 
    begin
    #5 clk=!clk;
    end
initial
#200 $finish;
endmodule
