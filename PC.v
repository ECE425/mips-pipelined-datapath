`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2017 08:04:43 PM
// Design Name: 
// Module Name: PC
// Project Name: RISC_MircoProcessor

// Description: This device will ncrease program counter based on the clk. 
// 
// 
//////////////////////////////////////////////////////////////////////////////////


module PC(pc,clk,reset,new_pc);
output [15:0]pc;// current PC: : goes to Instruction Memory and Instruction Address Incremnet
input clk; 
input reset;
input [15:0]new_pc;// new instruction address

// 16 bit DFlipFlop inputs 16bits, outputs 16bits
//module dff(q,reset,data,clk);
// output reg q, input reset data clk
//dff PCdff [15:0](pc,reset,new_pc,clk);

dff PCdff1(pc[0],reset,new_pc[0],clk);
dff PCdff2(pc[1],reset,new_pc[1],clk);
dff PCdff3(pc[2],reset,new_pc[2],clk);
dff PCdff4(pc[3],reset,new_pc[3],clk);
dff PCdff5(pc[4],reset,new_pc[4],clk);
dff PCdff6(pc[5],reset,new_pc[5],clk);
dff PCdff7(pc[6],reset,new_pc[6],clk);
dff PCdff8(pc[7],reset,new_pc[7],clk);
dff PCdff9(pc[8],reset,new_pc[8],clk);
dff PCdff10(pc[9],reset,new_pc[9],clk);
dff PCdff11(pc[10],reset,new_pc[10],clk);
dff PCdff12(pc[11],reset,new_pc[11],clk);
dff PCdff13(pc[12],reset,new_pc[12],clk);
dff PCdff14(pc[13],reset,new_pc[13],clk);
dff PCdff15(pc[14],reset,new_pc[14],clk);
dff PCdff16(pc[15],reset,new_pc[15],clk);

endmodule
