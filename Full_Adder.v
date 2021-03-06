`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module Full_Adder( A, B, S, Cin, Cout); 
input  A; 
input  B; 
input  C; 
output S; 
output Cout;  
wire w;  


assign w = A ^ B; 
assign S = w ^ Cin; 
assign Cout = (A & B) | (w & Cin);  


endmodule
