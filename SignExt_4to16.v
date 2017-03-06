`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2017 11:27:50 PM
// Design Name: 
// Module Name: SignExt_4to16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 

// 
//////////////////////////////////////////////////////////////////////////////////


module SignExt_4to16(Dout16,Din4);
output [15:0]Dout16;
input [3:0]Din4;


// sign extension 
assign Dout16=Din4;

endmodule
