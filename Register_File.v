`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2017 10:44:06 AM
// Design Name: 
// Module Name: Register_File
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


module Register_File(A,B,Aaddr, Baddr, Caddr, C,clr,load, clk);
output [15:0] A;// output port
output [15:0] B;// output port
input clr;
input [3:0]Aaddr;// data address A
input [3:0]Baddr;// data address B
input [3:0]Caddr;// data address C
input [15:0] C;// data input port

//when asserted, all register values should be set to 0
input clr;// clear signal
// when asserted, rising edge on clk causes data input on C to be stored in Caddr
input load;// load signal 

input clk;// rising edge trigger clock




endmodule
