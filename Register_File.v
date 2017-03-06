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

input [3:0]Aaddr;// data address A
input [3:0]Baddr;// data address B
input [3:0]Caddr;// data address C for which register to write into 

input [15:0] C;// data input port for data that will be written 

//when asserted, all register values should be set to 0
input clr;// clear signal
// when asserted, rising edge on clk causes data input on C to be stored in Caddr
input load;// load signal, used for enabling write 

input clk;// rising edge trigger clock

// creates a 16 X 16 Register file 
//   number of bits X number of registers 
reg [15:0] register [15:0];
// Dont think Aaddr==4'b000, i think it should be if clr then clear the data.                                       
assign A= (Aaddr== 4'b0000) ? 16'b0000_0000_0000_0000 : register[Aaddr];
assign B= (Baddr== 4'b0000) ? 16'b0000_0000_0000_0000 : register[Baddr];

always @(posedge clk)
begin 

if(load== 1'b1)
    begin 
        register[Caddr]<=C;
    end
end


endmodule
