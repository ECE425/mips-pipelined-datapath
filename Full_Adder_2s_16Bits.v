`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ECE 425
// Engineer: Matthew Novoa
// Design Name: ALU
// Module Name: Full_Adder_2s_16Bits
// Purpose: A structual 16 bit 2's complement Full Adder. This device will do atithmetic for signed and unsigned 16 bit values. 
//          The input cin will take in 1'b1 for Subtraction and 1.b0 for Addition. This device uses 16 FA_Bit to complete the 16
//          bit value operation. This device also ouputs and over flow status defined by V. 
//////////////////////////////////////////////////////////////////////////////////
module Full_Adder_2s_16Bits(output [15:0]S, output V,cout,input [15:0]X,Y, input cin);

// Wire to Pass Carry Outs 
wire [14:0]c;
//c0 carry out bit of fa0->fa1
//c1 carry out bit of fa1->fa2
//c2 carry out bit of fa2->fa3
//...
//c15 carry out bit of fa15 to determine->V "overflow"

// Wire to pass 2's comp or regulaar value 
wire [15:0]B;

//two's comp when cin= 1
xor(B[0],Y[0],cin);
xor(B[1],Y[1],cin);
xor(B[2],Y[2],cin);
xor(B[3],Y[3],cin);
xor(B[4],Y[4],cin);
xor(B[5],Y[5],cin);
xor(B[6],Y[6],cin);
xor(B[7],Y[7],cin);
xor(B[8],Y[8],cin);
xor(B[9],Y[9],cin);
xor(B[10],Y[10],cin);
xor(B[11],Y[11],cin);
xor(B[12],Y[12],cin);
xor(B[13],Y[13],cin);
xor(B[14],Y[14],cin);
xor(B[15],Y[15],cin);


//xor(V,c3,c2);
 

 // Full Adder for 16 bits 
//  FA_Bit(input x,y,cin,output s,cout);
    FA_Bit fa0 (X[0],B[0],cin,S[0],c[0]);
    FA_Bit fa1 (X[1],B[1],c[0],S[1],c[1]);
    FA_Bit fa2 (X[2],B[2],c[1],S[2],c[2]);
    FA_Bit fa3 (X[3],B[3],c[2],S[3],c[3]);
    FA_Bit fa4 (X[4],B[4],c[3],S[4],c[4]);
    FA_Bit fa5 (X[5],B[5],c[4],S[5],c[5]);
    FA_Bit fa6 (X[6],B[6],c[5],S[6],c[6]);
    FA_Bit fa7 (X[7],B[7],c[6],S[7],c[7]);
    FA_Bit fa8 (X[8],B[8],c[7],S[8],c[8]);
    FA_Bit fa9 (X[9],B[9],c[8],S[9],c[9]);
    FA_Bit fa10 (X[10],B[10],c[9],S[10],c[10]);
    FA_Bit fa11 (X[11],B[11],c[10],S[11],c[11]);
    FA_Bit fa12 (X[12],B[12],c[11],S[12],c[12]);
    FA_Bit fa13 (X[13],B[13],c[12],S[13],c[13]);
    FA_Bit fa14 (X[14],B[14],c[13],S[14],c[14]);
    FA_Bit fa15 (X[15],B[15],c[14],S[15],cout);
    
    //OVERFLOW STATUS
    // v=overflow,c[14]=Cin of last adder,cout= Cout of last adder
    xor overflow(V,c[14],cout);
endmodule