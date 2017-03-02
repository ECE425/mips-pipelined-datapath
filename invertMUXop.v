`timescale 1ns / 1ps

module invertMUXop(NewV,Vin,Vinvert,opcod);               // Vin= X or Y Vinvert=!X or !Y ouput will be decided based on opcode
input opcod;                                              // THIS WILL ONLY BE SPECIFIC BITS
input [15:0] Vinvert;
input [15:0] Vin;
output [15:0] NewV;
 
wire [15:0] D0;
wire [15:0] D1;

assign D0=(Vin & ~opcod);
assign D1=(Vinvert & opcod);
assign NewV=(D0|D1);

endmodule                                               //  invertMUXop
