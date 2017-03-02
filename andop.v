`timescale 1ns / 1ps

module andop(AND,Xa,Ya);
input [15:0] Xa,Ya;
output [15:0] AND;

and(AND[0],Xa[0],Ya[0]);
and(AND[1],Xa[1],Ya[1]);
and(AND[2],Xa[2],Ya[2]);
and(AND[3],Xa[3],Ya[3]);
and(AND[4],Xa[4],Ya[4]);
and(AND[5],Xa[5],Ya[5]);
and(AND[6],Xa[6],Ya[6]);
and(AND[7],Xa[7],Ya[7]);
and(AND[8],Xa[8],Ya[8]);
and(AND[9],Xa[9],Ya[9]);
and(AND[10],Xa[10],Ya[10]);
and(AND[11],Xa[11],Ya[11]);
and(AND[12],Xa[12],Ya[12]);
and(AND[13],Xa[13],Ya[13]);
and(AND[14],Xa[14],Ya[14]);
and(AND[15],Xa[15],Ya[15]);

endmodule
