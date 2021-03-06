`timescale 1ns / 1ps

module Add(A, B, Cin, S, Cout); 
input  [15:0]  A, B; 
input  Cin;
output [15:0] S;  
output Cout; 
wire[15:0] tempSum, tempCin;  

Full_Adder Bit0 (.A(A[0]), .B(B[0]), .Cin(Cin), .S(tempSum[0]), .Cout(tempCin[1])); Full_Adder Bit1 (.A(A[1]), .B(B[1]), .Cin(tempCin[1]), .S(tempSum[1]), .Cout(tempCin[2])); 
Full_Adder Bit2 (.A(A[2]), .B(B[2]), .Cin(tempCin[2]), .S(tempSum[2]), .Cout(tempCin[3])); Full_Adder Bit3 (.A(A[3]), .B(B[3]), .Cin(tempCin[3]), .S(tempSum[3]), .Cout(tempCin[4])); 
Full_Adder Bit4 (.A(A[4]), .B(B[4]), .Cin(tempCin[4]), .S(tempSum[4]), .Cout(tempCin[5])); Full_Adder Bit5 (.A(A[5]), .B(B[5]), .Cin(tempCin[5]), .S(tempSum[5]), .Cout(tempCin[6]));
Full_Adder Bit6 (.A(A[6]), .B(B[6]), .Cin(tempCin[6]), .S(tempSum[6]), .Cout(tempCin[7])); Full_Adder Bit7 (.A(A[7]), .B(B[7]), .Cin(tempCin[7]), .S(tempSum[7]), .Cout(tempCin[8])); 
Full_Adder Bit8 (.A(A[8]), .B(B[8]), .Cin(tempCin[8]), .S(tempSum[8]),  .Cout(tempCin[9])); Full_Adder Bit9 (.A(A[9]), .B(B[9]), .Cin(tempCin[9]), .S(tempSum[9]),  .Cout(tempCin[10])); 
Full_Adder Bit10 (.A(A[10]), .B(B[10]), .Cin(tempCin[10]), .S(tempSum[10]), .Cout(tempCin[11])); Full_Adder Bit11 (.A(A[11]), .B(B[11]), .Cin(tempCin[11]), .S(tempSum[11]), .Cout(tempCin[12])); 
Full_Adder Bit12 (.A(A[12]), .B(B[12]), .Cin(tempCin[12]), .S(tempSum[12]), .Cout(tempCin[13])); Full_Adder Bit13 (.A(A[13]), .B(B[13]), .Cin(tempCin[13]), .S(tempSum[13]), .Cout(tempCin[14])); 
Full_Adder Bit14 (.A(A[14]), .B(B[14]), .Cin(tempCin[14]), .S(tempSum[14]), .Cout(tempCin[15])); Full_Adder Bit15 (.A(A[15]), .B(B[15]), .Cin(tempCin[15]), .S(tempSum[15]), .Cout(Cout));  

assign S = tempSum; 

endmodule
