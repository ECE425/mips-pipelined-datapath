`timescale 1ns / 1ps

module dff(q,reset,data,clk);
output reg q;

input reset;
input data;
input clk;

always @(posedge clk ) //or posedge reset)

    
    if(reset) 
        begin 
        q<=1'b0;// resets the counter 
        end
    else
        begin
        q<=data;
        end


endmodule
       
