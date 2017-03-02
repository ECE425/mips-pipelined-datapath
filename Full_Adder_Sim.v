`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2017 08:44:19 PM
// Design Name: 
// Module Name: Full_Adder_Sim
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


module Full_Adder_Sim();
reg [15:0]X;
reg [15:0]Y;
reg Cin;

reg opcod;

wire V;
wire [15:0]out;
wire Cout;
wire lt;
wire eq;
wire gt;

ALU uut(X,Y,out,Cin,Cout,lt,eq,gt,V,opcod);


initial 

begin
X=1; Y=2; Cin=0; 

#5 X=3; Y=3; Cin=0; 

#5 X=4; Y=2; Cin=0; 

#5 X=500; Y=200; Cin=0; 

end 


endmodule
