`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ECE 205L
// Engineer: Matthew Novoa
//////////////////////////////////////////////////////////////////////////////////


module Full_Adder_16Bits(output [15:0]S, output V,cout,input [15:0]X,Y, input cin);

// Wire to Pass Carry Outs 
wire [14:0]c;
//c0 carry out bit of fa0->fa1
//c1 carry out bit of fa1->fa2
//c2 carry out bit of fa2->fa3
//...
//c15 carry out bit of fa15 to determine->V "overflow"

//wire Y0, Y1, Y2, Y3;
 
 //xor(Y0,Y[0],OP);
// xor(Y1,Y[1],OP);
 //xor(Y2,Y[2],OP);
// xor(Y3,Y[3],OP);
 //xor(V,c3,c2);
 

 // Full Adder for 16 bits 
//  FA_Bit(input x,y,cin,output s,cout);
    FA_Bit fa0 (X[0],Y[0],cin,S[0],c[0]);
    FA_Bit fa1 (X[1],Y[1],c[0],S[1],c[1]);
    FA_Bit fa2 (X[2],Y[2],c[1],S[2],c[2]);
    FA_Bit fa3 (X[3],Y[3],c[2],S[3],c[3]);
    FA_Bit fa4 (X[4],Y[4],c[3],S[4],c[4]);
    FA_Bit fa5 (X[5],Y[5],c[4],S[5],c[5]);
    FA_Bit fa6 (X[6],Y[6],c[5],S[6],c[6]);
    FA_Bit fa7 (X[7],Y[7],c[6],S[7],c[7]);
    FA_Bit fa8 (X[8],Y[8],c[7],S[8],c[8]);
    FA_Bit fa9 (X[9],Y[9],c[8],S[9],c[9]);
    FA_Bit fa10 (X[10],Y[10],c[9],S[10],c[10]);
    FA_Bit fa11 (X[11],Y[11],c[10],S[11],c[11]);
    FA_Bit fa12 (X[12],Y[12],c[11],S[12],c[12]);
    FA_Bit fa13 (X[13],Y[13],c[12],S[13],c[13]);
    FA_Bit fa14 (X[14],Y[14],c[13],S[14],c[14]);
    FA_Bit fa15 (X[15],Y[15],c[14],S[15],cout);
    
    //OVERFLOW STATUS
    // v=overflow,c[14]=Cin of last adder,c[15]= Cout of last adder
    xor overflow(V,c[14],cout);
endmodule
