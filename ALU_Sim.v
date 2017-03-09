`timescale 1ns / 1ps

module ALU_Sim();
reg [15:0]X;
reg [15:0]Y;
reg Cin;

reg [3:0]opcod;

wire V;
wire [15:0]out;
wire Cout;
wire lt;
wire eq;
wire gt;

//module ALU(X,Y,out,Cin,Cout,lt,eq,gt,V,opcod);
ALU alu1(X,Y,out,Cout,lt,eq,gt,V,opcod);


initial 

begin

//opcod:000 unsigned addition
X=1; Y=2;  opcod=3'b000;

#5 X=200; Y=300;  opcod=3'b000;

#5 X=200; Y=300;  opcod=3'b000;

#5 X=300; Y=-5;  opcod=3'b000;

//opcod:001 Signed Addition/Sub

#5 X=300; Y=200;  opcod=3'b001;

#5 X=300; Y=200;  opcod=3'b001;


//opcod:010 Bitwise AND
#5  X = 16'b1000_1000_1000_1000; Y = 16'b1111_1111_1111_1111;  opcod = 3'b010;

#5 X= 16'b0101_1010_1110_1110; Y=16'b1111_0000_1111_1100;  opcod=3'b010; 

//opcod:011 Bitwise OR
#5  X = 16'b1000_1000_1000_1000; Y = 16'b1111_1111_1111_1111;  opcod = 3'b011;

#5 X= 16'b0101_1010_1110_1110; Y=16'b1111_0000_1111_1100;  opcod=3'b011; 


#5 X=3; Y=3; opcod=3'b001;

#5 X=40; Y=22;  opcod=3'b001;

#5 X=500; Y=200;  opcod=3'b000;



end 


endmodule

