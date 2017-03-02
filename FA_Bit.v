`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ECE 205L Lab 1
// Engineer: Matthew Novoa
//////////////////////////////////////////////////////////////////////////////////


module FA_Bit(input x,y,cin,output s,cout);

wire w1, w2, w3, w4;

xor xOR1(w1,x,y);
xor xOR2 (s,cin,w1);// sum
and and0(w2,x,y);
and and1(w3,x,cin);
and and2(w4,y,cin);//carry
or or0(cout, w2,w3,w4);// final carry

endmodule
