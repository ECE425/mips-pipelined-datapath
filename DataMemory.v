`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2017 05:01:09 PM
// Design Name: 
// Module Name: DataMemory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 

//////////////////////////////////////////////////////////////////////////////////


module DataMemory(ReadData,ALUresultAddr,WriteData,MemWrite,MemRead,clk);
output[15:0]ReadData;// Read data to write it into File_Reg
input [15:0]ALUresultAddr;// ALU calculated Address 
input [15:0]WriteData;// From ALU Read Data 2 to write result into memory 
input MemWrite;// From control unit to allow write
input MemRead; // From control unit to allow read 
input clk;

reg [15:0]ReadData;
reg [15:0] Data_Mem [0:63]; // 16 bit address with 64 slots


initial 
    begin 
    //DUMMY VALUES (data)
    Data_Mem[0]=16'b0000_0000_0000_0000;
    Data_Mem[1]=16'b0000_0000_0000_0000;
    Data_Mem[2]=16'b0000_0000_0000_0000;
    Data_Mem[3]=16'b0000_0000_0000_0000;
    Data_Mem[4]=16'b0000_0000_0000_0000;
    Data_Mem[5]=16'b0000_0000_0000_0000;
    Data_Mem[6]=16'b0000_0000_0000_0000;
    Data_Mem[7]=16'b0000_0000_0000_0000;
    Data_Mem[8]=16'b0000_0000_0000_0000;
    
    end
always @(negedge clk)

    begin 
        //enabled when control unit passes signal to write data control[7]
        if(MemWrite)
         begin
             Data_Mem[ALUresultAddr]= WriteData;
         end
    // always read data
    ReadData=Data_Mem[ALUresultAddr];
    end
    
endmodule
