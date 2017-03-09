`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2017 08:58:19 PM
// Design Name: 
// Module Name: PC_Sim
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


module PC_Sim();
reg clk;
wire [15:0]pc;// current PC: : goes to Instruction Memory and Instruction Address Incremnet

reg reset;
//reg [15:0]new_pc;// new instruction address
wire [15:0]new_pc_inc;// incremented program counter from Full Adder
wire pc_V;// OverFlow
wire pc_cout;// Cout value 

PC ProgramCounter(pc,clk,reset,new_pc_inc);

Full_Adder_2s_16Bits PC_Increment (new_pc_inc,pc_V,pc_cout,pc,16'b0000_0000_0000_0001,1'b0);

initial begin
    clk=0;
    reset=1'b0;
   #5 reset=1'b1;
   #5 reset=1'b0;
    //new_pc_inc=0;
    end
always
    begin
    #5 clk=!clk;
    end
   initial
   #100 $finish;
   
endmodule
