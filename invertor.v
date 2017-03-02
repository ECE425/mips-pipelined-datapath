`timescale 1ns / 1ps


module invertor (Vinvert,V);
input [15:0] V;
output[15:0] Vinvert;

assign Vinvert=!V;                                  // this might nee to be behavioral 
endmodule
