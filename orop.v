`timescale 1ns / 1ps

module orop(OR, NewX,NewY);
input [15:0] NewX,NewY;
output [15:0] OR;


// ORing each bit individually with ouput begin OR
or(OR[0],NewX[0],NewY[0]);
or(OR[1],NewX[1],NewY[1]);
or(OR[2],NewX[2],NewY[2]);
or(OR[3],NewX[3],NewY[3]);
or(OR[4],NewX[4],NewY[4]);
or(OR[5],NewX[5],NewY[5]);
or(OR[6],NewX[6],NewY[6]);
or(OR[7],NewX[7],NewY[7]);
or(OR[8],NewX[8],NewY[8]);
or(OR[9],NewX[9],NewY[9]);
or(OR[10],NewX[10],NewY[10]);
or(OR[11],NewX[11],NewY[11]);
or(OR[12],NewX[12],NewY[12]);
or(OR[13],NewX[13],NewY[13]);
or(OR[14],NewX[14],NewY[14]);
or(OR[15],NewX[15],NewY[15]);

endmodule
